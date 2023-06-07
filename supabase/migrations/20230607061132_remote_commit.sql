create extension if not exists "pgaudit" with schema "extensions";

create extension if not exists "postgis" with schema "extensions";


drop policy "Only Users and researchers can update/delete/read questions" on "public"."responses_bool";

drop policy "Only Users and researchers can update/delete/read questions" on "public"."responses_float8";

drop policy "Only Users and researchers can update/delete/read questions" on "public"."responses_int8";

drop policy "Only Users and researchers can update/delete/read questions" on "public"."responses_varchar";

drop policy "Only users can manage their data" on "public"."user_data";

alter table "public"."responses_bool" drop constraint "responses_bool_user_id_fkey";

alter table "public"."responses_float8" drop constraint "responses_float8_user_id_fkey";

alter table "public"."responses_int8" drop constraint "responses_int8_user_id_fkey";

alter table "public"."responses_varchar" drop constraint "responses_varchar_question_id_fkey";

alter table "public"."responses_varchar" drop constraint "responses_varchar_user_id_fkey";

alter table "public"."user_data" drop constraint "user_data_type_check";

alter table "public"."responses_varchar" drop constraint "responses_varchar_pkey";

alter table "public"."responses_bool" drop constraint "responses_bool_pkey";

alter table "public"."responses_float8" drop constraint "responses_float8_pkey";

alter table "public"."responses_int8" drop constraint "responses_int8_pkey";

drop index if exists "public"."responses_bool_pkey";

drop index if exists "public"."responses_float8_pkey";

drop index if exists "public"."responses_int8_pkey";

drop index if exists "public"."responses_varchar_pkey";

drop table "public"."responses_varchar";

create table "public"."attack_reports" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "created_at" timestamp with time zone default now(),
    "rate" smallint not null,
    "accompanied" boolean not null,
    "identify_source" boolean not null,
    "get_away" boolean not null,
    "can_act" boolean not null,
    "related_to_people" boolean not null,
    "location" geography(Point,4326),
    "notes" text,
    "safe" boolean not null,
    "deleted" boolean not null default false
);


alter table "public"."attack_reports" enable row level security;

create table "public"."question_reports" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "reported_by" uuid not null,
    "report_type" uuid not null,
    "question_id" uuid not null
);


alter table "public"."question_reports" enable row level security;

create table "public"."report_types" (
    "id" uuid not null default gen_random_uuid(),
    "value" jsonb not null,
    "icon" text
);


alter table "public"."report_types" enable row level security;

create table "public"."responses_text" (
    "question_id" uuid not null,
    "value" text,
    "created_at" timestamp with time zone not null default now(),
    "report_id" uuid not null
);


alter table "public"."responses_text" enable row level security;

alter table "public"."responses_bool" drop column "user_id";

alter table "public"."responses_bool" add column "report_id" uuid not null;

alter table "public"."responses_bool" alter column "value" drop not null;

alter table "public"."responses_float8" drop column "user_id";

alter table "public"."responses_float8" add column "report_id" uuid not null;

alter table "public"."responses_float8" alter column "value" drop not null;

alter table "public"."responses_int8" drop column "user_id";

alter table "public"."responses_int8" add column "report_id" uuid not null;

alter table "public"."responses_int8" alter column "value" drop not null;

alter table "public"."user_data" add column "adhd_diagnosed" boolean not null default false;

alter table "public"."user_data" add column "adhd_treated" boolean not null default false;

alter table "public"."user_data" add column "anxiety_diagnosed" boolean not null default false;

alter table "public"."user_data" add column "anxiety_treated" boolean not null default false;

alter table "public"."user_data" add column "depression_diagnosed" boolean not null default false;

alter table "public"."user_data" add column "depression_treated" boolean not null default false;

CREATE UNIQUE INDEX attack_reports_pkey ON public.attack_reports USING btree (id);

CREATE UNIQUE INDEX question_reports_pkey ON public.question_reports USING btree (id);

CREATE UNIQUE INDEX report_types_pkey ON public.report_types USING btree (id);

CREATE UNIQUE INDEX responses_bool_pkey ON public.responses_bool USING btree (question_id, report_id);

CREATE UNIQUE INDEX responses_float8_pkey ON public.responses_float8 USING btree (question_id, report_id);

