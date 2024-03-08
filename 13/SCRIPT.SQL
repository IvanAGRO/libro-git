DROP DATABASE IF EXISTS ceutacar;

CREATE DATABASE IF NOT EXISTS ceutacar CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci';

USE ceutacar;

CREATE TABLE IF NOT EXISTS cliente (
	dni CHAR(9),
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	telefono1 CHAR(9) NOT NULL,
	telefono2 CHAR(9),
	fechaNacimiento DATE NOT NULL,
	edad TINYINT UNSIGNED NOT NULL,
	PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS vehiculo (
	numBastidor CHAR(17),
	marca VARCHAR(50) NOT NULL,
	modelo VARCHAR(50) NOT NULL,
	color CHAR(6) COMMENT 'En Hexadecimal, sin #',
	gama CHAR(9) NOT NULL,
	PRIMARY KEY (numBastidor)
);

CREATE TABLE IF NOT EXISTS alquila (
	dni CHAR(9),
	numBastidor CHAR(17),
	fechaHora DATETIME,
	PRIMARY KEY (dni,numBastidor,fechaHora),
	FOREIGN KEY (dni) REFERENCES cliente(dni),
	FOREIGN KEY (numBastidor) REFERENCES vehiculo(numBastidor)
);

CREATE TABLE IF NOT EXISTS desperfecto (
	numBastidor CHAR(17),
	fechaHora DATETIME,
	lugar VARCHAR(50) NOT NULL,
	pintura ENUM('S','N') NOT NULL,
	gravedad TINYINT UNSIGNED,
	PRIMARY KEY (numBastidor,fechaHora),
	FOREIGN KEY (numBastidor) REFERENCES vehiculo(numBastidor)
);

-- Iván

INSERT INTO  vehiculo(numBastidor,marca,modelo,color,gama)
VALUES
	('1HGBH41JXMN109186','Seat','Leon','Negro','media'),
	('2D8GN44P386659533','Dacia','Sandero','Azul','media'),
	('5GTMNHDEXA1515356','Renault','Clio','Blanco','media'),
	('1B7KA286X34541287','Peugeot','3008','Marron','media'),
	('2CNBE1869Y4356465','Nissan','Qashqai','Blanco','media');

INSERT INTO cliente(dni,nombre,apellido1,apellido2,telefono1,telefono2,fechaNacimiento,edad)
VALUES
	('27182380Z','Adam','Salcedo','Puente','772722183',NULL,'1986-5-30',28),
	('98898374F','Neus','Luque','Carrillo','772722182',NULL,'1986-5-30',28),
	('33414448W','Jon','Salcedo','Peña','772722181',NULL,'1986-5-30',28),
	('42260573M','Page','Stors',NULL,'772722187',NULL,'1986-5-30',28),
	('41802636K','Celia','Brok',NUll,'320594808',NULL,'1986-5-30',28);

INSERT INTO cliente(dni,nombre,apellido1,apellido2,telefono1,telefono2,fechaNacimiento,edad)
VALUES
	('27182380D','Alex','Janssen','Puente','320594801',NULL,'1986-5-30',28),
	('98898374R','Audie','Stockney',NULL,'320594802',NULL,'1986-5-30',28),
	('33414448D','Nessi','Klemt','Blanco','320594803',NULL,'1986-5-30',28),
	('42260573R','Natassia','Lawrey',NULL,'320594804',NULL,'1986-5-30',28),
	('41802636R','Worthy','Snasel',NULL,'320594805',NULL,'1986-5-30',28);

-- Mohamed Ahmed

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama) VALUES
('1GKS2JKC9FR617495', 'Toyota', 'Corolla', 'FF4500', 'Compacto'),
('2HNYD2H67EH547825', 'Ford', 'Focus', '0000FF', 'Sport'),
('3GNFK1236LG243621', 'Honda', 'Civic', '32CD32', 'Sport'),
('4JGDF6EE9FA492655', 'Nissan', 'Sentra', 'FFD700', 'Compacto'),
('5J8TB4H51FL022283', 'Chevrolet', 'Malibu', 'FF0000', 'Clasico');

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad) VALUES
('45345678W', 'Juan', 'Pérez', 'González', '653456789', '987654321', '1999-05-15', 24),
('44765432D', 'María', 'García', 'López', '676789123', '959456123', '1995-08-23', 28),
('45678912N', 'Pedro', 'Sánchez', 'Martínez', '681654987', '961654987', '1988-12-10', 33),
('45912345T', 'Laura', 'Fernández', 'Rodríguez', '654123789', NULL, '1993-03-08', 30),
('44432198A', 'Sara', 'López', 'García', '727321654', NULL, '1998-11-05', 25);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad) VALUES
('45165498B', 'Carlos', 'Jiménez', 'Pérez', '671987654', NULL, '1992-07-12', 31),
('44945612F', 'Luis', 'Martínez', 'Gómez', '779123456', '856789123', '1997-02-28', 26),
('44836914L', 'Ana', 'Sánchez', 'Fernández', '687258369', NULL, '1996-09-17', 27),
('45325874K', 'Elena', 'Rodríguez', 'López', '689147258', NULL, '1994-04-25', 29),
('45725836M', 'Pablo', 'Gómez', 'Sánchez', '678369147', '963258741', '1991-11-30', 32);

