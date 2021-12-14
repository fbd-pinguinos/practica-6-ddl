DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE persona(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) CHECK(apellidoPaterno<> ''),
	apellidoMaterno VARCHAR(50) CHECK(apellidoMaterno <> ''),
	calle VARCHAR(40) CHECK (calle <> ''),
	municipio VARCHAR(40) CHECK(municipio <> ''),
	numero INT NOT NULL,
	cp INT CHECK(cp between 10000 and 99999),
	estado VARCHAR(20) CHECK(estado <> ''),
	nacimiento DATE NOT NULL CHECK(nacimiento >= '1955-01-01'),
	genero CHAR(1) CHECK(genero <> ''),
	correo VARCHAR(50) CHECK(correo <> ''),
	contraseña VARCHAR(30) CHECK (contraseña <> ''),
	esRepartidor BOOLEAN NOT NULL,
	esCliente BOOLEAN NOT NULL,
	puntos INT CHECK(puntos >= 0),
	enviosRealizados INT CHECK(enviosRealizados >= 0),
	calificacion INT,
	salario INT CHECK (salario > 0),
	horaInicio TIME,
	horaFin TIME,
	curpSupervisor CHAR(18) CHECK(CHAR_LENGTH(curpSupervisor) = 18)
);
COMMENT ON TABLE persona IS 'Tabla que contiene los clientes y repartidores de la empresa Nixut';
COMMENT ON COLUMN persona.curp IS 'CURP de los clientes y repartidores (PK)';
COMMENT ON COLUMN persona.apellidoPaterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN persona.apellidoMaterno IS 'Apellido materno de la persona';
COMMENT ON COLUMN persona.calle IS 'Calle en la que vive la persona';
COMMENT ON COLUMN persona.municipio IS 'Municipio donde vive la persona';
COMMENT ON COLUMN persona.numero IS 'Número de la calle donde vive la persona';
COMMENT ON COLUMN persona.cp IS 'Código postal donde vive la persona';
COMMENT ON COLUMN persona.estado IS 'Estado donde vive la persona';
COMMENT ON COLUMN persona.nacimiento IS 'Fecha de nacimiento de la persona';
COMMENT ON COLUMN persona.genero IS 'Género de la persona';
COMMENT ON COLUMN persona.correo IS 'Correo electrónico de la persona';
COMMENT ON COLUMN persona.puntos IS 'Puntos que obtienen los clientes al hacer sus compras';
COMMENT ON COLUMN persona.contraseña IS 'Contraseña de los correos de las personas';
COMMENT ON COLUMN persona.enviosRealizados IS 'Número de envíos realizados por los repartidores';
COMMENT ON COLUMN persona.calificacion IS 'Calificación de los repartidores';
COMMENT ON COLUMN persona.salario IS 'Salario de los repartidores';
COMMENT ON COLUMN persona.horaInicio IS 'Hora en que comienzan a laborar los repartidores';
COMMENT ON COLUMN persona.horaFin IS 'Hora en que terminan de laborar los repartidores';
COMMENT ON COLUMN persona.esRepartidor IS 'Identifca si una persona es un repartidor';
COMMENT ON COLUMN persona.esCliente IS 'Identifca si una persona es un cliente';
COMMENT ON COLUMN persona.curpSupervisor IS 'CURP de las personas que son supervisores';

CREATE TABLE categoria(
	nombre VARCHAR(50) CHECK(nombre <> '') UNIQUE,
	descripcion VARCHAR(500) CHECK(descripcion <> ''),
	numeroProductos INT NOT NULL CHECK(numeroProductos >=0)
);
COMMENT ON TABLE categoria IS 'Tabla que contiene las categorías donde se distribuyen los articulos de la tienda';
COMMENT ON COLUMN categoria.nombre IS 'Nombre de la categoría';
COMMENT ON COLUMN categoria.descripcion IS 'Descripción de la categoría';
COMMENT ON COLUMN categoria.numeroProductos IS 'Número de productos que tiene cada categoría';

CREATE TABLE proveedor(
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12) UNIQUE,
	razonSocial VARCHAR(50) CHECK(razonSocial <> ''),
	estado VARCHAR(20) CHECK(estado <> ''),
	cp INT CHECK(cp between 10000 and 99999),
	municipio VARCHAR(30) CHECK(municipio <> ''),
	numero INT NOT NULL,
	calle VARCHAR(30) CHECK (calle <> '')
);
COMMENT ON TABLE proveedor IS 'Tabla de los proveedores que venden los productos a la tienda';
COMMENT ON COLUMN proveedor.rfc IS 'RFC del proveedor';
COMMENT ON COLUMN proveedor.razonSocial IS 'Razón Social del proveedor';
COMMENT ON COLUMN proveedor.estado IS 'Estado donde se ubica el proveedor';
COMMENT ON COLUMN proveedor.cp IS 'Código postal donde se ubica el proveedor';
COMMENT ON COLUMN proveedor.municipio IS 'Municipio donde se ubica el proveedor';
COMMENT ON COLUMN proveedor.numero IS 'Número de la calle donde se ubica el proveedor';
COMMENT ON COLUMN proveedor.calle IS 'Calle donde se ubica el proveedor';

