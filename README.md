# HR-Database-SQL-Case-Study
A SQL-based HR analytics project focused on employee data analysis, department performance, and salary insights etc. using MySQL. 
Demonstrates data cleaning, query building, and business intelligence skills for data analyst roles.

---

## 📘 Project Overview
A structured SQL project designed to analyze HR data for insights into employee performance, salary trends, and department efficiency.  
Demonstrates strong database design and query-building skills for data-driven HR decision-making.

---

## 🧰 Tools & Technologies
- MySQL Workbench
- Question Sheet of business Problem
  

---

## 🧩 Key Objectives
1. Build and manage HR tables (Employees, Departments, Salaries).
2. Write SQL queries for:
   - Employee count by department  
   - Salary analysis  
   - Departmental performance  
   - Employee turnover insights  

---

## 📊 Sample Queries
```sql
-- Average salary per department
SELECT department_name, ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY department_name;

-- Employees hired per year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_hires
FROM employees
GROUP BY hire_year;

---

💡 Insights
Identified top-performing departments and salary distribution.
Supported HR strategy with data-driven insights.
