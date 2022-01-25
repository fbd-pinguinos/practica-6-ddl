--La linea es de abajo es solo para ver que no hubiera problema con las tablas
DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;

CREATE TABLE trabajadorCompania(
	licencia CHAR(9) NOT NULL CHECK(CHAR_LENGTH(licencia) = 9) UNIQUE,
	correo VARCHAR(100) NOT NULL CHECK(correo <> ''),
	celular CHAR (10) NOT NULL CHECK(CHAR_LENGTH(celular) = 10),
	nombre VARCHAR(100) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(100) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(100) NOT NULL CHECK(apMaterno <> ''),
	fotografia VARCHAR(100) NOT NULL CHECK(fotografia <> ''),
	fechaIngreso DATE NOT NULL CHECK(fechaIngreso >= '1990-01-01'),
	fechaSalida DATE CHECK(fechaSalida >= '1990-01-02'),
	estado VARCHAR(100) NOT NULL CHECK(estado <> ''),
	municipio VARCHAR(100) NOT NULL CHECK(municipio <> ''),
	colonia VARCHAR(100) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(100) NOT NULL CHECK(calle <> ''),
	numero INT NOT NULL,
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	esDuenio BOOLEAN NOT NULL,
	esChofer BOOLEAN NOT NULL		
);
COMMENT ON TABLE trabajadorCompania IS 'Tabla que contiene los taxistas y dueños de vehiculos';
COMMENT ON COLUMN trabajadorCompania.licencia IS 'Número de licencia de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.correo IS 'Correo de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.celular IS 'Celular de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.nombre IS 'Nombre(s) de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.apPaterno IS 'Apellido paterno de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.apMaterno IS 'Apellido materno de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.fotografia IS 'Nombre del archivo asociado a su fotografía';
COMMENT ON COLUMN trabajadorCompania.fechaIngreso IS 'Fecha de ingreso a la asociación';
COMMENT ON COLUMN trabajadorCompania.fechaSalida IS 'Fecha de salida de la asociación (opcional)';
COMMENT ON COLUMN trabajadorCompania.estado IS 'Estado donde viven los trabajadores';
COMMENT ON COLUMN trabajadorCompania.municipio IS 'Municipio en el que viven los trabajadores';
COMMENT ON COLUMN trabajadorCompania.colonia IS 'Colonia de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.calle IS 'Calle de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.numero IS 'Numero de calle de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.rfc IS 'RFC de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.esChofer IS 'Nos indica que tipo de trabajador es la persona';
COMMENT ON COLUMN trabajadorCompania.esDuenio IS 'Nos indica que tipo de trabajador es la persona';

CREATE TABLE dirTrabajadorCompania(
	estado VARCHAR(100) NOT NULL CHECK(estado <> ''),
	municipio VARCHAR(100) NOT NULL CHECK(municipio <> ''),
	colonia VARCHAR(100) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(100) NOT NULL CHECK(calle <> ''),
	numero INT NOT NULL,
	cp INT NOT NULL CHECK(cp BETWEEN 10000 AND 99999)
);
COMMENT ON TABLE dirTrabajadorCompania IS 'Tabla que contiene las direcciones de los trabajadores';
COMMENT ON COLUMN dirTrabajadorCompania.estado IS 'Estado en el que viven los trabajadores';
COMMENT ON COLUMN dirTrabajadorCompania.municipio IS 'Municipio en el que viven los trabajadores';
COMMENT ON COLUMN dirTrabajadorCompania.colonia IS 'Colonia de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.calle IS 'Calle de los trabajadores';
COMMENT ON COLUMN dirTrabajadorCompania.numero IS 'Numero de calle de los trabajadores';
COMMENT ON COLUMN dirTrabajadorCompania.cp IS 'Código postal de los trabajadores';