CREATE TABLE telefonoProveedor(
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	telefono bigint NOT NULL UNIQUE
);
COMMENT ON TABLE telefonoProveedor IS 'Tabla de los teléfonos de los proveedores';
COMMENT ON COLUMN telefonoProveedor.rfc IS 'RFC del proveedor';
COMMENT ON COLUMN telefonoProveedor.telefono IS 'Telefono del proveedor';

CREATE TABLE pedido(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido SERIAL NOT NULL UNIQUE,
	hora TIME NOT NULL
);
COMMENT ON TABLE pedido IS 'Tabla que contiene los pedidos que generan los clientes';
COMMENT ON COLUMN pedido.curp IS 'CURP del cliente';
COMMENT ON COLUMN pedido.numeroPedido IS 'Número de pedido que se genera cuando los clientes hacen una compra';
COMMENT ON COLUMN pedido.hora IS 'Hora en la que se genera el pedido';

CREATE TABLE tarjetaCredito(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago SERIAL NOT NULL UNIQUE,
	titular VARCHAR(60) CHECK(titular <> ''),
	vencimiento DATE NOT NULL CHECK(vencimiento >= '1910-01-01'),
	numeroTarjeta bigint NOT NULL,
	cvv INT NOT NULL CHECK(cvv between 000 and 999)
);
COMMENT ON TABLE tarjetaCredito IS 'Tabla que contiene las tarjetas de crédito de los clientes';
COMMENT ON COLUMN tarjetaCredito.curp IS 'CURP del cliente';
COMMENT ON COLUMN tarjetaCredito.referenciaPago IS 'Referencia de pago que segenra cuando los clientes realizan una compra';
COMMENT ON COLUMN tarjetaCredito.titular IS 'Nombre del titular de la tarjeta';
COMMENT ON COLUMN tarjetaCredito.vencimiento IS 'Fecha de vencimiento de la tarjeta';
COMMENT ON COLUMN tarjetaCredito.numeroTarjeta IS 'Número de la tarjeta';
COMMENT ON COLUMN tarjetaCredito.cvv IS 'CVV de la tarjeta';

CREATE TABLE tarjetaDebito(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago SERIAL NOT NULL UNIQUE,
	titular VARCHAR(60) CHECK(titular <> ''),
	vencimiento DATE NOT NULL CHECK(vencimiento >= '1910-01-01'),
	numeroTarjeta bigint NOT NULL,
	cvv INT NOT NULL CHECK(cvv between 000 and 999)
);
COMMENT ON TABLE tarjetaDebito IS 'Tabla que contiene las tarjetas de débito de los clientes';
COMMENT ON COLUMN tarjetaDebito.curp IS 'CURP del cliente';
COMMENT ON COLUMN tarjetaDebito.referenciaPago IS 'Referencia de pago que segenra cuando los clientes realizan una compra';
COMMENT ON COLUMN tarjetaDebito.titular IS 'Nombre del titular de la tarjeta';
COMMENT ON COLUMN tarjetaDebito.vencimiento IS 'Fecha de vencimiento de la tarjeta';
COMMENT ON COLUMN tarjetaDebito.numeroTarjeta IS 'Número de la tarjeta';
COMMENT ON COLUMN tarjetaDebito.cvv IS 'CVV de la tarjeta';

CREATE TABLE contraentrega(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	referenciaPago SERIAL NOT NULL UNIQUE
);
COMMENT ON TABLE contraentrega IS 'Tabla de los recibos de las compras hechas con dinero en efectivo';
COMMENT ON COLUMN contraentrega.curp IS 'CURP del cliente';
COMMENT ON COLUMN contraentrega.referenciaPago IS 'Referencia de pago que segenra cuando los clientes realizan una compra';


CREATE TABLE envioNormal(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido SERIAL NOT NULL, 
	numeroEnvio SERIAL NOT NULL UNIQUE,
	estatus VARCHAR(15) CHECK(estatus <> ''),
	tiempoEnvio VARCHAR(10) CHECK(tiempoEnvio <> '')
);
COMMENT ON TABLE envioNormal IS 'Tabla con los envíos normales que se generan';
COMMENT ON COLUMN envioNormal.curp IS 'CURP del cliente';
COMMENT ON COLUMN envioNormal.numeroPedido IS 'Número de pedido que se genera al realizar la compra';
COMMENT ON COLUMN envioNormal.numeroEnvio IS 'Número de envío que se genera al realizar un pedido';
COMMENT ON COLUMN envioNormal.estatus IS 'Estatus del pedido';
COMMENT ON COLUMN envioNormal.tiempoEnvio IS 'Tiempo de envío del pedido';

