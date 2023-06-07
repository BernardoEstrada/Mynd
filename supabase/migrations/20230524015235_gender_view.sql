create or replace view "public"."genders_by_lang" as  SELECT gender_ref.id,
    supported_langs.iso_639_1,
    (gender_ref.value ->> (supported_langs.iso_639_1)::text) AS value
   FROM gender_ref,
    supported_langs;



