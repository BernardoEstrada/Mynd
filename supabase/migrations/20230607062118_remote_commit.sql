drop view if exists "public"."attack_reports_summary";

create or replace view "public"."attack_reports_summary" as  SELECT reports.user_id,
    date_trunc('month'::text, reports.created_at) AS start_time,
    avg(reports.difference) AS avg_interval,
    avg(reports.rate) AS rate,
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



