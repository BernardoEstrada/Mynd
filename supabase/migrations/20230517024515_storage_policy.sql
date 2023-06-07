create policy "Only researchers can upload images"
on "storage"."objects"
as permissive
for insert
to authenticated, anon
with check (
   (bucket_id = 'img'::text)
   AND (
      NOT ((
         SELECT user_data.type
         FROM user_data
         WHERE (user_data.id = auth.uid())
      )::text = 'user'::text)
   )
);