CREATE TABLE cliente(
	correo VARCHAR(100) NOT NULL CHECK(correo <> '') UNIQUE,
	institucion VARCHAR(100) NOT NULL CHECK(institucion <> ''),
	telCasa CHAR (10) NOT NULL CHECK(CHAR_LENGTH(telCasa) = 10),
	celular CHAR (10) NOT NULL CHECK(CHAR_LENGTH(celular) = 10),
	nombre VARCHAR(100) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(100) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(100) NOT NULL CHECK(apMaterno <> ''),
	fotografia VARCHAR(100) NOT NULL CHECK(fotografia <> ''),
	estado VARCHAR(100) NOT NULL CHECK(estado <> ''),
	municipio VARCHAR(100) NOT NULL CHECK(municipio <> ''),
	colonia VARCHAR(100) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(100) NOT NULL CHECK(calle <> ''),
	numero INT NOT NULL,
	horaEntrada TIME, 
	horaSalida TIME,
	ocupacion VARCHAR(15) NOT NULL CHECK(ocupacion <> '')
);
COMMENT ON TABLE cliente IS 'Tabla que contiene a los clientes que solicitan viajes';
COMMENT ON COLUMN cliente.correo IS 'Correo del cliente';
COMMENT ON COLUMN cliente.institucion IS 'Institución en la que estudia o trabaja la persona';
COMMENT ON COLUMN cliente.telCasa IS 'Teléfono de casa de la persona';
COMMENT ON COLUMN cliente.fotografia IS 'Nombre del archivo de la fotografía asociada a la persona';
COMMENT ON COLUMN cliente.celular IS 'Celular de la persona';
COMMENT ON COLUMN cliente.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN cliente.apPaterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN cliente.apMaterno IS 'Apellido materno de la persona';
COMMENT ON COLUMN cliente.municipio IS 'Municipio dónde vive la persona';
COMMENT ON COLUMN cliente.estado IS 'Estado dónde vive la persona';
COMMENT ON COLUMN cliente.colonia IS 'Colonia donde vive la persona';
COMMENT ON COLUMN cliente.calle IS 'Calle donde vive la persona';
COMMENT ON COLUMN cliente.numero IS 'Número de la calle donde vive la persona';
COMMENT ON COLUMN cliente.horaEntrada IS 'Hora a la que inicia a trabajar/estudiar el cliente (opcional)';
COMMENT ON COLUMN cliente.horaSalida IS 'Hora a la que termina de trabajar/estudiar el cliente (opcional)';
COMMENT ON COLUMN cliente.ocupacion IS 'Ocupacion del cliente, ya sea estudiante, académico o trabajador';


CREATE TABLE dirCliente(
	estado VARCHAR(100) NOT NULL CHECK(estado <> ''),
	municipio VARCHAR(100) NOT NULL CHECK(municipio <> ''),
	colonia VARCHAR(100) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(100) NOT NULL CHECK(calle <> ''),
	numero INT NOT NULL,
	cp INT NOT NULL CHECK(cp BETWEEN 10000 AND 99999)
);
COMMENT ON TABLE dirCliente IS 'Tabla que contiene las direcciones de los clientes';
COMMENT ON COLUMN dirCliente.estado IS 'Municipio en el que viven los clientes';
COMMENT ON COLUMN dirCliente.municipio IS 'Municipio en el que viven los clientes';
COMMENT ON COLUMN dirCliente.colonia IS 'Colonia de los clientes';
COMMENT ON COLUMN dirCliente.calle IS 'Calle de los clientes';
COMMENT ON COLUMN dirCliente.numero IS 'Numero de calle de los clientes';
COMMENT ON COLUMN dirCliente.cp IS 'Código postal de los clientes';

CREATE TABLE aseguradora(
	nombre VARCHAR(100) NOT NULL CHECK(nombre <> '') UNIQUE
);
COMMENT ON TABLE aseguradora IS 'Tabla con las aseguradoras de los vehículos';
COMMENT ON COLUMN aseguradora.nombre IS 'Nombre de la aseguradora';

