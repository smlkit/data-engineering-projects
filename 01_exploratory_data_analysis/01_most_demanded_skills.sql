/*
QUESTION: What are the most in-demand skills for data engineers?
    - Identify the top 10 in-demand skills for data engineers.
    - Focus on remote job postings.
*/

SELECT
    sd.skills AS skill_name,
    COUNT(jpf.*) AS demand_count
FROM    
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND
    jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY
    COUNT(jpf.*) DESC
LIMIT 10;

/*
RESULT:
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/