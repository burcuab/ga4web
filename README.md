# GA4 Web - Data preparation and visualization

Purpose is to create data sets using raw GA4 data in Google Big Query and visualize data in Looker.

* Data source is [public GA4 Website dataset in Big Query](https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset)
* Google Big Query
* Looker

Metrics to visualize
* Sessions
* Transactions
* Conversion Rate

Dimensions
* Landing Page
* Device Category
* Operating System
* Operating System Version
* Browser
* Browser Version
* Source, medium

## Dataset preparation in Google Big Query

* Create session level table: [SQL to run in BQ](session.sql) 
* Create page level table: [SQL to run in BQ](pageview.sql) 
* Create reporting table for overall KPIs: [SQL to run in BQ](report_overall.sql) 
* Create reporting table for pageview level KPIs: [SQL to run in BQ](report_pageview.sql) 
