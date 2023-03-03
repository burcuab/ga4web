CREATE TABLE `burcuproject.ga4websample.session` AS (

SELECT 
  user_pseudo_id,
  concat(user_pseudo_id,(select value.int_value from unnest(event_params) where key = 'ga_session_id')) as sessionid,
  PARSE_DATE("%Y%m%d", min(event_date)) as date,
  max(device.category) as device_category,
  max(device.operating_system) as operating_system,
  max(device.operating_system_version) as operating_system_version,
  max(device.web_info.browser) as browser,
  max(device.web_info.browser_version) as browser_version,
  max(traffic_source.source) as source,
  max(traffic_source.medium) as medium,
  max(traffic_source.name) as campaign,
  max(case when (select value.int_value from unnest(event_params) where event_name = 'page_view' and key = 'entrances') = 1 then (select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_location') end) as landing_page,
  max(case when (select value.int_value from unnest(event_params) where event_name = 'page_view' and key = 'entrances') = 1 then (select value.string_value from unnest(event_params) where event_name = 'page_view' and key = 'page_title') end) as landing_page_title, 
  count(distinct case when event_name = 'purchase' then concat(event_timestamp, user_pseudo_id) else null end) As transactions
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20*` 
where PARSE_DATE('%y%m%d', _TABLE_SUFFIX) between '2020-11-01' and '2021-01-31'
group by 1,2
)