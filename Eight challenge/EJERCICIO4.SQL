USE developers;

/* Challenge 11: (SELECT) */
/* Ejercicio 4: Subconsultas Escalonadas II */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */

/* Apartado 1. Selecciona el nombre de la sección que tenga la menor partida económica. */
SELECT s.nombreS
FROM seccion s
WHERE s.partidaEconomica = (
	SELECT MIN(s.partidaEconomica)
    FROM seccion s
)
;

/* Apartado 2. Selecciona el nombre de las secciones cuya desembolso sea menor que el desembolso medio de todas las secciones. */
SELECT s.nombreS
FROM seccion s
WHERE s.desembolso < (
	SELECT AVG(s.desembolso)
    FROM seccion s
);


/* Apartado 3. Selecciona el nombre completo del programador cuyo salario sea el mayor de todos. */ 
SELECT CONCAT_WS(" ",pro.nombreP,pro.ap1,pro.ap2) as nombreCompleto
FROM programador pro
WHERE pro.salario = (
	select max(pro.salario)
    fROM programador pro
);

/* Apartado 4. Selecciona el nombre completo de los programadores cuyo salario sea mayor que el salario medio de todos los desarrolladores que trabajan en Madrid. */
SELECT CONCAT_WS(" ",pro.nombreP,pro.ap1,pro.ap2) AS nombreProgramador
FROM programador pro
WHERE pro.salario >
(
	SELECT avg(pro.salario)
    FROM programador pro
    JOIN hub h ON h.id=pro.hub
    JOIN provincia p ON p.codigo=h.provincia
    WHERE p.nombreProvincia="Madrid"
);

/* Apartado 5. Selecciona el nombre completo del programador cuyo salario sea menor que el salario medio de todos los programadores que trabajan en Backend o Frontend. */
SELECT CONCAT_WS(" ",pro.nombreP,pro.ap1,pro.ap2) AS nombreProgramador
FROM programador pro
WHERE pro.salario <
(
	SELECT avg(pro.salario)
    FROM programador pro
    JOIN seccion s ON s.idSeccion=pro.seccion
    WHERE s.nombreS="BACKEND"
);

/* Apartado 6. Selecciona la suma de todos los salarios cuyo hub se encuentre en Málaga. */

SELECT SUM(pro.salario) as sumaSalarios
FROM programador pro
JOIN hub h ON h.id=pro.hub
JOIN provincia p on p.codigo=h.provincia
WHERE p.nombreProvincia="Málaga";