-- Safa

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES
('I111111111111111', 'Mercedes', 'Clase E', 'negro','E'),
('I222222222222222', 'Mercedes', 'Clase C', 'rojo','C'),
('I333333333333333', 'Mercedes', 'Clase D', 'azul', 'D'),
('I444444444444444', 'Mercedes', 'Clase F', 'blanco','F'),
('I555555555555555', 'Mercedes', 'Clase R', ' negro', 'R');

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('111111111', 'Juan', 'Pérez', 'López', '111111111', '111111112', '2000-01-01', 25),
('222222222', 'María', 'González', 'Martínez', '222222222', '222222223', '1995-02-02', 30),
('333333333', 'Carlos', 'Rodríguez', 'Sánchez', '333333333', '333333334', '1990-03-03', 35),
('444444444', 'Ana', 'Fernández', 'Gómez', '444444444', '444444445', '1985-04-04', 40),
('555555555', 'Pedro', 'López', 'Ramírez', '555555555', '555555556', '1980-05-05', 45);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('666666666', 'Laura', 'Martínez', 'Sánchez', '666666666', '666666667', '1975-06-06', 50),
('777777777', 'Alejandro', 'Gómez', 'Fernández', '777777777', '777777778', '1970-07-07', 55),
('888888888', 'Isabel', 'Sánchez', 'Rodríguez', '888888888', '888888889', '1965-08-08', 60),
('999999999', 'Miguel', 'Ramírez', 'Pérez', '999999999', '999999991', '1960-09-09', 65),
('101010101', 'Carmen', 'López', 'González', '101010101', '101010102', '1955-10-10', 70);

-- David Cardoso

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES ('123456789abcdefgh', 'BMW', 'M4', '212F3D', 'Suburvan'),
('fgh123456789abcde', 'Honda', 'Civic', 'C0392B ', 'Deportivo'),
('cdefgh123456789ab', 'Volkswagen', 'Golf', '1B2631', 'Compacto'),
('12345abcdefg6789h', 'Fiat', '500X', '2980B9 ', 'Suburvan'),
('abcdefgh123456789', 'Suzuki', 'Gran Vitara', '145A32', 'Montero');

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES ('1345678Q', 'Emilio', 'Robles', NULL, '123456789', NULL, '1980-05-12', 43),
('1345678F', 'Mariano', 'Dominguez', NULL, '987654321', NULL, '1985-01-23', 38),
('1345678G', 'Lucia', 'Alvarez', NULL, '123654789', NULL, '1990-02-15', 33),
('1345678S', 'Alicia', 'Rubio', NULL, '123456123', NULL, '1992-07-13', 31),
('1345678A', 'Raúl', 'Navas', NULL, '123456455', NULL, '1995-08-28', 28);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES ('1345678J', 'David', 'González', NULL, '456789998', NULL, '2000-03-05', 23),
('1345678K', 'Rosa', 'Ruiz', NULL, '156789774', NULL, '2003-12-29', 19),
('1345678N', 'Mohamed', 'Said', NULL, '126789662', NULL, '2001-10-31', 21),
('1345678V', 'Hallar', 'Abdelkader', NULL, '123789112', NULL, '2002-11-26', 20),
('1345678B', 'Nora', 'Mohamed', NULL, '135689364', NULL, '1999-04-18', 24);

