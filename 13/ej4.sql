USE ceutacar;
SELECT * from cliente;
-- Modifica el número de bastidor del vehículo 1029384756QSCEFVT a 1029384756QSCEUTA. ¿Has podido?
UPDATE vehiculo
SET numBastidor="1029384756QSCEUTA"
WHERE numBastidor="1029384756QSCEFVT";

-- Modifica el DNI del cliente 12345678A a 12345678Z. ¿Has podido? Justifica por qué sí o por qué no.
UPDATE cliente
SET dni="12345678Z"
WHERE dni="12345678A";