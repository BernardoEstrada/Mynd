// deno-lint-ignore-file no-unreachable
// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { Application, STATUS_TEXT, Status } from "oak"
import { createClient } from '@supabase/supabase-js'
import { corsHeaders } from '../_shared/cors.ts'
const app = new Application()

app.use(async (ctx) => {
  ctx.response.status = Status.Gone;
  ctx.response.body = "Deprecated endpoint";
  return

  if (ctx.request.method === 'OPTIONS') {
    ctx.response.status = Status.OK
    Object.keys(corsHeaders).forEach(key => {
      ctx.response.headers.set(key, corsHeaders[key as keyof typeof corsHeaders])
    });
    return
  }

  if (ctx.request.method !== 'GET') {
    ctx.response.status = Status.MethodNotAllowed
    ctx.response.body = STATUS_TEXT[Status.MethodNotAllowed]
    return
  }

  if (!ctx.request.url.searchParams.has('lang')) {
    ctx.response.status = Status.BadRequest
    ctx.response.body = STATUS_TEXT[Status.BadRequest]
    return
  }

  const lang = await ctx.request.url.searchParams.get('lang');
  const limit = parseInt(await ctx.request.url.searchParams.get('limit') || '5');

  if (!lang) {
    ctx.response.status = 400
    ctx.response.body = 'Missing lang'
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

  const res = await supabaseClient
    .from('researcher_questions')
    .select('id, type, question')
    .eq('response_types ( lang )', lang)
    .eq('question_response_type', 'response_types ( id )')
    .gt('expires_at', 'now()')
    .order('random()')
    .limit(limit)

    const { data, error } = res

  if (error) {
    console.error({
      error: error,
      user: supabaseClient,
    })
    ctx.response.status = 500
    ctx.response.body = error
    return
  }

  return new Response(
    JSON.stringify(data),
    { headers: { "Content-Type": "application/json" } },
  )
})

await app.listen({ port: 8000 })

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