CREATE TABLE vehiculo(
	nEconomico INT NOT NULL CHECK(nEconomico > 0) UNIQUE,
	licencia CHAR(9) NOT NULL CHECK(CHAR_LENGTH(licencia) = 9),
	nombre VARCHAR(100) CHECK(nombre <> ''),
	cilindros INT NOT NULL CHECK(cilindros BETWEEN 4 AND 12),
	modelo VARCHAR(100) NOT NULL CHECK(modelo <> ''),
	anio CHAR(4) NOT NULL CHECK(CHAR_LENGTH(anio) = 4),
	energia VARCHAR(100) NOT NULL CHECK(energia <> ''),
	transmision VARCHAR(100) NOT NULL CHECK(transmision <> ''),
	llantaRef BOOLEAN NOT NULL,
	operando BOOLEAN NOT NULL,
	razon VARCHAR(500) CHECK(razon <> ''),
	tipoSeguro VARCHAR(100) CHECK(tipoSeguro <> ''),
	vigencia DATE CHECK(vigencia >= '2022-01-01')
);
COMMENT ON TABLE vehiculo IS 'Tabla que contiene a los vehículos de la asociación';
COMMENT ON COLUMN vehiculo.nEconomico IS 'Número de registro del auto en la asociación'; 
COMMENT ON COLUMN vehiculo.licencia IS 'Número de licencia de los trabajadores'; 
COMMENT ON COLUMN vehiculo.nombre IS 'Nombre de la aseguradora del auto'; 
COMMENT ON COLUMN vehiculo.cilindros IS 'Número de cilindros del vehículo'; 
COMMENT ON COLUMN vehiculo.modelo IS 'Modelo del auto'; 
COMMENT ON COLUMN vehiculo.anio IS 'Año del auto'; 
COMMENT ON COLUMN vehiculo.energia IS 'Tipo de energía del auto'; 
COMMENT ON COLUMN vehiculo.transmision IS 'Tipo de transmision del auto'; 
COMMENT ON COLUMN vehiculo.llantaRef IS 'Sí el auto tiene llanta de refaciión'; 
COMMENT ON COLUMN vehiculo.operando IS 'Sí el auto sigue dado de alta en la asociación'; 
COMMENT ON COLUMN vehiculo.razon IS 'Razon por la que se dio de baja'; 
COMMENT ON COLUMN vehiculo.tipoSeguro IS 'Tipo de seguro que posee el auto'; 
COMMENT ON COLUMN vehiculo.vigencia IS 'Vigencia del auto'; 

CREATE TABLE capacidadCoche(
	modelo VARCHAR(100) NOT NULL CHECK(modelo <> ''),
	anio CHAR(4) NOT NULL CHECK(CHAR_LENGTH(anio) = 4),
	puertas CHAR(1) NOT NULL,
	pasajeros INT NOT NULL CHECK(pasajeros BETWEEN 2 AND 8)
);
COMMENT ON TABLE capacidadCoche IS 'Descipción física de los autos de la asocación';
COMMENT ON COLUMN capacidadCoche.modelo IS 'Modelo del auto';
COMMENT ON COLUMN capacidadCoche.anio IS 'Año del auto';
COMMENT ON COLUMN capacidadCoche.puertas IS 'Número de puertas del auto';
COMMENT ON COLUMN capacidadCoche.pasajeros IS 'Número de pasajeros que puede albergar el auto';

CREATE TABLE marca(
	modelo VARCHAR(100) NOT NULL CHECK(modelo <> ''),
	marca VARCHAR(100) NOT NULL CHECK(MARCA <> '')
);
COMMENT ON TABLE marca IS 'Infromación técnica de los autos de la asociación.';
COMMENT ON COLUMN marca.modelo IS 'Modelo del auto';
COMMENT ON COLUMN marca.marca IS 'Marca del auto';

CREATE TABLE viaje(
	numViaje INT NOT NULL CHECK(numViaje > 0) UNIQUE,
	licencia CHAR(9) NOT NULL CHECK(CHAR_LENGTH(licencia) = 9),
	nEconomico INT NOT NULL CHECK(nEconomico > 0),
	fecha DATE NOT NULL CHECK(fecha >= '2022-01-01'),
	nPersonas INT NOT NULL CHECK(nPersonas BETWEEN 1 AND 8),
	tiempo INT NOT NULL CHECK(tiempo > 0),
	distancia REAL NOT NULL CHECK(distancia > 0),
	monto REAL NOT NULL CHECK(monto >= 5)
);
COMMENT ON TABLE viaje IS 'Tabla que contiene la información de los viajes relacionadas con los taxis';
COMMENT ON COLUMN viaje.numViaje IS 'Número del viaje';
COMMENT ON COLUMN viaje.licencia IS 'Licencia del chófer asociado al viaje';
COMMENT ON COLUMN viaje.nEconomico IS 'Número económico del vehículo asociado al viaje';
COMMENT ON COLUMN viaje.fecha IS 'Fecha en la que se realiza el viaje';
COMMENT ON COLUMN viaje.nPersonas IS 'Número de personas que realizarán el viaje';
COMMENT ON COLUMN viaje.tiempo IS 'Tiempo estimado del viaje';
COMMENT ON COLUMN viaje.distancia IS 'Distancia del viaje';
COMMENT ON COLUMN viaje.monto IS 'Monto del viaje';

