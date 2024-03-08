use ceutacar;
UPDATE cliente
SET nombre="Roberta"
WHERE dni="01647712S"
;

INSERT INTO cliente (dni,nombre,apellido1,apellido2,telefono1,telefono2,fechaNacimiento,edad) VALUES ("02850054f","Pepe","Ruiz",null,654222239,null,"1995-04-13",28);

UPDATE cliente
SET nombre="Pepito",apellido1="Ruinoso"
WHERE dni="02850054f";


select * from cliente;