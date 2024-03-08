/* Challenge 11: (SELECT) */
/* Ejercicio 2: Predicados Comparativos Básico */
/* Nombre: Iván Aguilar Rodríguez | Expediente: 10203 */
use tallerReparaciones;
/* Apartado 1: Devuelve todos los materiales del proveedor BenQ.*/
SELECT m.nombre
FROM material m
WHERE m.idProveedor IN (
	SELECT p.idProveedor
    FROM proveedor p 
    WHERE p.nombre="BenQ"
);
/* Apartado 2: Devuelve todos los datos de los materiales que tienen el mismo precio que el material más caro del proveedor Lacie. */
SELECT m.*
FROM material m
WHERE m.precio >= (
		SELECT MAX(m.precio)
        FROM material m
        JOIN proveedor p ON p.idProveedor=m.idProveedor
        WHERE p.nombre="Lacie"
);
/* Apartado 3: Lista el nombre del material más caro del proveedor Kyocera. */
SELECT m.nombre
FROM material m
WHERE m.precio IN (
	select max(m.precio) 
    FROM material m 
    JOIN proveedor p ON p.idProveedor=m.idProveedor
    WHERE p.nombre="Kyocera"
);

/* Apartado 4 :Lista el nombre del material más barato del proveedor BENQ. */
SELECT m.nombre,m.precio
FROM material m
WHERE m.precio IN (
	select MIN(m.precio)
    FROM material m 
    JOIN proveedor p ON p.idProveedor=m.idProveedor
    WHERE p.nombre="BENQ"
);

/* Apartado 5: Devuelve todos los materiales de la base de datos que tienen un precio mayor o igual al material más caro del proveedor Logitech. */
SELECT m.*
FROM material m
WHERE m.precio >= (
	Select max(m.precio)
    FROM material m 
    JOIN proveedor p ON p.idProveedor=m.idProveedor
    WHERE p.nombre="Logitech"
);

/* Apartado 6: Lista todos los productos del proveedor Panda que tienen un precio superior al precio medio de todos sus materiales.. */
SELECT m.*
FROM material m
WHERE m.idProveedor=6 AND m.precio >= (
	Select avg(m.precio)
    FROM material m
	JOIN proveedor p ON p.idProveedor=m.idProveedor
    WHere p.idProveedor=6
);


SELECT * FROM proveedor;