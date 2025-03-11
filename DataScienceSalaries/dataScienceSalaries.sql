-- Buat Database
CREATE DATABASE ds;

-- Gunakan Database 'ds'
USE ds;

-- Import ds_salaries.csv
SELECT * FROM ds_salaries;

-- 1. Apakah ada data yang NULL di kolom work_year?
SELECT * FROM ds_salaries WHERE work_year IS NULL;

-- 2. Cek apakah ada yang null di seluruh kolom?
SELECT * 
FROM ds_salaries 
WHERE work_year IS NULL 
   OR experience_level IS NULL 
   OR employment_type IS NULL 
   OR job_title IS NULL 
   OR salary IS NULL 
   OR salary_currency IS NULL 
   OR salary_in_usd IS NULL 
   OR employee_residence IS NULL 
   OR remote_ratio IS NULL 
   OR company_location IS NULL 
   OR company_size IS NULL;

-- 3. Melihat ada job title apa saja?
SELECT DISTINCT job_title FROM ds_salaries ORDER BY job_title;

-- 4. Job title apa saja yang berkaitan dengan data analyst?
SELECT DISTINCT job_title FROM ds_salaries  WHERE job_title LIKE '%data analyst%' ORDER BY job_title;

-- 5. Berapa rata-rata gaji tiap pekerjaan yang berkaitan dengan data analyst
SELECT job_title, AVG(salary_in_usd) AS avg_salary_in_usd FROM ds_salaries WHERE job_title LIKE '%data analyst%' GROUP BY job_title ORDER BY job_title;

-- 6. Berapa rata-rata gaji dalam Rupiah (RP) tiap pekerjaan yang berkaitan dengan data analyst
SELECT job_title, (AVG(salary_in_usd)*15000)/12 AS avg_salary_in_rp FROM ds_salaries WHERE job_title LIKE '%data analyst%' GROUP BY job_title ORDER BY job_title;

-- 7. Berapa rata-rata gaji dalam rupiah tiap pekerjaan yang berkaitan dengan data analyst dan experience levelnya
SELECT job_title, experience_level, (AVG(salary_in_usd)*15000)/12 AS avg_salary_in_rp FROM ds_salaries WHERE job_title LIKE '%data analyst%' GROUP BY job_title, experience_level ORDER BY job_title, experience_level;

-- 8. Negara dengan gaji yg menarik untuk posisi data analyst dan employment type Full Time (FT)?
SELECT job_title, employment_type, company_location, AVG(salary_in_usd) AS avg_salary_in_usd 
FROM ds_salaries 
WHERE job_title LIKE '%data analyst%' 
  AND employment_type = 'FT' 
GROUP BY job_title, employment_type, company_location 
ORDER BY job_title;

-- 9. Negara dengan gaji yang menarik untuk posisi data analyst, full time, exp kerjanya entry level dan menengah / mid
SELECT
	company_location,
	AVG(salary_in_usd) avg_sal_in_usd
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'
	AND employment_type = 'FT'
	AND experience_level IN ('MI', 'EN')
GROUP BY
	company_location;

-- 10. Negara dengan gaji yang menarik untuk posisi data analyst, full time, exp kerjanya entry level dan menengah / mid dan gaji > $20.000 
SELECT
	company_location,
	AVG(salary_in_usd) avg_sal_in_usd
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'
	AND employment_type = 'FT'
	AND experience_level IN ('MI', 'EN')
GROUP BY
	company_location
HAVING
	avg_sal_in_usd >= 20000;

-- 11. Data dari tahun?
SELECT DISTINCT work_year FROM ds_salaries;

-- 12. di tahun keberapa kenaikan gaji dari mid ke expert terbesar?
-- (Untuk pekerjaan yang berkaitan dengan data analyst, full time)

WITH ds_1 AS (
	SELECT
		work_year,
		AVG(salary_in_usd) sal_in_usd_ex
	FROM
		ds_salaries
	WHERE
		employment_type = 'FT'
		AND experience_level = 'EX'
		AND job_title LIKE '%data analyst%'
	GROUP BY
		work_year
),
ds_2 AS (
	SELECT
		work_year,
		AVG(salary_in_usd) sal_in_usd_mi
	FROM
		ds_salaries
	WHERE
		employment_type = 'FT'
		AND experience_level = 'MI'
		AND job_title LIKE '%data analyst%'
	GROUP BY
		work_year
),
t_year AS (
	SELECT
		DISTINCT work_year
	FROM
		ds_salaries
)
SELECT
	t_year.work_year,
	ds_1.sal_in_usd_ex,
	ds_2.sal_in_usd_mi,
	ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
FROM
	t_year
	LEFT JOIN ds_1 ON ds_1.work_year = t_year.work_year
	LEFT JOIN ds_2 ON ds_2.work_year = t_year.work_year;