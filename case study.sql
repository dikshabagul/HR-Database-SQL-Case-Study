
create database hr;
USE hr;

/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
show tables;


CREATE TABLE locations (
	location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);

CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);



CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);
    
    

CREATE TABLE job_history (
	employee_id INT (11) UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT (11) UNSIGNED NOT NULL
	);

ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);


CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;

COMMIT;

INSERT INTO locations
VALUES (
	1000,
	'1297 Via Cola di Rie',
	'00989',
	'Roma',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1100,
	'93091 Calle della Testa',
	'10934',
	'Venice',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1200,
	'2017 Shinjuku-ku',
	'1689',
	'Tokyo',
	'Tokyo Prefecture',
	'JP'
	);

INSERT INTO locations
VALUES (
	1300,
	'9450 Kamiya-cho',
	'6823',
	'Hiroshima',
	NULL,
	'JP'
	);

INSERT INTO locations
VALUES (
	1400,
	'2014 Jabberwocky Rd',
	'26192',
	'Southlake',
	'Texas',
	'US'
	);

INSERT INTO locations
VALUES (
	1500,
	'2011 Interiors Blvd',
	'99236',
	'South San Francisco',
	'California',
	'US'
	);

INSERT INTO locations
VALUES (
	1600,
	'2007 Zagora St',
	'50090',
	'South Brunswick',
	'New Jersey',
	'US'
	);

INSERT INTO locations
VALUES (
	1700,
	'2004 Charade Rd',
	'98199',
	'Seattle',
	'Washington',
	'US'
	);

INSERT INTO locations
VALUES (
	1800,
	'147 Spadina Ave',
	'M5V 2L7',
	'Toronto',
	'Ontario',
	'CA'
	);

INSERT INTO locations
VALUES (
	1900,
	'6092 Boxwood St',
	'YSW 9T2',
	'Whitehorse',
	'Yukon',
	'CA'
	);

INSERT INTO locations
VALUES (
	2000,
	'40-5-12 Laogianggen',
	'190518',
	'Beijing',
	NULL,
	'CN'
	);

INSERT INTO locations
VALUES (
	2100,
	'1298 Vileparle (E)',
	'490231',
	'Bombay',
	'Maharashtra',
	'IN'
	);

INSERT INTO locations
VALUES (
	2200,
	'12-98 Victoria Street',
	'2901',
	'Sydney',
	'New South Wales',
	'AU'
	);

INSERT INTO locations
VALUES (
	2300,
	'198 Clementi North',
	'540198',
	'Singapore',
	NULL,
	'SG'
	);

INSERT INTO locations
VALUES (
	2400,
	'8204 Arthur St',
	NULL,
	'London',
	NULL,
	'UK'
	);

INSERT INTO locations
VALUES (
	2500,
	'Magdalen Centre, The Oxford Science Park',
	'OX9 9ZB',
	'Oxford',
	'Oxford',
	'UK'
	);

INSERT INTO locations
VALUES (
	2600,
	'9702 Chester Road',
	'09629850293',
	'Stretford',
	'Manchester',
	'UK'
	);

INSERT INTO locations
VALUES (
	2700,
	'Schwanthalerstr. 7031',
	'80925',
	'Munich',
	'Bavaria',
	'DE'
	);

INSERT INTO locations
VALUES (
	2800,
	'Rua Frei Caneca 1360 ',
	'01307-002',
	'Sao Paulo',
	'Sao Paulo',
	'BR'
	);

INSERT INTO locations
VALUES (
	2900,
	'20 Rue des Corps-Saints',
	'1730',
	'Geneva',
	'Geneve',
	'CH'
	);

INSERT INTO locations
VALUES (
	3000,
	'Murtenstrasse 921',
	'3095',
	'Bern',
	'BE',
	'CH'
	);

INSERT INTO locations
VALUES (
	3100,
	'Pieter Breughelstraat 837',
	'3029SK',
	'Utrecht',
	'Utrecht',
	'NL'
	);

INSERT INTO locations
VALUES (
	3200,
	'Mariano Escobedo 9991',
	'11932',
	'Mexico City',
	'Distrito Federal,',
	'MX'
	);

COMMIT;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO departments
VALUES (
	10,
	'Administration',
	200,
	1700
	);

INSERT INTO departments
VALUES (
	20,
	'Marketing',
	201,
	1800
	);

INSERT INTO departments
VALUES (
	30,
	'Purchasing',
	114,
	1700
	);

INSERT INTO departments
VALUES (
	40,
	'Human Resources',
	203,
	2400
	);

INSERT INTO departments
VALUES (
	50,
	'Shipping',
	121,
	1500
	);

INSERT INTO departments
VALUES (
	60,
	'IT',
	103,
	1400
	);

INSERT INTO departments
VALUES (
	70,
	'Public Relations',
	204,
	2700
	);

INSERT INTO departments
VALUES (
	80,
	'Sales',
	145,
	2500
	);

INSERT INTO departments
VALUES (
	90,
	'Executive',
	100,
	1700
	);

INSERT INTO departments
VALUES (
	100,
	'Finance',
	108,
	1700
	);

INSERT INTO departments
VALUES (
	110,
	'Accounting',
	205,
	1700
	);

INSERT INTO departments
VALUES (
	120,
	'Treasury',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	130,
	'Corporate Tax',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	140,
	'Control And Credit',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	150,
	'Shareholder Services',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	160,
	'Benefits',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	170,
	'Manufacturing',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	180,
	'Construction',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	190,
	'Contracting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	200,
	'Operations',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	210,
	'IT Support',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	220,
	'NOC',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	230,
	'IT Helpdesk',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	240,
	'Government Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	250,
	'Retail Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	260,
	'Recruiting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	270,
	'Payroll',
	NULL,
	1700
	);
    
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

