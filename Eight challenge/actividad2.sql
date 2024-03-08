use fortinesNeomedievales;

/* 1. Obtener el nombre y sueldo de todos los vigilantes 
cuyo sueldo  sea mayor que el sueldo promedio de todos los vigilantes*/

SELECT v.nombreVig, v.sueldo
FROM vigilante v
WHERE v.sueldo > ALL (
	SELECT AVG(v.sueldo)
    FROM vigilante v);
    
/* 2. Mostrar el nombre y número de teléfono de los vigilantes 
que tienen un fortín asignado, 
ordenados por nombre del fortín de manera ascendente.*/

select v.nombreVig,v.tlf
FROM vigilante v
JOIN fortin f ON v.dni=f.vigilante_dni
WHERE f.idFortin in (
    SELECT f.idFortin
	FROM fortin f 
    );

/* 3. Encontrar el nombre de los fortines que tienen mayor capacidad (sin utilizar MAX ni MIN
*/

SELECT f.nombreFortin
FROM fortin f
WHERE f.capacidad >= ALL ( 
	SELECT f.capacidad
    FROM fortin f);
    
/* 4. Mostrar toda la información de los vigilantes que tengan el salario más alto de entre los vigilantes que no tienen asignado ningún fortín. */
SELECT v.*
FROM vigilante v
LEFT JOIN fortin f on f.vigilante_dni=v.dni
WHERE v.sueldo >= ALL (
	SELECT vig.sueldo
    FROM vigilante vig);
    
/* 5. Muestra el nombre completo y el salario de todos los 
vigilantes, excepto del vigilante que más dinero gana. */
SELECT concat_ws (" ", v.nombreVig,v.ap1,v.ap2) AS nombreVigilante, v.sueldo
FROM vigilante v 
WHERE v.sueldo != (
	SELECT distinct(max(vig.sueldo)) 
    FROM vigilante vig);



/* 6. Selecciona el nombre del fortín que vigilen aquellos vigilantes cuyo sueldo sea mayor que el sueldo medio de todos los vigilantes (sin emplear JOIN). */
SELECT f.nombreFortin
FROM fortin f
WHERE f.dni_vigilante = (
	SELECT v.dni
	FROM vigilante v 
	WHERE v.sueldo > ALL (
		SELECT avg(vig.sueldo)
		FROM vigilante vig
        )
	);