create policy "Can see owned buckets"
on "storage"."buckets"
as permissive
for select
to anon, authenticated
using (owner = auth.uid());


create policy "Users can see their photos"
on "storage"."objects"
as permissive
for select
to authenticated, anon
using ((bucket_id = 'img'::text) AND (owner = auth.uid()));