# Display all data from Departments table for Sales department (department_name column).
  select*from departments;
SELECT *
FROM Departments
WHERE department_name = 'Retail sales';

  
  # 2. Display the department number and department name for all departments whose location number
  # is equal to the location number of department number 90 (Departments table).
  select 
    department_id,
    department_name
from departments
where location_id = (
    select location_id
    from departments
    where department_id = 90
);


#3. Display the last name and hire date for all employees who was hired after employee number 101(Employees table).
select 
    last_name,
    hire_date
from employees
where hire_date > (
    select hire_date
    from employees
    where employee_id = 101
);

# 4. Display the first name, last name, and department number for all employees who work in Sales
 # department (Employees and Departments table).
select 
    employees.first_name,
    employees.last_name,
    employees.department_id
from employees
join departments
    on employees.department_id = departments.department_id
where departments.department_name = 'Retail sales';

# 5. Display the department number and department name for all departments located in Toronto (Departments table).
select 
    department_id,
    department_name
from departments
where location_id = (
    select location_id
    from locations
    where city = 'Toronto');

select*from locations;

























INSERT INTO jobs
VALUES (
	'AD_PRES',
	'President',
	20000,
	40000
	);

INSERT INTO jobs
VALUES (
	'AD_VP',
	'Administration Vice President',
	15000,
	30000
	);

INSERT INTO jobs
VALUES (
	'AD_ASST',
	'Administration Assistant',
	3000,
	6000
	);

INSERT INTO jobs
VALUES (
	'FI_MGR',
	'Finance Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'FI_ACCOUNT',
	'Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'AC_MGR',
	'Accounting Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'AC_ACCOUNT',
	'Public Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'SA_MAN',
	'Sales Manager',
	10000,
	20000
	);

INSERT INTO jobs
VALUES (
	'SA_REP',
	'Sales Representative',
	6000,
	12000
	);

INSERT INTO jobs
VALUES (
	'PU_MAN',
	'Purchasing Manager',
	8000,
	15000
	);

INSERT INTO jobs
VALUES (
	'PU_CLERK',
	'Purchasing Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'ST_MAN',
	'Stock Manager',
	5500,
	8500
	);

INSERT INTO jobs
VALUES (
	'ST_CLERK',
	'Stock Clerk',
	2000,
	5000
	);

INSERT INTO jobs
VALUES (
	'SH_CLERK',
	'Shipping Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'IT_PROG',
	'Programmer',
	4000,
	10000
	);

INSERT INTO jobs
VALUES (
	'MK_MAN',
	'Marketing Manager',
	9000,
	15000
	);

INSERT INTO jobs
VALUES (
	'MK_REP',
	'Marketing Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'HR_REP',
	'Human Resources Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'PR_REP',
	'Public Relations Representative',
	4500,
	10500
	);

COMMIT;

INSERT INTO employees
VALUES (
	100,
	'Steven',
	'King',
	'SKING',
	'515.123.4567',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),
	'AD_PRES',
	24000,
	NULL,
	NULL,
	90
	);

INSERT INTO employees
VALUES (
	101,
	'Neena',
	'Kochhar',
	'NKOCHHAR',
	'515.123.4568',
	STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	102,
	'Lex',
	'De Haan',
	'LDEHAAN',
	'515.123.4569',
	STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	103,
	'Alexander',
	'Hunold',
	'AHUNOLD',
	'590.423.4567',
	STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),
	'IT_PROG',
	9000,
	NULL,
	102,
	60
	);

INSERT INTO employees
VALUES (
	104,
	'Bruce',
	'Ernst',
	'BERNST',
	'590.423.4568',
	STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),
	'IT_PROG',
	6000,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	105,
	'David',
	'Austin',
	'DAUSTIN',
	'590.423.4569',
	STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	106,
	'Valli',
	'Pataballa',
	'VPATABAL',
	'590.423.4560',
	STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	107,
	'Diana',
	'Lorentz',
	'DLORENTZ',
	'590.423.5567',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'IT_PROG',
	4200,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	108,
	'Nancy',
	'Greenberg',
	'NGREENBE',
	'515.124.4569',
	STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),
	'FI_MGR',
	12000,
	NULL,
	101,
	100
	);

INSERT INTO employees
VALUES (
	109,
	'Daniel',
	'Faviet',
	'DFAVIET',
	'515.124.4169',
	STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),
	'FI_ACCOUNT',
	9000,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	110,
	'John',
	'Chen',
	'JCHEN',
	'515.124.4269',
	STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	8200,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	111,
	'Ismael',
	'Sciarra',
	'ISCIARRA',
	'515.124.4369',
	STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7700,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	112,
	'Jose Manuel',
	'Urman',
	'JMURMAN',
	'515.124.4469',
	STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7800,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	113,
	'Luis',
	'Popp',
	'LPOPP',
	'515.124.4567',
	STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),
	'FI_ACCOUNT',
	6900,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	114,
	'Den',
	'Raphaely',
	'DRAPHEAL',
	'515.127.4561',
	STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),
	'PU_MAN',
	11000,
	NULL,
	100,
	30
	);

