// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// This example shows how to use Edge Functions to read incoming multipart/form-data request,
// and write files to Supabase Storage and other fields to a database table.

import { Application, STATUS_TEXT, Status } from 'oak'
import { createClient } from '@supabase/supabase-js'
import { StorageApiError } from '@supabase/storage-js'
import { corsHeaders } from "../_shared/cors.ts";

const MB = 1024 * 1024

const app = new Application()

app.use(async (ctx) => {
  if (ctx.request.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  if (ctx.request.method !== 'POST') {
    ctx.response.status = Status.MethodNotAllowed
    ctx.response.body = STATUS_TEXT[Status.MethodNotAllowed]
    return
  }

  if (!ctx.request.hasBody) {
    ctx.response.status = 400
    ctx.response.body = 'Missing body'
    return
  }

  const body = ctx.request.body({ type: 'form-data' })
  const formData = await body.value.read({
    // Need to set the maxSize so files will be stored in memory.
    // This is necessary as Edge Functions don't have disk write access.
    // We are setting the max size as 10MB (an Edge Function has a max memory limit of 150MB)
    // For more config options, check: https://deno.land/x/oak@v11.1.0/mod.ts?s=FormDataReadOptions
    maxSize: 10 * MB,
  })
  if (!formData.files || !formData.files.length) {
    ctx.response.status = 400
    ctx.response.body = 'missing file'
    return
  }

  const options = {
    global: {
      headers: { Authorization: ctx.request.headers.get('Authorization')! },
    },
  }

  const supabaseClient = createClient(
    // Supabase API URL - env var exported by default.
    Deno.env.get('SUPABASE_URL')!,
    // Supabase API ANON KEY - env var exported by default.
    Deno.env.get('SUPABASE_ANON_KEY')!,
    options
  )

  const userId = (await supabaseClient.auth.getUser()).data?.user?.id;

  const fileFront = formData.files.filter((f) => f.name === 'front')[0]
  const fileBack = formData.files.filter((f) => f.name === 'back')[0]

  const { data: uploadFront, error: uploadErrorFront } =
    await supabaseClient.storage
      .from('img')
      .upload(
        `ids/${userId || +new Date()}-front.${
          fileFront.contentType.split('/')[1]
        }`,
        fileFront.content!.buffer,
        {
          contentType: fileFront.contentType,
          cacheControl: '3600',
          upsert: false,
        }
      )

  const { data: uploadBack, error: uploadErrorBack } =
    await supabaseClient.storage
      .from('img')
      .upload(
        `ids/${userId || +new Date()}-back.${
          fileBack.contentType.split('/')[1]
        }`,
        fileBack.content!.buffer,
        {
          contentType: fileBack.contentType,
          cacheControl: '3600',
          upsert: false,
        }
      )
  if (uploadErrorFront || uploadErrorBack) {
    console.error({ error: uploadErrorFront || uploadErrorBack, user: supabaseClient })
    let status =
      (((uploadErrorFront || uploadErrorBack) as StorageApiError).status as Status) ||
      Status.InternalServerError
    if (status === Status.Forbidden || status === Status.Unauthorized) {
      status = Status.NotFound
    }
    ctx.response.status = status
    ctx.response.body = {
      message: 'Fail to add the record',
      error: STATUS_TEXT[status],
    }
    return
  }

  ctx.response.status = Status.Created
  ctx.response.body = {
    pathFront: `${Deno.env.get(
      'SUPABASE_URL'
    )!}/storage/v1/object/authenticated/img/${uploadFront.path}`,
  pathBack: `${Deno.env.get(
      'SUPABASE_URL'
    )!}/storage/v1/object/authenticated/img/${uploadBack.path}`,
  }
})
await app.listen({ port: 8000 })

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
