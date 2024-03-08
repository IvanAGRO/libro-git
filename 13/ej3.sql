use tallerReparaciones;
select * from material;
-- 1. Edita el nombre del material cuyo id es el 1 a Portable Hard Disk 2TB.
UPDATE material 
SET nombre="Portable Hard Disk 2TB"
WHERE idMaterial=1;

-- 2. Actualiza el nombre del material cuyo id es el 2 a CPU Intel i5.
UPDATE material
SET nombre="CPU Intel i5"
WHERE idMaterial=2;

-- 3. Modifica el precio del material cuyo id es el 8 a 300 euros.
UPDATE material
SET precio=300
WHERE idMaterial=8;

-- 4.Suma 20 euros a los materiales cuyo idProveedor es el 3. Emplea precio=precio+20.
UPDATE material 
SET precio=precio+20
WHERE idProveedor=3;

-- 5.Cambia el nombre del proveedor cuyo id es el 3 a LaCie y el del id 4 a Intel Corporation.
UPDATE proveedor
SET nombre="LaCie"
WHERE idProveedor=3;

UPDATE proveedor
SET nombre="Intel Corporation"
WHERE idProveedor=4;




-- 6.Modifica el id del proveedor Linksys y dale el valor 21. ¿Se puede modificar? En caso de que no fuera posible, ¿cómo se podría modificar?
UPDATE proveedor
SET idProveedor=21
WHERE idProveedor=8;


-- 7.Modifica el id del proveedor Logitech y dale el valor 21. ¿Se puede modificar? En caso de que no fuera posible, ¿cómo se podría modificar?
UPDATE proveedor
SET idProveedor=21
WHERE idProveedor=2;

-- 8.Modifica el precio de todos los artículo sumándole 12 € al precio actual
UPDATE material  SET precio=precio+12;