INSERT INTO employees
VALUES (
	115,
	'Alexander',
	'Khoo',
	'AKHOO',
	'515.127.4562',
	STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),
	'PU_CLERK',
	3100,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	116,
	'Shelli',
	'Baida',
	'SBAIDA',
	'515.127.4563',
	STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2900,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	117,
	'Sigal',
	'Tobias',
	'STOBIAS',
	'515.127.4564',
	STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2800,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	118,
	'Guy',
	'Himuro',
	'GHIMURO',
	'515.127.4565',
	STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),
	'PU_CLERK',
	2600,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	119,
	'Karen',
	'Colmenares',
	'KCOLMENA',
	'515.127.4566',
	STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),
	'PU_CLERK',
	2500,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	120,
	'Matthew',
	'Weiss',
	'MWEISS',
	'650.123.1234',
	STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),
	'ST_MAN',
	8000,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	121,
	'Adam',
	'Fripp',
	'AFRIPP',
	'650.123.2234',
	STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),
	'ST_MAN',
	8200,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	122,
	'Payam',
	'Kaufling',
	'PKAUFLIN',
	'650.123.3234',
	STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),
	'ST_MAN',
	7900,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	123,
	'Shanta',
	'Vollman',
	'SVOLLMAN',
	'650.123.4234',
	STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),
	'ST_MAN',
	6500,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	124,
	'Kevin',
	'Mourgos',
	'KMOURGOS',
	'650.123.5234',
	STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),
	'ST_MAN',
	5800,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	125,
	'Julia',
	'Nayer',
	'JNAYER',
	'650.124.1214',
	STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	126,
	'Irene',
	'Mikkilineni',
	'IMIKKILI',
	'650.124.1224',
	STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	127,
	'James',
	'Landry',
	'JLANDRY',
	'650.124.1334',
	STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	128,
	'Steven',
	'Markle',
	'SMARKLE',
	'650.124.1434',
	STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	129,
	'Laura',
	'Bissot',
	'LBISSOT',
	'650.124.5234',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	130,
	'Mozhe',
	'Atkinson',
	'MATKINSO',
	'650.124.6234',
	STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2800,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	131,
	'James',
	'Marlow',
	'JAMRLOW',
	'650.124.7234',
	STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	132,
	'TJ',
	'Olson',
	'TJOLSON',
	'650.124.8234',
	STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	133,
	'Jason',
	'Mallin',
	'JMALLIN',
	'650.127.1934',
	STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	134,
	'Michael',
	'Rogers',
	'MROGERS',
	'650.127.1834',
	STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	135,
	'Ki',
	'Gee',
	'KGEE',
	'650.127.1734',
	STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	136,
	'Hazel',
	'Philtanker',
	'HPHILTAN',
	'650.127.1634',
	STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	137,
	'Renske',
	'Ladwig',
	'RLADWIG',
	'650.121.1234',
	STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3600,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	138,
	'Stephen',
	'Stiles',
	'SSTILES',
	'650.121.2034',
	STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	139,
	'John',
	'Seo',
	'JSEO',
	'650.121.2019',
	STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	140,
	'Joshua',
	'Patel',
	'JPATEL',
	'650.121.1834',
	STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	141,
	'Trenna',
	'Rajs',
	'TRAJS',
	'650.121.8009',
	STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	142,
	'Curtis',
	'Davies',
	'CDAVIES',
	'650.121.2994',
	STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	143,
	'Randall',
	'Matos',
	'RMATOS',
	'650.121.2874',
	STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	144,
	'Peter',
	'Vargas',
	'PVARGAS',
	'650.121.2004',
	STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	145,
	'John',
	'Russell',
	'JRUSSEL',
	'011.44.1344.429268',
	STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),
	'SA_MAN',
	14000,
	.4,
	100,
	80
	);

INSERT INTO employees
VALUES (
	146,
	'Karen',
	'Partners',
	'KPARTNER',
	'011.44.1344.467268',
	STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),
	'SA_MAN',
	13500,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	147,
	'Alberto',
	'Errazuriz',
	'AERRAZUR',
	'011.44.1344.429278',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_MAN',
	12000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	148,
	'Gerald',
	'Cambrault',
	'GCAMBRAU',
	'011.44.1344.619268',
	STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),
	'SA_MAN',
	11000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	149,
	'Eleni',
	'Zlotkey',
	'EZLOTKEY',
	'011.44.1344.429018',
	STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),
	'SA_MAN',
	10500,
	.2,
	100,
	80
	);

INSERT INTO employees
VALUES (
	150,
	'Peter',
	'Tucker',
	'PTUCKER',
	'011.44.1344.129268',
	STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.3,
	145,
	80
	);

INSERT INTO employees
VALUES (
	151,
	'David',
	'Bernstein',
	'DBERNSTE',
	'011.44.1344.345268',
	STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	152,
	'Peter',
	'Hall',
	'PHALL',
	'011.44.1344.478968',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	153,
	'Christopher',
	'Olsen',
	'COLSEN',
	'011.44.1344.498718',
	STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	154,
	'Nanette',
	'Cambrault',
	'NCAMBRAU',
	'011.44.1344.987668',
	STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	155,
	'Oliver',
	'Tuvault',
	'OTUVAULT',
	'011.44.1344.486508',
	STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	145,
	80
	);

INSERT INTO employees
VALUES (
	156,
	'Janette',
	'King',
	'JKING',
	'011.44.1345.429268',
	STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	157,
	'Patrick',
	'Sully',
	'PSULLY',
	'011.44.1345.929268',
	STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	158,
	'Allan',
	'McEwen',
	'AMCEWEN',
	'011.44.1345.829268',
	STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	159,
	'Lindsey',
	'Smith',
	'LSMITH',
	'011.44.1345.729268',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	160,
	'Louise',
	'Doran',
	'LDORAN',
	'011.44.1345.629268',
	STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	161,
	'Sarath',
	'Sewall',
	'SSEWALL',
	'011.44.1345.529268',
	STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.25,
	146,
	80
	);

