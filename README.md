# datafest-africa-2023
Project for datafest 2023
In this project, I created an end to end, production ready ETL pipeline for taking data from a raw Snowflake schema to a staging schema, performing some transformation on the data, loading the data in a target Snowflake schema and answering some business related questions from the cleaned data. 
<br> 
I also built a CICD pipeline using Github Actions for continous integration and deployment of code changes. <br>This project was built end to end using dbt .<br>

### SCHEMA ARCHITECTURE 
<img width="1440" alt="Screen Shot 2023-09-17 at 2 38 40 PM" src="https://github.com/Techtacles/datafest-africa-2023/assets/57522480/8479e477-0bd6-4da3-a77d-f0a069ca8dc0">

<br>
In the dbt models folder, I created a folder called <b>staging</b>. This staging schema is materialized as a table. The sql files in this directory contain the ingestion and transformation processes. I also created some sql files in the macros folder which perform some extra data transformation. These macros are referenced in the models. <br> Inside the models directory, there is a sources.yml file which defines the schema and tables as contained in the Snowflake raw schema. <br><br> I also created a Github Actions workflow where I ran some dbt tests to check for null values . I also set primary key constraints in this test. <br> I also ran the dbt workflow in the Github Actions. <br>
As best practices, I exported the profiles.yml file as a Github Actions workflow secret. I then used bash commands to export the secrets into a file, which I referenced in the dbt run command. <br>
<img width="1440" alt="Screen Shot 2023-09-16 at 11 53 14 PM" src="https://github.com/Techtacles/datafest-africa-2023/assets/57522480/8deddcc7-6411-4269-8fd3-97544e191ef5">


<br>
<br>
The processed data can be seen in the Snowflake data warehouse. However, the image below is a sneak peek of the data in Snowflake<br>
<img width="1440" alt="Screen Shot 2023-09-16 at 11 55 06 PM" src="https://github.com/Techtacles/datafest-africa-2023/assets/57522480/fc2120e7-c74e-49cb-ab04-f320f5300add">

<br>
To optimize the query performance, I ensured to use clean and consise SQL code. I also added indexing to the code . I avoided full outer joins and selecting all the fields whilst using the select statement. I also ensured I minimized large write operations to the data warehouse. I also used a low thread whilst running the dbt to reduce the load on the data warehouse and to save costs. Although, the implication of this is that queries might take a longer time to run.<br><br>
I am grateful for the opportunity in utilizing my skills in solving problems and I'd be glad to answer any questions you might have. Thank you.

