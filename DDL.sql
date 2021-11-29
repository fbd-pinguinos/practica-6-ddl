DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE persona(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) CHECK(apellidoPaterno<> ''),
	apellidoMaterno VARCHAR(50) CHECK(apellidoMaterno <> ''),
	calle VARCHAR(20) CHECK (calle <> ''),
	municipio VARCHAR(20) CHECK(municipio <> ''),
	numero INT NOT NULL,
	cp INT CHECK(cp between 10000 and 99999),
	estado VARCHAR(20) CHECK(estado <> ''),
	nacimiento DATE NOT NULL CHECK(nacimiento >= '1910-01-01'),
	genero CHAR(1) CHECK(genero <> ''),
	correo VARCHAR(50) CHECK(correo <> ''),
	puntos INT NOT NULL,
	contraseña VARCHAR(30) CHECK (contraseña <> ''),
	enviosRealizados INT NOT NULL CHECK(enviosRealizados >= 0),
	calificacion INT NOT NULL,
	salario INT NOT NULL,
	horaInicio TIME NOT NULL,
	horaFin TIME NOT NULL,
	esRepartidor BOOLEAN NOT NULL,
	esCliente BOOLEAN NOT NULL,
	curpSupervisor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpSupervisor) = 18)
);

CREATE TABLE categoria(
	nombre VARCHAR(50) CHECK(nombre <> ''),
	descripcion VARCHAR(1000) CHECK(descripcion <> ''),
	numeroProductos INT NOT NULL CHECK(numeroProductos >=0)
);
/*
Llaves Primarias
*/
ALTER TABLE persona ADD CONSTRAINT persona_pkey PRIMARY KEY(curp);
ALTER TABLE categoria ADD CONSTRAINT categoria_pkey PRIMARY KEY(nombre);