CREATE UNIQUE INDEX responses_int8_pkey ON public.responses_int8 USING btree (question_id, report_id);

CREATE UNIQUE INDEX responses_varchar_pkey ON public.responses_text USING btree (question_id, report_id);

alter table "public"."attack_reports" add constraint "attack_reports_pkey" PRIMARY KEY using index "attack_reports_pkey";

alter table "public"."question_reports" add constraint "question_reports_pkey" PRIMARY KEY using index "question_reports_pkey";

alter table "public"."report_types" add constraint "report_types_pkey" PRIMARY KEY using index "report_types_pkey";

alter table "public"."responses_text" add constraint "responses_varchar_pkey" PRIMARY KEY using index "responses_varchar_pkey";

alter table "public"."responses_bool" add constraint "responses_bool_pkey" PRIMARY KEY using index "responses_bool_pkey";

alter table "public"."responses_float8" add constraint "responses_float8_pkey" PRIMARY KEY using index "responses_float8_pkey";

alter table "public"."responses_int8" add constraint "responses_int8_pkey" PRIMARY KEY using index "responses_int8_pkey";

alter table "public"."attack_reports" add constraint "attack_reports_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_data(id) not valid;

alter table "public"."attack_reports" validate constraint "attack_reports_user_id_fkey";

alter table "public"."question_reports" add constraint "question_reports_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) not valid;

alter table "public"."question_reports" validate constraint "question_reports_question_id_fkey";

alter table "public"."question_reports" add constraint "question_reports_report_type_fkey" FOREIGN KEY (report_type) REFERENCES report_types(id) not valid;

alter table "public"."question_reports" validate constraint "question_reports_report_type_fkey";

alter table "public"."question_reports" add constraint "question_reports_reported_by_fkey" FOREIGN KEY (reported_by) REFERENCES user_data(id) not valid;

alter table "public"."question_reports" validate constraint "question_reports_reported_by_fkey";

alter table "public"."responses_bool" add constraint "responses_bool_report_id_fkey" FOREIGN KEY (report_id) REFERENCES attack_reports(id) not valid;

alter table "public"."responses_bool" validate constraint "responses_bool_report_id_fkey";

alter table "public"."responses_float8" add constraint "responses_float8_report_id_fkey" FOREIGN KEY (report_id) REFERENCES attack_reports(id) not valid;

alter table "public"."responses_float8" validate constraint "responses_float8_report_id_fkey";

alter table "public"."responses_int8" add constraint "responses_int8_report_id_fkey" FOREIGN KEY (report_id) REFERENCES attack_reports(id) not valid;

alter table "public"."responses_int8" validate constraint "responses_int8_report_id_fkey";

alter table "public"."responses_text" add constraint "responses_text_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) ON DELETE RESTRICT not valid;

alter table "public"."responses_text" validate constraint "responses_text_question_id_fkey";

alter table "public"."responses_text" add constraint "responses_text_report_id_fkey" FOREIGN KEY (report_id) REFERENCES attack_reports(id) not valid;

alter table "public"."responses_text" validate constraint "responses_text_report_id_fkey";

alter table "public"."user_data" add constraint "user_data_type_check" CHECK (((type = 'user'::text) OR (type = 'therapist'::text) OR (type = 'doctor'::text))) not valid;

alter table "public"."user_data" validate constraint "user_data_type_check";

create or replace view "public"."attack_reports_summary" WITH (security_invoker) as  SELECT reports.user_id,
    date_trunc('month'::text, reports.created_at) AS start_time,
    avg(reports.difference) AS rate,
    count(*) FILTER (WHERE reports.accompanied) AS accompanied,
    count(*) FILTER (WHERE reports.identify_source) AS identify_source,
    count(*) FILTER (WHERE reports.get_away) AS get_away,
    count(*) FILTER (WHERE reports.can_act) AS can_act,
    count(*) FILTER (WHERE reports.related_to_people) AS related_to_people,
    count(*) FILTER (WHERE reports.safe) AS safe,
    count(reports.notes) FILTER (WHERE (NOT (reports.notes = ''::text))) AS took_notes,
    count(*) AS total
   FROM ( SELECT attack_reports.id,
            attack_reports.user_id,
            attack_reports.created_at,
            attack_reports.rate,
            attack_reports.accompanied,
            attack_reports.identify_source,
            attack_reports.get_away,
            attack_reports.can_act,
            attack_reports.related_to_people,
            attack_reports.location,
            attack_reports.notes,
            attack_reports.safe,
            attack_reports.deleted,
            (attack_reports.created_at - lag(attack_reports.created_at) OVER (ORDER BY attack_reports.created_at)) AS difference
           FROM attack_reports
          WHERE (NOT attack_reports.deleted)) reports
  GROUP BY reports.user_id, (date_trunc('month'::text, reports.created_at));


