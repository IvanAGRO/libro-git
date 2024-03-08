/* Challenge 11: (SELECT) */
/* Ejercicio 7: Subconsultas de Lista II */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */

use smallCompany;
/* Apartado 1: Muestra el nombre completo, el email y el número de teléfono de aquellos empleados que tengan un salario mayor o igual que todos los salarios de aquellos empleados que pertenezcan a algún departamento de la región de Europa.. */
SELECT CONCAT_WS(" ", e.first_name,e.last_name) AS nombreCompleto, e.email,e.phone_number
FROM employees e
WHERE e.salary >= all (
	SELECT d.department_id
    FROM departments d
    JOIN locations l ON l.location_id=d.location_id
	JOIN countries c ON c.country_id=l.country_id
	JOIN regions r ON r.region_id=c.region_id
	WHERE r.region_name="Europe"
);


/* Apartado 2: Muestra el título de los trabajos que tengan asociado trabajadores cuyo salario sea menor que cualquiera los salarios de los empleados que trabajan en la provincia de Washington. */
SELECT j.job_title
FROM jobs j
JOIN employees e ON j.job_id=e.job_id
WHERE e.salary <= ANY(
SELECT l.location_id
FROM locations l
JOIN departments d ON d.location_id=l.location_id
WHERE l.state_province="washington");
/* Apartado 3: Muestra el nombre de las regiones que tienen empleados trabajando en algún trabajo cuyo salario mínimo sea menor que todos los salarios mínimos de los empleados que trabajan en el departamento de IT. */

/* Apartado 4: Muestra el nombre de todos los manager que tengan un salario menor que todos los salarios de los empleados que tienen a su cargo.*/







