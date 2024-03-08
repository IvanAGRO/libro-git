USE ceutacar;

ALTER TABLE cliente ADD COLUMN emailCliente VARCHAR(50) NOT NULL;

ALTER TABLE cliente DROP COLUMN edad;

ALTER TABLE cliente RENAME COLUMN telefono2 TO telefonoSecundario;