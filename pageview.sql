CREATE TABLE `burcuproject.ga4websample.pageview` AS (

select  PARSE_DATE("%Y%m%d", event_date) as date,
        user_pseudo_id,
        concat(user_pseudo_id,(select value.int_value from unnest(event_params) where key = 'ga_session_id')) as sessionid,
        case when (select value.int_value from unnest(event_params) where event_name = 'page_view' and key = 'entrances') = 1 then 'Y' else 'N' end as entrance,
        (select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location') as page,
        (select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_title') as page_title,
        case when split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(4)],'?')[safe_ordinal(1)] = '' then null else concat('/',split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(4)],'?')[safe_ordinal(1)]) end as pagepath_level_1,
        case when split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(5)],'?')[safe_ordinal(1)] = '' then null else concat('/',split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(5)],'?')[safe_ordinal(1)]) end as pagepath_level_2,
        case when split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(6)],'?')[safe_ordinal(1)] = '' then null else concat('/',split(split((select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location'),'/')[safe_ordinal(6)],'?')[safe_ordinal(1)]) end as pagepath_level_3,
        countif(event_name = 'page_view') as page_views,
        count(distinct case when event_name = 'page_view' then concat(user_pseudo_id,(select value.int_value from unnest(event_params) where key = 'ga_session_id')) end) as unique_pageviews
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20*` 
where PARSE_DATE('%y%m%d', _TABLE_SUFFIX) between '2020-11-01' and '2021-01-31'
and event_name = 'page_view'
group by 1,2,3,4,5,6,7,8,9
)