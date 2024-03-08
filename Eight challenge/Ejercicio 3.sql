/* Challenge 11: (SELECT) */
/* Ejercicio 3: Funciones de Agregado */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */
/* CONSULTAS DE PRUEBA */
USE developers;
-- Selecciona el sueldo máximo de todos los desarrolladores.
SELECT MAX(pro.salario)
FROM programador pro;

-- Selecciona el sueldo mínimo de todos los desarrolladores cuya sección es Backend.
SELECT min(pro.salario) as salarioMinimo
FROM programador pro
WHERE pro.seccion = (
	select s.idSeccion
    FROM seccion s
    WHERE s.nombreS="Backend"
);
-- Selecciona el sueldo medio de todos los desarrolladores.
SELECT AVG(pro.salario) as sueldoMedio
FROM programador pro;

-- Cuál es la suma total de todos los sueldos de los desarrolladores.
SELECT SUM(pro.salario) AS sumaTotal
FROM programador pro;
-- Cuántos desarrolladores hay en total.
SELECT count(*) as cantidad
FROM programador;



/* Apartado 1: Muestra la sección cuyo desarrollador tenga el salario máximo. */
SELECT pro.seccion,s.nombreS
FROM programador pro
JOIN seccion s ON s.idSeccion=pro.seccion
WHERE pro.salario = (
	SELECT max(pro.salario)
    FROM programador pro 
);

/* Apartado 2: Muestra el nombre del hub en el que trabaja el desarrollador con el salario más bajo. */
SELECT h.nombre
FROM hub h
JOIN programador pro ON pro.hub=h.id
WHERE pro.salario = (
	SELECT min(pro.salario)
    FROM programador pro
);


/* Apartado 3: Selecciona el nombre de los desarrolladores cuyo salario está por encima del salario medio. */
SELECT concat_ws(" ",pro.nombreP,pro.ap1,pro.ap2) as nombreCompleto
FROM programador pro
WHERE pro.salario > (
	SELECT avg(pro.salario)
    FROM programador pro
);


/* Apartado 4 :Selecciona el nombre completo de los desarrolladores cuyo salario es menor que el salario medio de los desarrolladores cuyo hub se encuentra situado en Madrid. */
SELECT concat_ws(" ",pro.nombreP,pro.ap1,pro.ap2) as nombreCompleto
FROM programador pro
WHERE pro.salario < (
	SELECT avg(pro.salario)
    FROM programador pro
    JOIN hub h ON h.id=pro.hub
    WHERE h.provincia=28
);
-- Para ver el código de Madrid (28)
SELECT * FROM provincia WHERE nombreProvincia="Madrid";

/* Apartado 5: Selecciona el nombre de la sección cuya partida económica es mayor. */
SELECT s.nombreS
FROM seccion s
WHERE s.partidaEconomica = (
	SELECT max(s.partidaEconomica)
    FROM seccion s

);

/* Apartado 6: Selecciona el nombre de las secciones cuyo desembolso es mayor que el desembolso medio. */
SELECT s.nombreS
FROM seccion s
WHERE s.desembolso > (
	SELECT AVG(s.desembolso)
    FROM seccion s
);
