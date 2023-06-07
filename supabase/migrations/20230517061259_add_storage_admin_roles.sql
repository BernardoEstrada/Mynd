create policy "Admin"
on "storage"."buckets"
as permissive
for all
to service_role, supabase_replication_admin
using (true)
with check (true);


create policy "Admin"
on "storage"."objects"
as permissive
for all
to supabase_replication_admin, service_role
using (true)
with check (true);