CREATE TABLE envioExpress(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
	numeroPedido SERIAL NOT NULL, 
	numeroEnvio SERIAL NOT NULL UNIQUE,
	estatus VARCHAR(15) CHECK(estatus <> ''),
	tiempoEnvioUsuario VARCHAR(10) CHECK(tiempoEnvioUsuario <> '')
);
COMMENT ON TABLE envioExpress IS 'Tabla con los envíos express que se generan';
COMMENT ON COLUMN envioExpress.curp IS 'CURP del cliente';
COMMENT ON COLUMN envioExpress.numeroPedido IS 'Número de pedido que se genera al realizar la compra';
COMMENT ON COLUMN envioExpress.numeroEnvio IS 'Número de envío que se genera al realizar un pedido';
COMMENT ON COLUMN envioExpress.estatus IS 'Estatus del pedido';
COMMENT ON COLUMN envioExpress.tiempoEnvioUsuario IS 'Tiempo de envío del pedido que señala el usuario';

CREATE TABLE producto(
	idProducto SERIAL NOT NULL UNIQUE,
	nombre VARCHAR(50) CHECK(nombre <> ''),
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	nombreArchivo VARCHAR(30) CHECK(nombreArchivo <> ''),
	descripcion VARCHAR(500) CHECK(descripcion <> ''),
	unidades INT NOT NULL CHECK(unidades >= 0),
	precio INT NOT NULL CHECK(precio >= 0),
	nombreProducto VARCHAR(30) CHECK(nombreProducto <> ''),
	descuento INT CHECK(descuento between 0 and 100)
);
COMMENT ON TABLE producto IS 'Productos con los que cuenta la tienda';
COMMENT ON COLUMN producto.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN producto.nombre IS 'Nombre de la categoría dónde se distribuyen los productos';
COMMENT ON COLUMN producto.rfc IS 'RFC del proveedor que distribuyen los productos';
COMMENT ON COLUMN producto.nombreArchivo IS 'Nombre del archivo de la imagen asociada al producto';
COMMENT ON COLUMN producto.descripcion IS 'Descipción del producto';
COMMENT ON COLUMN producto.unidades IS 'Número de unidades de los productos';
COMMENT ON COLUMN producto.precio IS 'Precio de los productos';
COMMENT ON COLUMN producto.nombreProducto IS 'Nombre del producto';
COMMENT ON COLUMN producto.descuento IS 'Descuento de los productos si lo tiene';

CREATE TABLE comprar(
	idProducto SERIAL NOT NULL,
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18)
);
COMMENT ON TABLE comprar IS 'Tabla con las compras que hacen los usuarios';
COMMENT ON COLUMN comprar.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN comprar.curp IS 'CURP del cliente';

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
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_fkey FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tarjetaCredito ADD CONSTRAINT tarjetaCredito_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE tarjetaCredito ADD CONSTRAINT tarjetaCredito_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tarjetaDebito ADD CONSTRAINT tarjetaDebito_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE tarjetaDebito ADD CONSTRAINT tarjetaDebito_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE contraentrega ADD CONSTRAINT contraentrega_pkey PRIMARY KEY(curp, referenciaPago);
ALTER TABLE contraentrega ADD CONSTRAINT contraentrega_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE envioNormal ADD CONSTRAINT envioNormal_pkey PRIMARY KEY(numeroPedido, numeroEnvio);
ALTER TABLE envioNormal ADD CONSTRAINT envioNormal_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE envioNormal ADD CONSTRAINT envioNormal2_fkey FOREIGN KEY(numeroPedido) REFERENCES pedido(numeroPedido)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE envioExpress ADD CONSTRAINT envioExpress_pkey PRIMARY KEY(numeroPedido, numeroEnvio);
ALTER TABLE envioExpress ADD CONSTRAINT envioExpress_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE envioExpress ADD CONSTRAINT envioExpress2_fkey FOREIGN KEY(numeroPedido) REFERENCES pedido(numeroPedido)
ON UPDATE CASCADE ON DELETE CASCADE;

/*
LLaves Foraneas
*/
ALTER TABLE comprar ADD CONSTRAINT comprar_fkey FOREIGN KEY(idProducto) REFERENCES producto(idProducto)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE comprar ADD CONSTRAINT comprar2_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE pedido ADD CONSTRAINT pedido_pkey PRIMARY KEY(numeroPedido);
ALTER TABLE pedido ADD CONSTRAINT pedido_fkey FOREIGN KEY(curp) REFERENCES persona(curp)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE producto ADD CONSTRAINT producto_pkey PRIMARY KEY(idProducto);
ALTER TABLE producto ADD CONSTRAINT producto_fkey FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE producto ADD CONSTRAINT producto2_fkey FOREIGN KEY(nombre) REFERENCES categoria(nombre)
ON UPDATE CASCADE ON DELETE CASCADE;
