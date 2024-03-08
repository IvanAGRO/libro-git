/* Challenge 11: (SELECT) */
/* Ejercicio 6: Subconsultas de Lista I */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */
USE tienda;

/* Apartado 1: Muestra un listado con los datos de los compradores y las ventas, de todos los compradores que han realizado una venta durante el año 2020 con un valor mayor o igual al valor medio de las ventas realizadas durante ese mismo año. */



/* Apartado 2: Devuelve la venta más cara que existe en la tabla de venta sin hacer uso de MAX, ORDER BY ni LIMIT. */

/* Apartado 3: 1. Selecciona, utilizando predicados cuantificados, los compradores que no han realizado ninguna venta.*/

/* Apartado 4: Lista, mediante predicados cuantificados, a los vendedores que no han realizado ninguna venta.*/

SELECT comp.* 
FROM comprador comp
WHERE comp.idCom = any  (
	SELECT com.idCom
    FROM venta vent
    RIGHT JOIN comprador com ON vent.idComprador=com.idCom
    WHERE  vent.idComprador IS  NULL);