INSERT INTO employees
VALUES (
	162,
	'Clara',
	'Vishney',
	'CVISHNEY',
	'011.44.1346.129268',
	STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),
	'SA_REP',
	10500,
	.25,
	147,
	80
	);

INSERT INTO employees
VALUES (
	163,
	'Danielle',
	'Greene',
	'DGREENE',
	'011.44.1346.229268',
	STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.15,
	147,
	80
	);

INSERT INTO employees
VALUES (
	164,
	'Mattea',
	'Marvins',
	'MMARVINS',
	'011.44.1346.329268',
	STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	7200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	165,
	'David',
	'Lee',
	'DLEE',
	'011.44.1346.529268',
	STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),
	'SA_REP',
	6800,
	.1,
	147,
	80
	);

INSERT INTO employees
VALUES (
	166,
	'Sundar',
	'Ande',
	'SANDE',
	'011.44.1346.629268',
	STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),
	'SA_REP',
	6400,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	167,
	'Amit',
	'Banda',
	'ABANDA',
	'011.44.1346.729268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	168,
	'Lisa',
	'Ozer',
	'LOZER',
	'011.44.1343.929268',
	STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	11500,
	.25,
	148,
	80
	);

INSERT INTO employees
VALUES (
	169,
	'Harrison',
	'Bloom',
	'HBLOOM',
	'011.44.1343.829268',
	STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	170,
	'Tayler',
	'Fox',
	'TFOX',
	'011.44.1343.729268',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SA_REP',
	9600,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	171,
	'William',
	'Smith',
	'WSMITH',
	'011.44.1343.629268',
	STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),
	'SA_REP',
	7400,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	172,
	'Elizabeth',
	'Bates',
	'EBATES',
	'011.44.1343.529268',
	STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	7300,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	173,
	'Sundita',
	'Kumar',
	'SKUMAR',
	'011.44.1343.329268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6100,
	.10,
	148,
	80
	);

INSERT INTO employees
VALUES (
	174,
	'Ellen',
	'Abel',
	'EABEL',
	'011.44.1644.429267',
	STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),
	'SA_REP',
	11000,
	.30,
	149,
	80
	);

INSERT INTO employees
VALUES (
	175,
	'Alyssa',
	'Hutton',
	'AHUTTON',
	'011.44.1644.429266',
	STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8800,
	.25,
	149,
	80
	);

INSERT INTO employees
VALUES (
	176,
	'Jonathon',
	'Taylor',
	'JTAYLOR',
	'011.44.1644.429265',
	STR_TO_DATE('24-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8600,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	177,
	'Jack',
	'Livingston',
	'JLIVINGS',
	'011.44.1644.429264',
	STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),
	'SA_REP',
	8400,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	178,
	'Kimberely',
	'Grant',
	'KGRANT',
	'011.44.1644.429263',
	STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	149,
	NULL
	);

INSERT INTO employees
VALUES (
	179,
	'Charles',
	'Johnson',
	'CJOHNSON',
	'011.44.1644.429262',
	STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	149,
	80
	);

INSERT INTO employees
VALUES (
	180,
	'Winston',
	'Taylor',
	'WTAYLOR',
	'650.507.9876',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	181,
	'Jean',
	'Fleaur',
	'JFLEAUR',
	'650.507.9877',
	STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	182,
	'Martha',
	'Sullivan',
	'MSULLIVA',
	'650.507.9878',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	183,
	'Girard',
	'Geoni',
	'GGEONI',
	'650.507.9879',
	STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	184,
	'Nandita',
	'Sarchand',
	'NSARCHAN',
	'650.509.1876',
	STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4200,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	185,
	'Alexis',
	'Bull',
	'ABULL',
	'650.509.2876',
	STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),
	'SH_CLERK',
	4100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	186,
	'Julia',
	'Dellinger',
	'JDELLING',
	'650.509.3876',
	STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3400,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	187,
	'Anthony',
	'Cabrio',
	'ACABRIO',
	'650.509.4876',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	188,
	'Kelly',
	'Chung',
	'KCHUNG',
	'650.505.1876',
	STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3800,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	189,
	'Jennifer',
	'Dilly',
	'JDILLY',
	'650.505.2876',
	STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3600,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	190,
	'Timothy',
	'Gates',
	'TGATES',
	'650.505.3876',
	STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	191,
	'Randall',
	'Perkins',
	'RPERKINS',
	'650.505.4876',
	STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	192,
	'Sarah',
	'Bell',
	'SBELL',
	'650.501.1876',
	STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4000,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	193,
	'Britney',
	'Everett',
	'BEVERETT',
	'650.501.2876',
	STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3900,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	194,
	'Samuel',
	'McCain',
	'SMCCAIN',
	'650.501.3876',
	STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	195,
	'Vance',
	'Jones',
	'VJONES',
	'650.501.4876',
	STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	196,
	'Alana',
	'Walsh',
	'AWALSH',
	'650.507.9811',
	STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	197,
	'Kevin',
	'Feeney',
	'KFEENEY',
	'650.507.9822',
	STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	198,
	'Donald',
	'OConnell',
	'DOCONNEL',
	'650.507.9833',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	199,
	'Douglas',
	'Grant',
	'DGRANT',
	'650.507.9844',
	STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	200,
	'Jennifer',
	'Whalen',
	'JWHALEN',
	'515.123.4444',
	STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),
	'AD_ASST',
	4400,
	NULL,
	101,
	10
	);

