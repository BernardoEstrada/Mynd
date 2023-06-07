create table "public"."researcher_questions" (
    "id" uuid not null default gen_random_uuid(),
    "question" text,
    "created_at" timestamp with time zone not null default now(),
    "expires_at" timestamp with time zone,
    "question_response_type" uuid not null,
    "created_by" uuid
);


alter table "public"."researcher_questions" enable row level security;

create table "public"."response_types" (
    "id" uuid not null default gen_random_uuid(),
    "type" varchar(32) not null,
    "lang" char(2) not null,
    "friendly_name" text
);


alter table "public"."response_types" enable row level security;

create table "public"."responses_bool" (
    "question_id" uuid not null,
    "value" boolean not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid not null
);


alter table "public"."responses_bool" enable row level security;

create table "public"."user_data" (
    "id" uuid not null,
    "created_at" timestamp with time zone default now(),
    "type" text not null default 'user'::text,
    "age" double precision,
    "data" json
);


alter table "public"."user_data" enable row level security;


CREATE UNIQUE INDEX researcher_questions_pkey ON public.researcher_questions USING btree (id);

CREATE UNIQUE INDEX response_types_pkey ON public.response_types USING btree (id);

CREATE UNIQUE INDEX response_types_type_key ON public.response_types USING btree (type, lang);

CREATE UNIQUE INDEX responses_bool_pkey ON public.responses_bool USING btree (question_id, user_id);

CREATE UNIQUE INDEX user_data_pkey ON public.user_data USING btree (id);

alter table "public"."researcher_questions" add constraint "researcher_questions_pkey" PRIMARY KEY using index "researcher_questions_pkey";

alter table "public"."response_types" add constraint "response_types_pkey" PRIMARY KEY using index "response_types_pkey";

alter table "public"."responses_bool" add constraint "responses_bool_pkey" PRIMARY KEY using index "responses_bool_pkey";

alter table "public"."user_data" add constraint "user_data_pkey" PRIMARY KEY using index "user_data_pkey";

alter table "public"."researcher_questions" add constraint "researcher_questions_created_by_fkey" FOREIGN KEY (created_by) REFERENCES user_data(id) ON DELETE CASCADE not valid;

alter table "public"."researcher_questions" validate constraint "researcher_questions_created_by_fkey";

alter table "public"."researcher_questions" add constraint "researcher_questions_question_response_type_fkey" FOREIGN KEY (question_response_type) REFERENCES response_types(id) ON DELETE RESTRICT not valid;

alter table "public"."researcher_questions" validate constraint "researcher_questions_question_response_type_fkey";

alter table "public"."response_types" add constraint "response_types_type_key" UNIQUE using index "response_types_type_key";

alter table "public"."responses_bool" add constraint "responses_bool_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) ON DELETE RESTRICT not valid;

alter table "public"."responses_bool" validate constraint "responses_bool_question_id_fkey";

alter table "public"."responses_bool" add constraint "responses_bool_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_data(id) ON DELETE CASCADE not valid;

alter table "public"."responses_bool" validate constraint "responses_bool_user_id_fkey";

alter table "public"."user_data" add constraint "user_data_type_check" CHECK ((type = 'user'::text) OR (type = '    '::text) OR (type = 'doctor'::text)) not valid;

alter table "public"."user_data" validate constraint "user_data_type_check";

create policy "Only question creator can delete"
on "public"."researcher_questions"
as permissive
for delete
to authenticated, anon
using (auth.uid() = created_by);


create policy "Only question creator can update"
on "public"."researcher_questions"
as permissive
for update
to authenticated, anon
using (auth.uid() = created_by)
with check (auth.uid() = created_by);


create policy "Only Users and researchers can update/delete/read questions"
on "public"."responses_bool"
as permissive
for all
to authenticated, anon
using ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_bool.question_id))))
with check ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_bool.question_id))));


create policy "Only users can manage their data"
on "public"."user_data"
as permissive
for all
to authenticated, anon
using ((auth.uid() = id))
with check ((auth.uid() = id));


create policy "Enable update for users based on id"
on "public"."user_data"
as permissive
for update
to authenticated, anon
using (auth.uid() = id)
with check (auth.uid() = id);



