/*
Question: What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions.
-Focus on roles with specified salaries, regardless of location.
-Why? Because it would reveal how different skills impact salary levels for Data Analysts
and help identify the most financially rewarding skills to acquire, learn or improve upon.
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 5

-- Todo: Copy results as Json to later help gather insights

-- Todo: Insights based on the results with ChatGPT's assistance: