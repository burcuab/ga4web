SELECT  p.date,
        s.device_category,
        p.entrance,
        p.page,
        p.page_title,
        p.pagepath_level_1,
        p.pagepath_level_2,
        p.pagepath_level_3,        
        sum(p.page_views) as page_views,
        sum(p.unique_pageviews) as unique_pageviews
FROM `burcuproject.ga4websample.pageview` p 
join `burcuproject.ga4websample.session` s on s.sessionid=p.sessionid and p.date=s.date 
group by 1,2,3,4,5,6,7,8