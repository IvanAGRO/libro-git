use smallCompany;
-- 1. Muestra la media del salario mínimo de aquellos trabajos que no realice ningún usuario.
SELECT AVG(j.min_salary) AS mediaSalarioMinimo
FROM jobs j
LEFT JOIN employees e ON e.job_id=j.job_id
;
-- 2.Muestra el nombre completo de aquellos trabajadores que no tengan a su cargo ningún dependiente y su email empiece por el caracter s.
SELECT concat_ws(" ",e.first_name,e.last_name) AS nombreTrabajadores, d.dependent_id
FROM employees e
LEFT JOIN dependents d on d.employee_id=e.employee_id
WHERE e.email LIKE 's%' AND d.dependent_id iS NULL;
-- 3.Selecciona el nombre completo de cada empleado con su número de teléfono y el nombre del departamento al que pertenece.
SELECT concat_ws(" ",e.first_name,e.last_name) AS nombreTrabajadores, e.phone_number, dep.department_name
FROM employees e
JOIN departments dep on dep.department_id=e.department_id
;
-- 4.Muestra el nombre de los departamentos que no tengan ningún empleado.
SELECT dep.department_name
FROM departments dep
LEFT JOIN employees e ON e.department_id=dep.department_id
WHERE e.employee_id is null
;
-- 5.Selecciona el nombre de aquellas regiones que poseen algún país que su código empiece por el carácter C.
SELECT r.region_name,c.country_id
FROM regions r
JOIN countries c ON c.region_id=r.region_id
WHERE c.country_id LIKE 'C%';
-- 6.Muestra el nombre de aquellos países que posean localizaciones en la provincia de Ontario u Oxford.
SELECT c.country_name,l.state_province
FROM countries c
JOIN locations l ON l.country_id=c.country_id
WHERE l.state_province = "Ontario" OR l.state_province="Oxford"; 