SELECT  date,
        device_category,
        operating_system,
        operating_system_version,
        browser,
        browser_version,
        source,
        medium,
        campaign,
        landing_page,
        landing_page_title,
        count(distinct user_pseudo_id) as users,
        count(distinct sessionid) as sessions,
        sum(transactions) as transactions
FROM `burcuproject.ga4websample.session` 
group by 1,2,3,4,5,6,7,8,9,10,11