INSERT INTO employees
VALUES (
	201,
	'Michael',
	'Hartstein',
	'MHARTSTE',
	'515.123.5555',
	STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),
	'MK_MAN',
	13000,
	NULL,
	100,
	20
	);

INSERT INTO employees
VALUES (
	202,
	'Pat',
	'Fay',
	'PFAY',
	'603.123.6666',
	STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),
	'MK_REP',
	6000,
	NULL,
	201,
	20
	);

INSERT INTO employees
VALUES (
	203,
	'Susan',
	'Mavris',
	'SMAVRIS',
	'515.123.7777',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'HR_REP',
	6500,
	NULL,
	101,
	40
	);

INSERT INTO employees
VALUES (
	204,
	'Hermann',
	'Baer',
	'HBAER',
	'515.123.8888',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'PR_REP',
	10000,
	NULL,
	101,
	70
	);

INSERT INTO employees
VALUES (
	205,
	'Shelley',
	'Higgins',
	'SHIGGINS',
	'515.123.8080',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_MGR',
	12000,
	NULL,
	101,
	110
	);

INSERT INTO employees
VALUES (
	206,
	'William',
	'Gietz',
	'WGIETZ',
	'51hr5.123.8181',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_ACCOUNT',
	8300,
	NULL,
	205,
	110
	);
    select *from employees;
    
    -----------------------------------------------------
    # 1. Display the first name and department number for all customers whose last name is “De Haan”
    #(Employees table).
    
  select  first_name , department_id  FROM employees WHERE  last_name='De Haan' ;
  
  
  -----------------------------------------------------
  # 3. Display the first name, last_name, department number and salary for all employees who earn
#  more than 9700 (Employees table).

  SELECT first_name, last_name, department_id,salary FROM employees WHERE salary >9700;
  
  -----------------------------------------------------
  # 4. Display all data from Employees table for all employees who was hired before January 1st, 1992.
  
  SELECT *FROM employees WHERE hire_date <'1992-01-01';
  
  -----------------------------------------------------
  # Display the employee number, first name, job id and department number for all employees whose department number is equal to 20, 60 and 80 (Employees table)
  
   SELECT  phone_number ,first_name,job_id department_id FROM employees WHERE department_id IN (20,60,80);
   
   
   -----------------------------------------------------
  #6. Display the employee number, first name, job id and department number for all employees whose department number is not equal to 20, 60 and 80 (Employees table)
  
  SELECT phone_number,first_name,job_id , department_id FROM employees WHERE department_id NOT IN (20,60,80);
  
  
  -----------------------------------------------------
  #7. Display the last name, phone number, salary and manager number, for all employees whose
# manager number equals 100, 102 or 103 (Employees table).

SELECT last_name ,phone_number, salary, manager_id FROM employees WHERE manager_id IN (100,102,103);

-----------------------------------------------------
# 8. Display the first name and salary for all employees whose first name ends with an e (Employees table).

SELECT first_name, salary FROM employees WHERE first_name LIKE '%e';   # % means any charator before.alter



-----------------------------------------------------
# 9. Display the last name and department number for all employees where the second letter in their
# last name is i (Employees table).

SELECT last_name, department_id FROM employees WHERE last_name LIKE '_i%';   # for second leter -%


-----------------------------------------------------
# 10. Display all data from Employees table for all employees who have the letters : L, J, or H in their
# last name. Sort the query in descending order by salary.

SELECT *FROM employees WHERE last_name LIKE 'L%' OR '%J%' OR '%H%'
order by salary DESC;

 
 
 -----------------------------------------------------
 # 11. Display the first name, hire date, salary and department number for all employees whose first 
 # name doesn’t have the letter A. Sort the query in ascending order by department number (Employees table).
 
 SELECT first_name,hire_date salary,department_id  FROM employees WHERE first_name NOT LIKE '%A%'
 order by first_name asc;


-----------------------------------------------------
# 12. Display all data from Employees table for all employees without any department number.
SELECT *FROM employees WHERE department_id is NULL;



-----------------------------------------------------
#13. Display the first name concatenated with the last name, separated by comma, and salary, for all
#employees whose salary not in the range between 7000 and 15000. Sort the query in ascending
#order by the full name (Employees table).

SELECT concat(first_name, ',', last_name) AS fullName, salary FROM employees WHERE salary NOT BETWEEN 7000 AND 15000
order by fullName asc;


-----------------------------------------------------
select*FROM employees;
#14. Display the first name concatenated with the last name, separated by comma, the phone number concatenated with the email address, separated by hyphen, and salary, for all employees
# whose salary is in the range of 5000 and 10000. Name the column headings: “FULL_NAME”, “CONTACTS” and “SAL” respectively (Employees table).

SELECT
concat(first_name, ',' , last_name) AS FULL_NAME,
concat(phone_number, '-' , email) AS CONCATS,
salary AS sal
FROM employees
WHERE salary BETWEEN 5000 AND 10000;

# 15. Display all data from Employees table for all employees whose: salary is in the range of 6000 and 800 and their commission is not null or department number is not equal to 80, 90 and 100 and their
# hire date is before January 1st, 1990. 

SELECT *
FROM employees
WHERE 
(
    (salary BETWEEN 800 AND 6000 AND commission_pct IS NOT NULL)
    OR
    (department_id NOT IN (80, 90, 100))
)
AND
hire_date < '1990-01-01';



# 16. Display last name, job id and hire date for all employees who was hired during December 12th, 1995 and April 17th, 1998.

SELECT 
last_name,job_id,hire_date
FROM employees
WHERE hire_date BETWEEN  '1995-12-12' AND '1998-04-17';