-- Pablo

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES ('P123456789FGJKLMP', 'Toyota', 'Montero', '000000', 'Baja_Gama'),
('P123456788ASDFGHJ', 'Dacia', 'Sandero', '000000', 'Baja_Gama'),
('P123456787QWERTYU', 'Dacia', 'Coaster', '000000', 'Alta_Gama'),
('P123456786ZXCVBNM', 'Toyota', 'Mini', '000000', 'Baja_Gama'),
('P123456785POIUYTR', 'Dacia', 'Arena', '000000', 'Alta_Gama');

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES ('10610610A', 'Marco', 'Polo', 'Indo', '756203020', NULL, '1960/10/20', 63),
('10610610B', 'Perez', 'Oso', NULL, '756124578', '756124579', '2000/1/1', 23),
('10610610C', 'Mar', 'Tillo', NULL, '756235689', NULL, '1990/5/26', 33),
('10610610D', 'Oscar', 'Anchoa', 'Algarez', '756232356', '756565623', '1980/12/30', 43),
('10610610E', 'Manolo', 'Escoba', NULL, '756898945', NULL, '1950/6/21', 73);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES ('10610610F', 'Angel', 'Halo', 'Pluma', '956202020', '956202021', '1989/11/4', 34),
('10610610G', 'Polo', 'Fuentes', NULL, '956121212', NULL, '2000/3/10', 23),
('10610610H', 'Lara', 'Arena', NULL, '956808080', '956808081', '1920/10/31', 103),
('10610610I', 'Paul', 'Romero', 'Boniato', '956787878', NULL, '1975/2/9', 48),
('10610610J', 'Filemon', 'Bocata', NULL, '956101010', NULL, '1995/8/7', 28);

-- Abderrahman

INSERT INTO vehiculo (numBastidor,marca,modelo,color,gama) VALUES
("3GNAABDB9A4529347","Dacia","Sandero","40404","Amarillo"),
("WAUXL68EX52893599","Ford","Escort","000000","Verde"),
("1J4FJ27SXW2812648","Renault","12","08088A","Verde"),
("3GNEC12Z267433314","Skoda","Fabia","0B610B","Rojo"),
("2FTEF2763X6327985","Volkswagen","Bora","5858FA","Rojo");

INSERT INTO cliente (dni,nombre,apellido1,apellido2,telefono1,telefono2,fechaNacimiento,edad) VALUES
("57646240Y","MARIA","CASADO","POLO","715262949",NULL,"1993-1-23",29),
("08621513D","JUAN PABLO","OCHOA",NULL,"715252949",NULL,"1963-1-23",60),
("02520480W","JOAN","IGLESIAS","POLO","714252949",NULL,"1975-1-23",47),
("45797527L","DARIO","LORENTE",NULL,"713252949",NULL,"1982-1-23",40),
("17086932W","CARLOS","RECIO",NULL,"712252949",NULL,"1992-1-23",31);

INSERT INTO cliente (dni,nombre,apellido1,apellido2,telefono1,telefono2,fechaNacimiento,edad) VALUES
("02850054D","ALBERTO","CASADO","POLO","715252949",NULL,"1993-1-23",30),
("40281104P","MARIA","HIDALGO",NULL,"815252949",NULL,"1993-1-23",30),
("05493587Z","MONICA","LAVOE",NULL,"915252949",NULL,"1993-1-23",30),
("25476599M","JOSE","COLON","SUAREZ","615252949",NULL,"1993-1-23",30),
("16612026T","SERGIO","CASADO",NULL,"715652949",NULL,"1993-1-23",30);

