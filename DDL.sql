DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE persona(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) CHECK(apellidoPaterno<> ''),
	apellidoMaterno VARCHAR(50) CHECK(apellidoMaterno <> ''),
	calle VARCHAR(30) CHECK (calle <> ''),
	municipio VARCHAR(30) CHECK(municipio <> ''),
	numero INT NOT NULL,
	cp INT CHECK(cp between 10000 and 99999),
	estado VARCHAR(20) CHECK(estado <> ''),
	nacimiento DATE NOT NULL CHECK(nacimiento >= '1910-01-01'),
	genero CHAR(1) CHECK(genero <> ''),
	correo VARCHAR(50) CHECK(correo <> ''),
	puntos INT NOT NULL CHECK(puntos >= 0),
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
	nombre VARCHAR(50) CHECK(nombre <> '') UNIQUE,
	descripcion VARCHAR(500) CHECK(descripcion <> ''),
	numeroProductos INT NOT NULL CHECK(numeroProductos >=0)
);

CREATE TABLE proveedor(
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12) UNIQUE,
	razonSocial VARCHAR(50) CHECK(razonSocial <> ''),
	estado VARCHAR(20) CHECK(estado <> ''),
	cp INT CHECK(cp between 10000 and 99999),
	municipio VARCHAR(30) CHECK(municipio <> ''),
	numero INT NOT NULL,
	calle VARCHAR(30) CHECK (calle <> '')
);

CREATE TABLE telefonoProveedor(
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	telefono bigint NOT NULL UNIQUE
);

CREATE TABLE pedido(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido bigint NOT NULL UNIQUE,
	hora TIME NOT NULL
);

CREATE TABLE tarjetaCredito(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago bigint NOT NULL UNIQUE,
	titular VARCHAR(60) CHECK(titular <> ''),
	vencimiento DATE NOT NULL CHECK(vencimiento >= '1910-01-01'),
	numeroTarjeta INT NOT NULL,
	cvv INT NOT NULL CHECK(cvv between 000 and 999)
);

CREATE TABLE tarjetaDebito(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago bigint NOT NULL UNIQUE,
	titular VARCHAR(60) CHECK(titular <> ''),
	vencimiento DATE NOT NULL CHECK(vencimiento >= '1910-01-01'),
	numeroTarjeta INT NOT NULL,
	cvv INT NOT NULL CHECK(cvv between 000 and 999)
);

CREATE TABLE contraentrega(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago bigint NOT NULL UNIQUE
);

CREATE TABLE envioNormal(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido bigint NOT NULL, 
	numeroEnvio bigint NOT NULL UNIQUE,
	estatus VARCHAR(15) CHECK(estatus <> ''),
	tiempoEnvio VARCHAR(10) CHECK(tiempoEnvio <> '')
);

CREATE TABLE envioExpress(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido bigint NOT NULL, 
	numeroEnvio bigint NOT NULL UNIQUE,
	estatus VARCHAR(15) CHECK(estatus <> ''),
	tiempoEnvioUsuario VARCHAR(10) CHECK(tiempoEnvioUsuario <> '')
);
CREATE TABLE producto(
	idProducto SERIAL NOT NULL UNIQUE,
	nombre VARCHAR(50) CHECK(nombre <> ''),
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	nombreArchivo VARCHAR(30) CHECK(nombreArchivo <> ''),
	descripcion VARCHAR(500) CHECK(descripcion <> ''),
	unidades bigint NOT NULL,
	precio INT NOT NULL CHECK(precio >= 0),
	nombreProducto VARCHAR(30) CHECK(nombreProducto <> ''),
	descuento INT CHECK(descuento >= 0)
);

CREATE TABLE comprar(
	idProducto SERIAL NOT NULL,
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18)
);
/*
Llaves Primarias
*/
ALTER TABLE persona ADD CONSTRAINT persona_pkey PRIMARY KEY(curp);
ALTER TABLE categoria ADD CONSTRAINT categoria_pkey PRIMARY KEY(nombre);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey PRIMARY KEY(rfc); 

/*
Llaves Compuestas
*/
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_pkey PRIMARY KEY(rfc, telefono);
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_fkey FOREIGN KEY(rfc) REFERENCES proveedor(rfc);

ALTER TABLE pedido ADD CONSTRAINT pedido_pkey PRIMARY KEY(curp, numeroPedido);
ALTER TABLE pedido ADD CONSTRAINT pedido_fkey FOREIGN KEY(curp) REFERENCES persona(curp);

ALTER TABLE tarjetaCredito ADD CONSTRAINT tarjetaCredito_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE tarjetaCredito ADD CONSTRAINT tarjetaCredito_fkey FOREIGN KEY(curp) REFERENCES persona(curp);

ALTER TABLE tarjetaDebito ADD CONSTRAINT tarjetaDebito_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE tarjetaDebito ADD CONSTRAINT tarjetaDebito_fkey FOREIGN KEY(curp) REFERENCES persona(curp);

ALTER TABLE contraentrega ADD CONSTRAINT contraentrega_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE contraentrega ADD CONSTRAINT contraentrega_fkey FOREIGN KEY(curp) REFERENCES persona(curp);

ALTER TABLE envioNormal ADD CONSTRAINT envioNormal_pkey PRIMARY KEY(curp, numeroPedido, numeroEnvio);
ALTER TABLE envioNormal ADD CONSTRAINT envioNormal_fkey FOREIGN KEY(curp) REFERENCES persona(curp);
ALTER TABLE envioNormal ADD CONSTRAINT envioNormal2_fkey FOREIGN KEY(numeroPedido) REFERENCES pedido(numeroPedido);

ALTER TABLE envioExpress ADD CONSTRAINT envioExpress_pkey PRIMARY KEY(curp, numeroPedido, numeroEnvio);
ALTER TABLE envioExpress ADD CONSTRAINT envioExpress_fkey FOREIGN KEY(curp) REFERENCES persona(curp);
ALTER TABLE envioExpress ADD CONSTRAINT envioExpress2_fkey FOREIGN KEY(numeroPedido) REFERENCES pedido(numeroPedido);

ALTER TABLE producto ADD CONSTRAINT producto_pkey PRIMARY KEY(idProducto, nombre, rfc);
ALTER TABLE producto ADD CONSTRAINT producto_fkey FOREIGN KEY(rfc) REFERENCES proveedor(rfc);
ALTER TABLE producto ADD CONSTRAINT producto2_fkey FOREIGN KEY(nombre) REFERENCES categoria(nombre);

/*
LLaves Foraneas
*/
ALTER TABLE comprar ADD CONSTRAINT comprar_fkey FOREIGN KEY(idProducto) REFERENCES producto(idProducto);
ALTER TABLE comprar ADD CONSTRAINT comprar2_fkey FOREIGN KEY(curp) REFERENCES persona(curp);