# 17. Display the first name concatenated with last name, hire date, commission percentage, telephone, and salary for all employees whose salary is greater than 10000 or the third digit in their
# phone number equals 5. Sort the query in a descending order by the first name (Employees table).

SELECT  concat(first_name, ' ', last_name) AS fullName, hire_date,commission_pct,phone_number,salary
FROM employees
WHERE salary> 10000 OR substring(phone_number, 3,1)=5
order by first_name DESC;

# 18. Display the last name and salary for all employees who earn more than 12000 (Employees table).
SELECT last_name ,salary FROM employees WHERE salary>12000;


# 19. Display the last name and department number for all employees whose department number is equal to 50 or 80.
# Perform this exercise once by using the IN operator, once by using the OR operator.

SELECT last_name, department_id FROM employees
WHERE department_id IN (50,80);

SELECT last_name, department_id FROM employees
WHERE department_id =50 OR department_id= 80;

# 20. Display the first name and salary for all employees who doesn’t earn any commission.
SELECT first_name ,salary FROM employees WHERE commission_pct is NULL;


# 21. Display the first name, salary, and manager number for all employees whose manager number is not null

SELECT first_name, salary, manager_id FROM employees WHERE manager_id is NOT NULL;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1. Display the first name in lower case and last name in upper case, for all employees whose employee number is in the range between 80 and 150.
SELECT lower(first_name),
upper(last_name)
FROM employees
WHERE employee_id  BETWEEN 80 AND 150 ;


# 2. Display the first name and last name for all employees whose family name is King, perform this 
# exercise with a case-insensitive search (regardless of the capitalization used for the values within last name column).
select*from employees;

SELECT first_name , last_name FROM employees WHERE LOWER (last_name ='King');

# 3. Generating new email address
# For each employee, display the first name, last name, and email address. The email address will be composed from the first letter of first name, concatenated with the three
# first letters of last name, concatenated with @oracle.com. (b). For each employee, display the first name, last name, and email address. The email
# address will be composed from the first letter of first name, concatenated with the three last letters of last name, concatenated with @oracle.com.

SELECT first_name,last_name, email ,
concat(
left(first_name, 1),
left(last_name, 3),
'@oracle.com')
AS email_address FROM employees;

# 4. Using the CONCAT function
# a. For each employee, use the CONCAT function to display the first name concatenated with the last name.

SELECT concat(first_name,last_name) AS fullName FROM employees;


# b. For each employee, use the CONCAT function to display the first name concatenated with the last name, concatenated with hire date.

SELECT concat(first_name,last_name,hire_date) AS Detail FROM employees;

# 5. Display the last name for all employees where last name’s length is greater than 8 characters.
SELECT last_name
FROM employees
WHERE char_length(last_name) >8; 

# 6. Phone numbers:
# a. For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. in the new phone number replace all occurrences of 515 with 815.
SELECT first_name,last_name ,phone_number ,
replace(phone_number, 515,815) AS new_phone_no
FROM employees;


# b. For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. in the new phone number replace all prefixes of 515 with 815.

SELECT 
    first_name,
    last_name,
    phone_number,
    REPLACE(phone_number, '515-', '815-') AS new_phone_number
FROM employees;


------------------------------------------------------------------------------
# 7. For each employee, display :
# a. first name b. salary c. salary after a raise of 12% d. salary after a raise of 12%, expressed as a whole number (ROUND). 
# e. salary after a raise of 12%, round down to the nearest whole number.

SELECT 
    first_name,
    salary,
    salary * 1.12 AS salary_after_raise,
    ROUND(salary * 1.12) AS salary_after_raise_round,
    FLOOR(salary * 1.12) AS salary_after_raise_floor
FROM employees;



-----------------------------------------------------
# 8. For each employee, display the first name, hire date, hire date minus 10 days, hire date plus one
# month, and the day difference between current date and hire date.

select 
    first_name,
    hire_date,
    date_sub(hire_date, interval 10 day) as hire_date_minus_10_days,
    date_add(hire_date, interval 1 month) as hire_date_plus_1_month,
    datediff(curdate(), hire_date) as days_since_hire
from employees;



---------------------------------------------------
# 9. For each employee, display the first name, last name, hire date, number of months he works in
# the company, and number of years he works in the company.
select 
    first_name,
    last_name,
    hire_date,
    timestampdiff(month, hire_date, curdate()) as months_in_company,
    timestampdiff(year, hire_date, curdate()) as years_in_company
from employees;


----------------------------------------------------
# 10. For each employee, display the first name, hire date, and hire date plus one year.
select 
    first_name,
    hire_date,
    date_add(hire_date, interval 1 year) as hire_date_plus_1_year
from employees;


---------------------------------------------------
# 11. For each employee, display the first name, hire date, hire date rounded up to the nearest year,
# and hire date rounded up to the nearest month.
select 
    first_name,
    hire_date,
    makedate(year(hire_date) + 1, 1) as hire_date_rounded_up_year,
    date_add(last_day(hire_date), interval 1 day) as hire_date_rounded_up_month
from employees;


-------------------------------------------------
# 12. For each employee, display the first name, the day of his hire date, and the year of his hire date.
select 
    first_name,
    day(hire_date) as hire_day,
    year(hire_date) as hire_year
from employees;


--------------------------------------------------------
# 13. Display the last name in upper case, the salary in format model : ‘9,999.999’, and hire date in
# format model: ‘DD/MM/YYYY’, for all employees whose last name begins with the letter D or K.

select 
    upper(last_name) as last_name_upper,
    format(salary, 3) as formatted_salary,
    date_format(hire_date, '%d/%m/%Y') as formatted_hire_date
from employees
where last_name like 'd%' or last_name like 'k%';


