# GA4 Web - Data preparation and visualization

Purpose is to create data sets using raw GA4 data in Google Big Query and visualize data in Looker and Power BI.

* Data source is [public GA4 Website dataset in Big Query](https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset)
* Google Big Query
* Looker

Metrics
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

## Visualizaton in Looker

* Create report in Looker Studio: [Report](https://lookerstudio.google.com/reporting/5f7272c6-ca64-4a49-9a09-c27e7658ab48) 

![image](https://user-images.githubusercontent.com/125803633/221440298-a487dbeb-95f1-4a4a-b45c-212be72d2686.png)

![image](https://user-images.githubusercontent.com/125803633/221440321-2749ab3a-f164-4032-b5f9-ed325ebf6813.png)


## Visualizaton in Power BI

Coming soon