-- Alejandro

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES
("1948574b3921l098a", "Honda", "GTR", "D44009", "Deport"),
("1A2B3C4D5E6F7G8H9", "Tesla", "Model S", "FFFFFF", "Electr"),
("2X3Y4Z5W6V7U8T98S", "Ford", "Mustang", "FF5733", "Deport"),
("3K8A1B7H4D2G5F9CE", "Toyota", "Camry", "000000", "Famili"),
("9M5N1O3P7Q2R6S8T4", "Chevrolet", "Silverado", "3333CC", "Pesado");

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
("45093857P", "Juan", "Pérez", "González", "987654321", NULL, "1990-05-15", 33),
("45869702U", "María", "López", "Martínez", "654321987", "123456788", "1985-11-20", 38),
("45009856Y", "Carlos", "García", NULL, "876543219", NULL, "2000-02-10", 23),
("45687934V", "Laura", "Fernández", "Ramírez", "765432198", "234567890", "1975-08-05", 48),
("45922182K", "Roberto", "Sánchez", "Hernández", "654321987", "123456789", "1998-04-30", 25);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
("45678901F", "Ana", "Rodríguez", "Fernández", "654987371", "123456789", "1992-09-12", 31),
("45998340G", "Pedro", "Gómez", "Sánchez", "789654351", NULL, "1980-04-25", 43),
("45320021N", "Elena", "Martínez", "López", "987321614", "234567890", "1995-03-18", 28),
("45110938D", "Miguel", "Hernández", "Pérez", "876543269", NULL, "1987-12-03", 35),
("45564891C", "Isabel", "Santos", "García", "765432188", "345678991", "2002-07-29", 21);

-- Rosa

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES 
('01647712S', 'Rosa', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28),
('11647712S', 'Maria', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28),
('21647712S', 'Rosa Maria', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28),
('31647712S', 'Isabel', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28),
('41647712S', 'Isabel Maria', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28),
('51647712S', 'Zelinda', 'Gonzalez', 'Ruiz', '654222139', NULL, '1995-04-13', 28);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES 
('61647712S', 'Marisa', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28),
('71647712S', 'Angela', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28),
('81647712S', 'Claudia', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28),
('91647712S', 'Julia', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28),
('01647712V', 'Andrea', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28),
('11647712V', 'Sara', 'Gonzalez', NULL, '654222139', NULL, '1995-04-13', 28);

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES 
('123456789', 'BMW', 'x2', '17202A', 'sub'),
('123456788', 'Honda', 'Accord', '17202A', 'berlina'),
('123456787', 'Fiat 500', 'Sport', 'AF7AC5', 'sub'),
('123456786', 'Fiat 500', 'X', 'AF7AC5', 'sub'),
('123456785', 'Honda', 'Civic', '17202A', 'deportivo');

-- Salvador

INSERT vehiculo (numBastidor, marca, modelo, color, gama)
VALUES ("12345678123456S", "BMW", "X2", "FF00FF", "Alta"),
("12345678123456A", "Citroen", "Grand vitara", "0000FF", "Alta"),
("12345678123456B", "Opel", "Corsa", "FFFFFF", "Baja"),
("12345678123456C", "Hyundai", "Super", "FFACFF", "Alta"),
("12345678123456D", "Supra", "Hyper", "CC25FF", "Alta");

INSERT cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES ("12345678A", "Salva", "Gonza", "Ruiz", "98768877", "688473727", "2020-12-12", 24),
("12345678E", "David", "Cardo", "Gasp", "23421424", "85758374", "1999-05-15", 3),
("12345678B", "Shiliodas", "Seiryou", null, "836747863", null, "2003-02-12", 21),
("12345678C", "Sara", "Bertran", "Pascual", "747834867", null, "1996-01-20", 27),
("12345678D", "Ruixiang", "Shao", "Peng", "84668473", "235235233", "1999-12-12", 23);