# 14. Commission Percentage
# a. For each employee, display the first name, last name, salary and commission percentage. If an employee doesn’t earn a commission, display 0 instead of NULL.
# b. For each employee, display the first name, last name, salary and commission percentage. If an employee doesn’t earn a commission, display “No Commission” instead of NULL.

select 
    first_name,
    last_name,
    salary,
    ifnull(commission_pct, 0) as commission_pct
from employees;

select 
    first_name,
    last_name,
    salary,
    ifnull(commission_pct, 'No Commission') as commission_pct
from employees;



-------------------------------------------------------------------------
#15. For each employee, display the first name, last name, salary, and a salary grade based on these
#conditions :
# a. if the salary is between 0 and 5000 – salary grade level is A ,b. if the salary is between 5001 and 15000 – salary grade level is B
# c. if the salary is between 15001 and 20000 – salary grade level is C ,d. for any other range – salary grade level is D

select 
    first_name,
    last_name,
    salary,
    case 
        when salary between 0 and 5000 then 'A'
        when salary between 5001 and 15000 then 'B'
        when salary between 15001 and 20000 then 'C'
        else 'D'
    end as salary_grade
from employees;


----------------------------------------------------------------------------------
# Problem Statements to be solved using – Basic Select Statements
# 1.Create a query to display the employee number, first name, last name, phone number and department number (Employees table).

select 
    employee_id,
    first_name,
    last_name,
    phone_number,
    department_id
from employees;


-------------------------------------------------------------------------------
# 2. Create a query to display the first name, last name, hire date, salary, and salary after a raise of
# 20%. Name the last column (salary after a raise) heading as “ANNUAL_SAL” (Employees table).

select 
    first_name,
    last_name,
    hire_date,
    salary,
    salary * 1.20 as annual_sal
from employees;



---------------------------------------------------------------------------
# 3. Create a query to display the last name concatenated with the first name, separated by space, and
# the telephone number concatenated with the email address, separated by hyphen. Name the column headings “FULL_NAME” and “CONTACT_DETAILS” respectively (Employees tables).
select 
    concat(last_name, ' ', first_name) as full_name,
    concat(phone_number, '-', email) as contact_details
from employees;



------------------------------------------------------------------
# 4. Create a query to display the unique manager numbers from Employees table.

select distinct manager_id
from employees;



------------------------------------
# 5. Create a query to display the last name concatenated with job_id column, separated by space. Name this column heading as “EMPLOYEE_AND_TITLE” (Employees table).
select 
    concat(last_name, ' ', job_id) as employee_and_title
from employees;


-----------------------------------------------------
#6. Create a query to display the first name, last name, salary, and hire date concatenated with the
# literal string “HD”, separated by space. Name the column headings “FN”, “LN”, “SAL”, and “HD” respectively (Employees table).

select 
    first_name as fn,
    last_name as ln,
    salary as sal,
    concat(hire_date, ' HD') as hd
from employees;


-----------------------------------------------------
# 7. Create a query to display the unique salaries in Employees tables.
select distinct salary
from employees;




-----------------------------------------------------
# 8. Create a query to display the unique combination of values in department_id and job_id columns (Employees table)

select distinct department_id, job_id
from employees;



-----------------------------------------------------
# Problem Statements to be solved using – Group By

#1. Display the lowest last name alphabetically (Employees table).
#2. Display the highest last name alphabetically (Employees table).
#3. Display the number of rows in Employees table.
#4. Display the number of values (exclude NULLs) in commission_pct column (Employees table).
#5. Display the number of NULL values in commission_pct column (Employees table).
#6. Display the highest, lowest, and average salary.

select min(last_name) as lowest_last_name
from employees;


-----------------------------------------------------
select max(last_name) as highest_last_name
from employees;


-----------------------------------------------------
select count(*) as total_rows
from employees;


-----------------------------------------------------
select count(commission_pct) as non_null_commission_count
from employees;


-----------------------------------------------------
select count(*) - count(commission_pct) as null_commission_count
from employees;


-----------------------------------------------------
select 
    max(salary) as highest_salary,
    min(salary) as lowest_salary,
    avg(salary) as average_salary
from employees;


-----------------------------------------------------

# Problem Statements to be solved using - GROUP BY and HAVING Clauses
#7. Average salary per department a. Display the department number and average salary for each department. b. Modify your query to display the results only for departments 50 or 80.
# 8. Numer of employees per job id a. Display the job id and the number of employees for each job id.
#b. Modify your query to display the results only for employees whose salary is greater the 10000.
#c. Modify your query again, this time display the results only for jobs with more than 2 people.

select 
    department_id,
    avg(salary) as average_salary
from employees
group by department_id;


-----------------------------------------------------
select 
    department_id,
    avg(salary) as average_salary
from employees
where department_id in (50, 80)
group by department_id;



-----------------------------------------------------
select 
    job_id,
    count(*) as employee_count
from employees
group by job_id;



-----------------------------------------------------
select 
    job_id,
    count(*) as employee_count
from employees
where salary > 10000
group by job_id;



-----------------------------------------------------
select 
    job_id,
    count(*) as employee_count
from employees
group by job_id
having count(*) > 2;


-----------------------------------------------------
 #isplay the first name, salary and department number for all employees who work in the
 #department as employee number 124 (Employees table).
select 
    first_name,
    salary,
    department_id
from employees
where department_id = (
    select department_id
    from employees
    where employee_id = 124
);


-----------------------------------------------------
# 7. Display the first name, salary, and department number for all employees who earn more than the
# average salary (Employees table).
select 
    first_name,
    salary,
    department_id