--CHECAR DESTINO Y ORIGEN QUE ME CONFUNDÍ UN POCO
CREATE TABLE origen(
	numViaje INT NOT NULL CHECK(numViaje > 0),
	lugarOrigen VARCHAR(100) NOT NULL CHECK(lugarOrigen <> ''),
	horaOrigen TIME NOT NULL
);
COMMENT ON TABLE origen IS 'Tabla con el origen (puede ser más de uno) de los viajes';
COMMENT ON COLUMN origen.numViaje IS 'Número de viaje';
COMMENT ON COLUMN origen.lugarOrigen IS 'Lugar(es) de origen del viaje';
COMMENT ON COLUMN origen.horaOrigen IS 'Hora de origen del viaje';

CREATE TABLE destino(
	numViaje INT NOT NULL CHECK(numViaje > 0),
	lugarDestino VARCHAR(100) NOT NULL CHECK(lugarDestino <> ''),
	horaDestino TIME NOT NULL
);
COMMENT ON TABLE destino IS 'Tabla con el destino (puede ser más de uno) de los viajes';
COMMENT ON COLUMN destino.numViaje IS 'Número de viaje';
COMMENT ON COLUMN destino.lugarDestino IS 'Lugar(es) de destino del viaje';
COMMENT ON COLUMN destino.horaDestino IS 'Hora de destino del viaje';

CREATE TABLE infraccion(
	nEconomico INT NOT NULL CHECK(nEconomico > 0),
	numInfraccion INT NOT NULL CHECK(numInfraccion > 0) UNIQUE,
	licencia CHAR(9) NOT NULL CHECK(CHAR_LENGTH(licencia) = 9),
	calle VARCHAR(100) NOT NULL CHECK(calle <> ''),
	cp INT NOT NULL CHECK(cp BETWEEN 10000 AND 99999),
	fecha DATE NOT NULL CHECK(fecha >= '2021-01-01'),
	monto INT NOT NULL CHECK(monto > 100),
	agente VARCHAR(100) NOT NULL CHECK(agente <> ''),
	hora TIME NOT NULL
);
COMMENT ON TABLE infraccion IS 'Tabla que contiene las infracciones de los vehículos dados de alta';
COMMENT ON COLUMN infraccion.nEconomico IS 'Número económico del auto';
COMMENT ON COLUMN infraccion.numInfraccion IS 'Número de infracción del auto';
COMMENT ON COLUMN infraccion.licencia IS 'Número de licencia del conductor';
COMMENT ON COLUMN infraccion.calle IS 'Calle dónde se cometió la infracción';
COMMENT ON COLUMN infraccion.cp IS 'Código postal dónde se cometió la infracción';
COMMENT ON COLUMN infraccion.fecha IS 'Fecha cuando se cometió la infracción';
COMMENT ON COLUMN infraccion.monto IS 'Monto de la infracción';
COMMENT ON COLUMN infraccion.agente IS 'Agente que realizó la multa';
COMMENT ON COLUMN infraccion.hora IS 'Hora de la infracción';

CREATE TABLE delegacion(
	cp INT NOT NULL CHECK(cp BETWEEN 10000 AND 99999),
	alcaldia VARCHAR(100) NOT NULL CHECK(alcaldia <> '')
);
COMMENT ON TABLE delegacion IS 'Información relacionada a dónde los taxis cometen infracciones';
COMMENT ON COLUMN delegacion.cp IS 'Código postal donde se realizó la infracción';
COMMENT ON COLUMN delegacion.alcaldia IS 'Alcaldía dónde se cometió la infracción'; 