-- Rukaia

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES
("15385763563748345", "Subaru", "Impreza", "874521", "Alta"),
("15385763563748346", "Ford", "Fiesta", "985632", "Alta"),
("15385763563748347", "BMW", "342", "025455", "Alta"),
("15385763563748348", "Mercedez", "785412", "Negro", "Alta"),
("15385763563748350", "Seat", "Ibiza", "965232", "Alta");

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
("45187455O", "Nayeon", "Im", "Yoo", "956214554", "602541527", "1995-10-01", 20),
("45187451K", "Jeongyeon", "Im", "Yoo", "956856554", "602541525", "1995-12-04", 20),
("45187459D", "Sana", "Im", "Yoo", "956856256", "602549855", "1995-10-01", 20),
("45187457A", "Mina", "Im", "Yoo", "956856554", "602541525", "1995-11-21", 20),
("45187457C", "Jihyo", "Im", "Yoo", "956858541", "602540254", "1995-01-01", 20);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
("45187000U", "Momo", "Hirai", "Yoo", "956214554", "602541527", "2000-12-10", 24),
("45187111P", "Dahyun", "Park", "Yoo", "956856554", "602541525", "2000-01-21", 25),
("45187365L", "Chaeyoung", "Son", "Yoo", "956856256", "602549855", "2000-05-25", 21),
("45187800N", "Tzuyu", "Im", "Chou", "956856554", "602541525", "2000-08-22", 23),
("45187666A", "Isis", "Im", "Garcia", "956858541", "602540254", "2000-03-17", 21);

-- Ibrahim

INSERT INTO vehiculo (numBastidor, marca ,modelo, color, gama)
VALUES
('WZ6523136765PO792', 'BMW', 'X6', 'negro', 'alta' ),
('GH6523LN676529924', 'Toyota', 'Corola', 'blanco', 'baja' ),
('ML652313676522324', 'Audi', 'Q7', 'azul', 'alta' ),
('BB652313HJ6578924', 'Renault', 'Kadjar', 'rojo', 'alta' ),
('CG6255313AA652992', 'Seat', 'Panda', 'azul', 'baja' );

