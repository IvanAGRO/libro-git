
use abylatella;
/* Muestra en el resultado de una consulta el nombre completo y el DNI de todos los repartidores 
que no tienen ningún pedido asignado que tienen el carnet B.*/

SELECT concat_ws(" ",r.nombre,r.apellido1,r.apellido2) AS nombreCompleto, r.dni
FROM carnet ca 
RIGHT JOIN repartidor r ON r.dni=ca.dni
LEFT JOIN pedido p ON p.dni=r.dni
WHERE ca.carnet='B' AND p.dni is null;

/* Muestra en el resultado de una consulta toda la información de aquellos pedido 
que poseen alguna línea de pedido con un producto que tenga un pvp de entre 15 y 20 euros.*/
SELECT p.*
FROM pedido p
JOIN lineaPedido l ON l.identificador=p.identificador
WHERE l.pvp between 15 AND 15
LIMIT 1
;

/* Muestra en el resultado de una consulta el dni del repartidor, la dirección de entrega del pedido 
de aquellos repartidores que tengan algún carnet de moto (AM, A1 ó A2).*/
SELECT r.dni,p.direccionEntrega
FROM carnet c 
RIGHT JOIN repartidor r ON r.dni=c.dni
RIGHT JOIN pedido p ON p.dni=r.dni
WHERE c.carnet LIKE 'AM' OR 'A1' OR 'A2'
LIMIT 1;

-- Se valorará el uso de alias para todas las columnas y tablas.