CREATE TABLE manejar(
	licencia CHAR(9) NOT NULL CHECK(CHAR_LENGTH(licencia) = 9),
	nEconomico INT NOT NULL CHECK(nEconomico > 0)
);
COMMENT ON TABLE manejar IS 'Tabla de los chóferes que manejan los taxis';
COMMENT ON COLUMN manejar.licencia IS 'Licencia del conductor';
COMMENT ON COLUMN manejar.nEconomico IS 'Número económico del auto';

CREATE TABLE solicitar(
	correo VARCHAR(100) NOT NULL CHECK(correo <> ''),
	numViaje INT NOT NULL CHECK(numViaje > 0),
	costo REAL NOT NULL CHECK(costo >= 5)
);
COMMENT ON TABLE solicitar IS 'Tabla que relaciona los viajes que han hechos los clientes';
COMMENT ON COLUMN solicitar.correo IS 'Correo del cliente';
COMMENT ON COLUMN solicitar.numViaje IS 'Número de viaje asociado.';
COMMENT ON COLUMN solicitar.costo IS 'Costo del viaje para el cliente';

-- Patrón de correos
ALTER TABLE trabajadorCompania ADD CONSTRAINT proper_email CHECK (correo ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');
ALTER TABLE cliente ADD CONSTRAINT proper_email CHECK (correo ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');

--TrabajadorCompania y dirTrabajadorCompania
ALTER TABLE trabajadorCompania ADD CONSTRAINT trabajadorCompania_pkey PRIMARY KEY(licencia); 
ALTER TABLE dirtrabajadorCompania ADD CONSTRAINT dirtrabajadorCompania_pkey PRIMARY KEY(estado, municipio, colonia, calle, numero); 

--Cliente y dirCliente
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY(correo);
ALTER TABLE dircliente ADD CONSTRAINT dircliente_pkey PRIMARY KEY(estado, municipio, colonia, calle, numero);

--Aseguradora
ALTER TABLE aseguradora ADD CONSTRAINT aseguradora_pkey PRIMARY KEY(nombre);

--Vehiculo
ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pkey PRIMARY KEY(nEconomico);
ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_fkey2 FOREIGN KEY(nombre) REFERENCES aseguradora
ON UPDATE CASCADE ON DELETE CASCADE;

--capacidadCoche y marca
ALTER TABLE capacidadCoche ADD CONSTRAINT capacidadCoche_pkey PRIMARY KEY(modelo, anio);
ALTER TABLE marca ADD CONSTRAINT marca_pkey PRIMARY KEY(modelo);

--Viaje
ALTER TABLE viaje ADD CONSTRAINT viaje_pkey PRIMARY KEY(numViaje);
ALTER TABLE viaje ADD CONSTRAINT viaje_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE viaje ADD CONSTRAINT viaje_fkey2 FOREIGN KEY(nEconomico) REFERENCES vehiculo
ON UPDATE CASCADE ON DELETE CASCADE;

--Origen 
ALTER TABLE origen ADD CONSTRAINT origen_pkey PRIMARY KEY(numViaje, lugarOrigen, horaOrigen);

--Destino
ALTER TABLE destino ADD CONSTRAINT destino_pkey PRIMARY KEY(numViaje, lugarDestino, horaDestino);

--Infraccion
ALTER TABLE infraccion ADD CONSTRAINT infraccion_pkey PRIMARY KEY(nEconomico, numInfraccion);
ALTER TABLE infraccion ADD CONSTRAINT infraccion_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;

--delegacion
ALTER TABLE delegacion ADD CONSTRAINT delegacion_pkey PRIMARY KEY(cp);

--Manejar
ALTER TABLE manejar ADD CONSTRAINT manejar_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE manejar ADD CONSTRAINT manejar_fkey2 FOREIGN KEY(nEconomico) REFERENCES vehiculo
ON UPDATE CASCADE ON DELETE CASCADE;

--Solicitar 
ALTER TABLE solicitar ADD CONSTRAINT solicitar_fkey FOREIGN KEY(correo) REFERENCES cliente
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE solicitar ADD CONSTRAINT solicitar_fkey2 FOREIGN KEY(numViaje) REFERENCES viaje
ON UPDATE CASCADE ON DELETE CASCADE;