INSERT INTO cliente (dni ,nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('45678423K', 'Manuel', 'García', 'Perez', '648965786', '956784460', '1998-09-03', 25),
('67892344L', 'Jorge', 'Oliva', 'Bellido', '669532678', NULL, '2001-02-25', 22),
('92340583O', 'Yusef', 'Lahassen', NULL, '651056321', '658132995', '2003-11-18', 19),
('89237077R', 'Ahmed', 'Hossain', 'Ahmed', '675992423', NULL, '1975-05-22', 48),
('64895579T', 'Pedro', 'García', NULL, '648234768', NULL, '1992-04-30', 31);

INSERT INTO cliente (dni ,nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('85672453K', 'Álvaro', 'Barranco', 'Ramos', '646345012', NULL, '1996-09-13', 27),
('37856124R', 'Mohamed', 'Mohamed', 'Ahmed', '678947833', NULL, '2004-02-25', 19),
('22339083D', 'Julia', 'Lopez', NULL, '613287329', '658995123', '2000-11-18', 22),
('98236537A', 'Hamza', 'Abselam', 'Dris', '675423669', NULL, '1980-07-01', 43),
('14897779B', 'Marta', 'García', NULL, '655776459', NULL, '1999-08-31', 24);

-- Hamza

INSERT INTO vehiculo (numBastidor,marca,modelo,color,gama)
VALUES 
('1MEHM402952336417','seat','leon','negro','baja'),
('YV1SZ58D120847223', 'lamborghini','urus','azul','alta'),
('YV1SZ58D120849102', 'renault','clio','blanca','media'),
('1GAWGPFA6B2891684', 'citroen','berlingo','rojo','media'),
('1MEHM402952284960','audi','rs3','negro','alta');

INSERT INTO cliente (dni,nombre,apellido1,telefono1,fechaNacimiento,edad)
VALUES
('27384905I','Ramon','Garcia','631926509','2005-11-12',17),
('27362905P','Daniel','Garcia','631921409','2001-10-14',22),
('67384905O','Reda','Laarbi','631974509','2000-06-12',23),
('27384905U','Nico','Williams','631296509','1976-12-30',47),
('89184905I','Cristiano','Ronaldo','686926509','1985-02-05',38);

INSERT INTO cliente (dni,nombre,apellido1,telefono1,fechaNacimiento,edad)
VALUES
('27384905E','Sergio','Garcia','631926510','2004-11-12',17),
('27362905J','Manuel','Garcia','631921411','2000-10-14',22),
('67384905L','Vinicius','Laarbi','631974512','2001-06-12',23),
('27384905H','Isa','Williams','631296513','1975-12-30',47),
('89184905M','Nazario','Ronaldo','686926514','1989-02-05',38);

-- David Peral

INSERT INTO vehiculo (numBastidor,marca, modelo, color, gama)
VALUES 
('LO1OP12876N267316', 'Fiat', 'Panda', 'FFFFFF', 'Baja'),
('ER0OT09512K772891', 'Hyundai', 'i30', NULL, 'Media'),
('MN1OE71940P819052', 'Kia', 'Picanto', NULL, 'Baja'),
('SS77F15876F819302', 'Ford', 'Focus', '344D83', 'Media'),
('KJ1OP09876N222316', 'Audi', 'A8', NULL, 'Alta');

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('54284985K', 'Juan', 'Gómez', NULL, 650245868, NULL, '2000-08-28', 23),
('78046238P', 'Laura', 'Sánchez', 'Mora', 655846015, NULL, '2002-10-08', 21),
('87410256A', 'María', 'Lorca', 'Fuentes', 670148632, 956201508, '1997-02-15', 26),
('34123458N', 'Antonio', 'Hernández', NULL, 856245801, NULL, '1973-01-30', 50),
('52849653G', 'Paco', 'Lara', 'Torres', 656201485, 956302584, '2004-09-01', 19);

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad)
VALUES
('82134536P', 'Francisco', 'Cuenca', 'Santos', 650245987, NULL, '2005-02-19', 18),
('10025888H', 'Aitor', 'Trascastro', 'Ramos', 687111555, 856321478, '2003-11-11', 19),
('12343212T', 'Manolo', 'Vílchez', 'Segura', 605486321, 956208741, '1998-05-19', 25),
('98756123U', 'Irene', 'Borrás', NULL, 636045789, NULL, '1969-09-04', 54),
('34562789N', 'Aaron', 'Fernández', NULL, 650145632, NULL, '1999-04-18', 24);

-- Mohamed Mustafa

INSERT INTO vehiculo (numBastidor,marca,modelo,color,gama) VALUE
("16594523258745896",'Toyota','Prius','FF5632','Alta'),
("56248955632147854",'Renault','Clio',NULL,'Media'),
("32465785422114149",'Audi','RS6','FF2354','Alta'),
("32462495549546596",'Ford','Focus','NULL','Media'),
("29665549656655422",'Toyota','Auris','FF0235','Alta')
;

INSERT INTO cliente (dni,nombre,apellido1,apellido2,telefono1,telefono2,fechanacimiento,edad) VALUES
('45454545A', 'Mohamed','Mustafa', 'Ben Hattal',"644025841",NULL,'2002-04-28',21),
('45454546B', 'Juan','García', 'López',"625984311",NULL,'2004-08-20',19),
('45454547C', 'Mariam','Mohamed', NULL,"608958324",NULL,'2000-10-26',23),
('45454548D', 'María','Castillo', 'Rodriguez',"635941120",NULL,'1980-01-03',43),
('45454549E', 'Will','Smith',NULL,"697860330",NULL,'2006-03-26',17)
;

INSERT INTO cliente (dni,nombre,apellido1,apellido2,telefono1,telefono2,fechanacimiento,edad) VALUES
('12344678A', 'María', 'González', 'López', '611223344', '912345678', '1990-05-15', 33),
('87654321B', 'Juan', 'Martínez', 'Sánchez', '677788899', NULL, '1985-08-20', 38),
('11223344C', 'Luis', 'Rodríguez', 'Fernández', '611223344', '655566677', '1998-02-10', 25),
('44556677D', 'Ana', 'López', 'Gómez', '634567890', '987654321', '1980-11-05', 43),
('33221100E', 'Carlos', 'Fernández', 'Pérez', '655544477',NULL, '1995-04-30', 28)
;

-- Armando

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama) VALUES
("12345678909876543","Audi","N8","0B6121","media"),
("12345678909423543","BMW","C14","1C6121","media"),
("12345674329876543","Audi","U8","4C6121","alta"),
("12345743909876543","BMW","S8","8J6121","alta"),
("53145678909876543","SEAT","18","1V6121","baja");

