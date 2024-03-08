use smallCompany;

-- Selecciona el titulo de los trabajos que no tenga ningún empleado.
SELECT j.job_title
FROM jobs j
LEFT join employees e ON e.job_id=j.job_id
WHERE e.employee_id is null
;
-- Muestra el nombre completo de todos los empleados y el nombre de su departamento. Deben aparecer también los departamentos que no tengan ningún empleado.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreCompleto, d.department_name
FROM employees e
RIGHT JOIN departments d ON d.department_id=e.department_id
;

-- Muestra toda la información de los departamentos cuya localización tiene un código postal que empiece por 9.
SELECT d.*
FROM departments d
JOIN locations l ON l.location_id=d.location_id
WHERE l.postal_code LIKE "9%";

-- Muestra el nombre completo y el email de los empleados que realicen algún trabajo en el que el salario mínimo sea mayor que 4000 y el salario máximo sea menor o igual a 10000.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreCompleto, e.email
FROM employees e
JOIN jobs j ON j.job_id=e.job_id
WHERE j.min_salary > 4000 AND j.max_salary <=10000;

-- Muestra el nombre de los países cuya region es Asia.
SELECT c.country_name
FROM countries c
JOIN regions r ON r.region_id=c.region_id
WHERE r.region_name="Asia";

-- Muestra el nombre completo de los empleados y el nombre completo de sus dependientes en caso de que los tengan.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreCompleto, concat_ws(" ", dep.first_name,dep.last_name) AS nombreCompletoDependiente
FROM employees e
JOIN dependents dep ON dep.employee_id=e.employee_id
;