create or replace view "public"."questions_unexpired_random" as  SELECT rq.id,
    rt.type,
    rq.question,
    rt.lang
   FROM response_types rt,
    researcher_questions rq
  WHERE ((rq.question_response_type = rt.id) AND (rq.expires_at > now()))
  ORDER BY (random());


create or replace view "public"."reports_by_lang" as  SELECT report_types.id,
    supported_langs.iso_639_1,
    (report_types.value ->> (supported_langs.iso_639_1)::text) AS value,
    report_types.icon
   FROM report_types,
    supported_langs;


create policy "Enable CRUD for users based on user_id"
on "public"."attack_reports"
as permissive
for all
to authenticated
using (((auth.uid() = user_id) OR (auth.uid() = NULL::uuid)))
with check (((auth.uid() = user_id) OR (auth.uid() = NULL::uuid)));


create policy "Enable read access for all users"
on "public"."countries"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."gender_ref"
as permissive
for select
to public
using (true);


create policy "Enable insert for authenticated users only"
on "public"."question_reports"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read for users based on user_id"
on "public"."question_reports"
as permissive
for select
to public
using ((auth.uid() = reported_by));


create policy "Enable read for authenticated users only"
on "public"."researcher_questions"
as permissive
for select
to authenticated
using (true);


create policy "Enable insert for authenticated users only"
on "public"."responses_bool"
as permissive
for insert
to authenticated
with check (true);


create policy "Researchers can see the responses to their questions"
on "public"."responses_bool"
as permissive
for select
to authenticated
using ((auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_bool.question_id))));


create policy "Users can manage their responses"
on "public"."responses_bool"
as permissive
for all
to authenticated
using ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_bool.report_id))))
with check ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_bool.report_id))));


create policy "Enable insert for authenticated users only"
on "public"."responses_float8"
as permissive
for insert
to authenticated
with check (true);


create policy "Researchers can see the responses to their questions"
on "public"."responses_float8"
as permissive
for select
to authenticated
using ((auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_float8.question_id))));


create policy "Users can manage their responses"
on "public"."responses_float8"
as permissive
for all
to authenticated
using ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_float8.report_id))))
with check ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_float8.report_id))));


create policy "Enable insert for authenticated users only"
on "public"."responses_int8"
as permissive
for insert
to authenticated
with check (true);


create policy "Researchers can see the responses to their questions"
on "public"."responses_int8"
as permissive
for select
to authenticated
using ((auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_int8.question_id))));


create policy "Users can manage their responses"
on "public"."responses_int8"
as permissive
for all
to authenticated
using ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_int8.report_id))))
with check ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_int8.report_id))));


create policy "Enable insert for authenticated users only"
on "public"."responses_text"
as permissive
for insert
to authenticated
with check (true);


create policy "Researchers can see the responses to their questions"
on "public"."responses_text"
as permissive
for select
to authenticated
using ((auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_text.question_id))));


create policy "Users can manage their responses"
on "public"."responses_text"
as permissive
for all
to authenticated
using ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_text.report_id))))
with check ((auth.uid() = ( SELECT attack_reports.user_id
   FROM attack_reports
  WHERE (attack_reports.id = responses_text.report_id))));


create policy "Enable read access for all users"
on "public"."states"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."supported_langs"
as permissive
for select
to public
using (true);


create policy "Enable delete for users based on user_id"
on "public"."user_data"
as permissive
for delete
to anon, authenticated
using ((auth.uid() = id));


create policy "Enable insert access for all users"
on "public"."user_data"
as permissive
for insert
to public
with check (true);


create policy "Enable read for users based on user_id"
on "public"."user_data"
as permissive
for select
to authenticated, anon
using ((auth.uid() = id));



