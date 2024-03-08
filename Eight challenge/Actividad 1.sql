--
use fortinesneomedievales;
-- 1. Muestra el nombre completo de el/los vigilante/s más edad.
SELECT concat_ws(" ", v.nombreVig,v.ap1,v.ap2) AS nombreCompleto
FROM vigilante v
WHERE v.fechaNacimiento >= ALL
(SELECT v.fechaNacimiento
FROM vigilante v);


-- 2. Muestra el nombre completo de el/los vigilante/s que menos cobren.
SELECT concat_ws(" ", v.nombreVig,v.ap1,v.ap2) AS nombreCompleto
FROM vigilante v
where v.sueldo <ANY (
	SELECT v.sueldo
    from vigilante v
);
/* 3. Selecciona el nombre de el/los fortín/es 
cuya capacidad sea menor que la suma de la capacidad 
de los fortines que no tienen foso.*/
SELECT f.nombreFortin
FROM fortin f 
WHERE f.capacidad <(
SELECT sum(f.capacidad)
FROM fortin f
WHERE f.foso="No"); 

/* 4. Selecciona el nombre de el/los fortín/es 
cuya altura sea mayor que la media de los fortines 
que tienen foso.*/
SELECT f.nombreFortin
FROM fortin f
WHERE f.altura > (
	SELECT avg(f.altura)
	FROM fortin f 
	WHERE f.foso="Si");

/* 5. Muestra el nombre completo de los vigilantes 
cuyo fortín sea el de mayor diámetro.*/
SELECT concat_ws(" ", v.nombreVig,v.ap1,v.ap2) AS nombreCompleto
FROM vigilante v
JOIN fortin f ON f.vigilante_dni =v.dni
WHERE f.diametro >= (
SELECT max(f.diametro)
FROM fortin f)

;




/* 6. Selecciona el nombre de los fortines 
cuyo vigilante no tenga segundo apellido.*/
SELECT f.nombreFortin
FROM fortin f
JOIN vigilante v ON v.dni=f.vigilante_dni
WHERE v.ap2 =(
	SELECT v.ap2
	FROM vigilante v 
	WHERE v.ap2 IS  NULL)
;