INSERT INTO cliente (dni, nombre, apellido1, apellido2, telefono1, telefono2, fechaNacimiento, edad) VALUES
("74822849O","Juan","García","Fernandez","649321248","648957783","2001-12-1",22),
("74898849M","María","Román","Fernandez","649987948","648957783","2002-11-12",21),
("73422849J","Alba","Perez","Román","649382111","648957783","2003-10-16",20),
("74987849A","Manuel","Santana","Fernandez","611182948","648957783","2010-09-11",13),
("74822669L","Laura","García","Santana","649111948","648957783","2003-08-10",20);

INSERT INTO cliente (dni, nombre, apellido1, telefono1, fechaNacimiento, edad) VALUES
("33822849P","Paco","García","649321248","2001-12-1",22),
("36898849M","Sara","Román","649987948","2002-11-12",21),
("33422849J","Armando","Perez","649382111","2003-10-16",20),
("23987849A","Mire","Santana","611182948","2010-09-11",13),
("12822669L","Gonzalo","García","649111948","2003-08-10",20);

-- Saad

INSERT INTO vehiculo (numBastidor, marca, modelo, color, gama)
VALUES
("PV2ZZZ70ZWH130408", "Mercedes", 2024, "Negro", "Alta"),
("KL6CZV80ZUH160504", "Mercedes", 2022, "Rojo", "Alta"),
("ML9KZH60ZLH180202", "Mercedes", 2023, "Negro", "media"),
("OP4LZK10ZVH170236", "Mercedes", 2020, "Negro", "Alta"),
("BN3EZL30ZAH110605", "Mercedes", 2021, "Negro", "baja");

-- José Daniel

INSERT INTO vehiculo (numBastidor, Marca, Modelo, Color, Gama)
VALUES
("1234567890ABCDEFG", "Audi", "R8","Rojo","Alta"),
("1098765432PLKIJUH", "BMW", "M4","Negro","Alta"),
("1357924681MNBVCXZ", "Toyota", "RAV4","Blanco","Media"),
("1975467381MKJHGFD", "Seat", "Panda","Azul","Media"),
("1029384756QSCEFVT", "Mercedes", "AMG63","Negro","Alta");

INSERT INTO cliente (DNI, nombre, apellido1, apellido2, telefono1, telefono2,fechaNacimiento,edad)
VALUES
("46155214X", "David", "Garcia", NULL, "689064176", "689065431", "2023-01-01", 17),
("46155214C", "Armando", "Torrero", NULL, "689064178", "605564515", "2023-02-02", 18),
("46155214V", "Julian", "Perez", NULL, "245789654", "678985576", "2023-03-03", 19),
("46155214B", "Lucas", "Ramirez", NULL, "564768894", "165786980", "2023-04-04", 16),
("46155214N", "Aaron", "Rodriguez", NULL, "145678921", "980743162", "2023-05-05", 20);

INSERT INTO cliente (DNI, nombre, apellido1, apellido2, telefono1, telefono2,fechaNacimiento,edad)
VALUES
("46155214M", "Juan", "Gutierrez", NULL, "768546246", "987165875", "2023-06-06", 21),
("46155214A", "Martin", "Rodriguez", NULL, "689064998", "986064276", "2023-07-07", 15),
("46155214S", "Javi", "Ramirez", NULL, "156900456", "689074567", "2023-08-08", 22),
("46155214D", "Pablo", "Fernandez", NULL, "689065179", "789081654", "2023-09-09", 19),
("46155214F", "Alejandro", "Escalante", NULL, "785647721", "679052376", "2023-10-10", 14);

INSERT INTO alquila 
SELECT dni,numbastidor,now() FROM cliente,vehiculo where edad between 25 and 60;