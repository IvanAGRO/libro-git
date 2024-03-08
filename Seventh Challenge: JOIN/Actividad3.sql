USE smallCompany ;

-- 1. Muestra el nombre de aquellos departamentos que tienen empleados que no han sido asignados a ningún trabajo.
SELECT dep.department_name
FROM departments dep
LEFT JOIN employees e ON e.department_id=dep.department_id
left JOIN jobs j ON e.job_id=j.job_id

;
-- 2. Selecciona el nombre de las regiones que poseen alguna localización en una provincia que sea Oxford u Ontario.
SELECT r.region_name
FROM regions r
JOIN countries c on c.region_id=r.region_id
JOIN locations l ON l.country_id=c.country_id
WHERE l.state_province="Oxford" OR l.state_province="Ontario";
-- 3. De los empleados que no poseen dependientes a su cargo, muestra el departamento al que pertenecen y la dirección de la localización de ese departamento.
SELECT dep.department_name, l.street_address 
FROM employees e
RIGHT JOIN departments dep ON dep.department_id=e.department_id
JOIN locations l on dep.location_id=l.location_id
LEFT JOIN dependents d oN d.employee_id=e.employee_id
WHERE d.dependent_id is null
;
-- 4. Muestra el nombre completo de aquellos empleados que trabajan en un departamento cuya localización final se encuentra en algún país de la región de Asia.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreEmpleado
FROM employees e
JOIN departments dep ON dep.department_id=e.department_id
JOIN locations l ON dep.location_id=l.location_id
JOIN countries c ON l.country_id=c.country_id
JOIN regions r oN c.region_id=r.region_id
WHERE r.region_name ="Americas"
;

-- 5. Selecciona en dos columnas el nombre completo del empleado y el nombre completo de su manager.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreEmpleado, concat_ws(" ", em.first_name,em.last_name) AS nombreManager
FROM employees e 
JOIN employees em ON em.manager_id=e.employee_id

;

-- 6. Muestra el nombre completo de los empleados que no tienen ningún manager.
SELECT concat_ws(" ", e.first_name,e.last_name) AS nombreEmpleado
FROM employees e 
WHERE e.manager_id is null;