from employees
where salary > (
    select avg(salary)
    from employees
);


-----------------------------------------------------
# 8. Display the first name, salary, and department number for all employees whose salary equals one
# of the salaries in department number 20 (Employees table).
select 
    first_name,
    salary,
    department_id
from employees
where salary in (
    select salary
    from employees
    where department_id = 20
);




-----------------------------------------------------
# 9. Display the first name, salary, and department number for all employees who earn more than
# maximum salary in department number 50 (Employees table).

select 
    first_name,
    salary,
    department_id
from employees
where salary > (
    select max(salary)
    from employees
    where department_id = 50
);



-----------------------------------------------------
#10. Display the first name, salary, and department number for all employees who earn more than the minimum salary in department number 60 (Employees table).
#11. Display the first name, salary, and department number for all employees who earn less than the minimum salary of department number 90 (Employees table).

select 
    first_name,
    salary,
    department_id
from employees
where salary > (
    select min(salary)
    from employees
    where department_id = 60
);


select 
    first_name,
    salary,
    department_id
from employees
where salary < (
    select min(salary)
    from employees
    where department_id = 90
);




-----------------------------------------------------
# 12. Display the first name, salary and department number for all employees whose department is located Seattle (Employees, Departments and Locations table).
#13. Display the first name, salary, and department number for all employees who earn less than the average salary, and also work at the same department as employee whose first name is Kevin
select 
    e.first_name,
    e.salary,
    e.department_id
from employees e
join departments d 
    on e.department_id = d.department_id
join locations l 
    on d.location_id = l.location_id
where l.city = 'Seattle';


SELECT 
    first_name,
    salary,
    department_id
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id IN (
        SELECT department_id
        FROM employees
        WHERE first_name = 'Kevin'
    )
)
AND department_id IN (
    SELECT department_id
    FROM employees
    WHERE first_name = 'Kevin'
);



--------------------------------------------------------------------------------------------------------------------------------
#Problem Statements to be solved using – Inner JOIN
#1. Employees and departments (Employees & Departments tables)
#a. For each employee, display the first name, last name, department number and department name.
#b. Display the first name, last name, department number and department name, for all employees indepartments 50 or 90.
#2. Departments and locations (Departments, Employees & Locations tables)
#a. For each department, display the department name, city, and state province.
#b. For each employee, display the full name, department name, city, and state province.

#c. Display the full name, department name, city, and state province, for all employees whose last name contains the letter a.

-----------------------------------------------------
SELECT e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-------------------------------------------------------
SELECT 
    e.first_name || ' ' || e.last_name AS full_name,
    d.department_name,
    l.city,
    l.state_province
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;

-------------------------------------------------------
SELECT d.department_name,
       l.city,
       l.state_province
FROM departments d
INNER JOIN locations l
    ON d.location_id = l.location_id;

-------------------------------------------------------
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       d.department_name,
       l.city,
       l.state_province
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
INNER JOIN locations l
    ON d.location_id = l.location_id;

-------------------------------------------------------
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       d.department_name,
       l.city,
       l.state_province
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
INNER JOIN locations l
    ON d.location_id = l.location_id
WHERE e.last_name LIKE '%a%';



------------------------------------------------------------------------------------------------------------------------------------
#Problem Statements to be solved using – Outer JOIN

#4. Employees & departments
#a. Display the first name, last name, department number and department name, for all employees including those without any department.
#b. Modify your query to display all departments including departments without any employees.

-------------------------------------------------------
SELECT e.first_name, 
       e.last_name, 
       e.department_id, 
       d.department_name
FROM employees e
LEFT JOIN departments d 
       ON e.department_id = d.department_id;

-------------------------------------------------------
SELECT e.first_name, 
       e.last_name, 
       e.department_id, 
       d.department_name
FROM employees e
RIGHT JOIN departments d 
    ON e.department_id = d.department_id;

----------------------------------------------------------------------------------------------------------------------

#Problem Statements to be solved using – Self JOIN

#5. Employees and managers (Employees table)
#a. For each employee, display the last name, and the manager’s last name.
#b. Modify your query to display all employees including those without any manager.
#6. Display the first name, last name, and department number for all employees who work in the same department as employee whose last name is “King”.
#7. Display the last name and salary for all employees who earn less than employee number 103

-------------------------------------------------------
SELECT e.last_name AS Employee,
       m.last_name AS Manager
FROM employees e
JOIN employees m 
    ON e.manager_id = m.employee_id;


-------------------------------------------------------
SELECT e.last_name AS Employee,
       m.last_name AS Manager
FROM employees e
LEFT JOIN employees m 
    ON e.manager_id = m.employee_id;

-------------------------------------------------------
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE last_name = 'King'
);

-------------------------------------------------------
SELECT last_name, salary
FROM employees
WHERE salary < (
    SELECT salary
    FROM employees
    WHERE employee_id = 103
);





















































































INSERT INTO job_history





VALUES (
	102,
	STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),
	STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),
	'IT_PROG',
	60
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),
	STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),
	'AC_ACCOUNT',
	110
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),
	STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),
	'AC_MGR',
	110
	);

INSERT INTO job_history
VALUES (
	201,
	STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),
	STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),
	'MK_REP',
	20
	);

INSERT INTO job_history
VALUES (
	114,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	122,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),
	STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),
	'AD_ASST',
	90
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'SA_REP',
	80
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'SA_MAN',
	80
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'AC_ACCOUNT',
	90
	);
    
COMMIT;

/* *************************************************************** 
***************************FOREIGN KEYS***************************
**************************************************************** */

ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);    
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
hr-schema-mysql.sql
Displaying hr-schema-mysql.sql.