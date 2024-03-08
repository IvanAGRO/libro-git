/* Challenge 11: (SELECT) */
/* Ejercicio 5: Introducción a Subconsulta de Lista */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */
USE developers;

/* Apartado 3. Selecciona el nombre completo del programador cuyo salario sea el mayor de todos. */ 
SELECT CONCAT_WS(" ",pro.nombreP,pro.ap1,pro.ap2) as nombreCompleto,pro.salario
FROM programador pro
WHERE pro.salario = (
	select max(pro.salario)
    FROM programador pro
);


SELECT CONCAT_WS(" ",pro.nombreP,pro.ap1,pro.ap2) as nombreCompleto, pro.salario
FROM programador pro
WHERE pro.salario >= ALL (
	select pro.salario
    FROM programador pro
);