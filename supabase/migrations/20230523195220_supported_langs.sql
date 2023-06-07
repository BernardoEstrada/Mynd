create table "public"."supported_langs" (
    "iso_639_1" char(2) not null,
    "name" text not null,
    "localized_name" text not null
);


alter table "public"."supported_langs" enable row level security;

CREATE UNIQUE INDEX supported_langs_id_key ON public.supported_langs USING btree (iso_639_1);

CREATE UNIQUE INDEX supported_langs_pkey ON public.supported_langs USING btree (iso_639_1);

alter table "public"."supported_langs" add constraint "supported_langs_pkey" PRIMARY KEY using index "supported_langs_pkey";

alter table "public"."supported_langs" add constraint "supported_langs_id_key" UNIQUE using index "supported_langs_id_key";


insert into "public"."supported_langs" values 
    ('en', 'English', 'English'),
    ('es', 'Spanish', 'Español');

alter table "public"."user_data" add column "lang" char(2) not null default 'en'::text;
alter table "public"."user_data" add constraint "user_data_lang_fkey" FOREIGN KEY (lang) REFERENCES supported_langs(iso_639_1) not valid;
alter table "public"."user_data" validate constraint "user_data_lang_fkey";

alter table "public"."response_types" add constraint "response_types_lang_fkey" FOREIGN KEY (lang) REFERENCES supported_langs(iso_639_1) not valid;
alter table "public"."response_types" validate constraint "response_types_lang_fkey";
