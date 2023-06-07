create table "public"."gender_ref" (
    "id" varchar(2) not null,
    -- "lang" char(2) not null,
    "value" jsonb not null
);


alter table "public"."gender_ref" enable row level security;

CREATE UNIQUE INDEX gender_ref_id_key ON public.gender_ref USING btree (id);

CREATE UNIQUE INDEX gender_ref_pkey ON public.gender_ref USING btree (id);

alter table "public"."gender_ref" add constraint "gender_ref_pkey" PRIMARY KEY using index "gender_ref_pkey";

alter table "public"."gender_ref" add constraint "gender_ref_id_key" UNIQUE using index "gender_ref_id_key";


insert into "public"."gender_ref" values 
    ('m', '{ "en": "Male", "es": "Hombre" }'),
    ('f', '{ "en": "Female", "es": "Mujer" }'),
    ('nb', '{ "en": "Non-Binary", "es": "No-Binario" }'),
    ('o', '{ "en": "Other", "es": "Otro" }'),
    ('na', '{ "en": "Rather not say", "es": "Prefiero no decir" }');

alter table "public"."user_data" add column "gender" varchar(2) not null default 'na'::text;
alter table "public"."user_data" add constraint "user_data_gender_fkey" FOREIGN KEY (gender) REFERENCES gender_ref(id) not valid;
alter table "public"."user_data" validate constraint "user_data_gender_fkey";


