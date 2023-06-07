insert into "public"."response_types" ("type", "lang", "friendly_name") values
    ('bool',    'en', 'True/False'),
    ('bool',    'es', 'Verdadero/Falso'),
    ('int8',    'en', 'Numeric'),
    ('int8',    'es', 'Numérico'),
    ('float8',  'en', 'Numeric with decimal'),
    ('float8',  'es', 'Numérico con decimal'),
    ('varchar', 'en', 'Text'),
    ('varchar', 'es', 'Texto');

create table "public"."responses_int8" (
    "question_id" uuid not null,
    "value" bigint not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid not null
);
alter table "public"."responses_int8" enable row level security;
CREATE UNIQUE INDEX responses_int8_pkey ON public.responses_int8 USING btree (question_id, user_id);
alter table "public"."responses_int8" add constraint "responses_int8_pkey" PRIMARY KEY using index "responses_int8_pkey";
alter table "public"."responses_int8" add constraint "responses_int8_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) ON DELETE RESTRICT not valid;
alter table "public"."responses_int8" validate constraint "responses_int8_question_id_fkey";
alter table "public"."responses_int8" add constraint "responses_int8_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_data(id) ON DELETE CASCADE not valid;
alter table "public"."responses_int8" validate constraint "responses_int8_user_id_fkey";
create policy "Only Users and researchers can update/delete/read questions"
on "public"."responses_int8"
as permissive
for all
to authenticated, anon
using ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_int8.question_id))))
with check ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_int8.question_id))));


create table "public"."responses_float8" (
    "question_id" uuid not null,
    "value" double precision not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid not null
);
alter table "public"."responses_float8" enable row level security;
CREATE UNIQUE INDEX responses_float8_pkey ON public.responses_float8 USING btree (question_id, user_id);
alter table "public"."responses_float8" add constraint "responses_float8_pkey" PRIMARY KEY using index "responses_float8_pkey";
alter table "public"."responses_float8" add constraint "responses_float8_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) ON DELETE RESTRICT not valid;
alter table "public"."responses_float8" validate constraint "responses_float8_question_id_fkey";
alter table "public"."responses_float8" add constraint "responses_float8_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_data(id) ON DELETE CASCADE not valid;
alter table "public"."responses_float8" validate constraint "responses_float8_user_id_fkey";
create policy "Only Users and researchers can update/delete/read questions"
on "public"."responses_float8"
as permissive
for all
to authenticated, anon
using ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_float8.question_id))))
with check ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_float8.question_id))));


create table "public"."responses_varchar" (
    "question_id" uuid not null,
    "value" varchar not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid not null
);
alter table "public"."responses_varchar" enable row level security;
CREATE UNIQUE INDEX responses_varchar_pkey ON public.responses_varchar USING btree (question_id, user_id);
alter table "public"."responses_varchar" add constraint "responses_varchar_pkey" PRIMARY KEY using index "responses_varchar_pkey";
alter table "public"."responses_varchar" add constraint "responses_varchar_question_id_fkey" FOREIGN KEY (question_id) REFERENCES researcher_questions(id) ON DELETE RESTRICT not valid;
alter table "public"."responses_varchar" validate constraint "responses_varchar_question_id_fkey";
alter table "public"."responses_varchar" add constraint "responses_varchar_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_data(id) ON DELETE CASCADE not valid;
alter table "public"."responses_varchar" validate constraint "responses_varchar_user_id_fkey";
create policy "Only Users and researchers can update/delete/read questions"
on "public"."responses_varchar"
as permissive
for all
to authenticated, anon
using ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_varchar.question_id))))
with check ((auth.uid() = user_id) OR (auth.uid() = ( SELECT researcher_questions.created_by
   FROM researcher_questions
  WHERE (researcher_questions.id = responses_varchar.question_id))));