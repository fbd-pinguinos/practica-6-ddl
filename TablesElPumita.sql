DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE trabajadorCompania(
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8) UNIQUE,
	correo VARCHAR(50) NOT NULL CHECK(correo <> ''),
	celular BIGINT NOT NULL,
	nombre VARCHAR(60) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(60) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(60) NOT NULL CHECK(apMaterno <> ''),
	fotografia VARCHAR(40) NOT NULL CHECK(fotografia <> ''),
	fechaIngreso DATE NOT NULL CHECK(fechaIngreso >= '1990-01-01'),
	fechaSalida DATE CHECK(fechaSalida >= '1990-01-02'),
	estado VARCHAR(40) NOT NULL CHECK(estado <> ''),
	municipio VARCHAR(40) NOT NULL CHECK(municipio <> ''),
	cp INT NOT NULL,
	colonia VARCHAR(50) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(60) NOT NULL CHECK(calle <> ''),
	numeroCalle INT NOT NULL,
	rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),
	esChofer BOOLEAN NOT NULL,
	esDuenio BOOLEAN NOT NULL		
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
COMMENT ON COLUMN trabajadorCompania.cp IS 'Codigo postal de la vivienda de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.colonia IS 'Colonia de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.calle IS 'Calle de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.numeroCalle IS 'Numero de calle de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.rfc IS 'RFC de los trabajadores';
COMMENT ON COLUMN trabajadorCompania.esChofer IS 'Nos indica que tipo de trabajador es la persona';
COMMENT ON COLUMN trabajadorCompania.esDuenio IS 'Nos indica que tipo de trabajador es la persona';

CREATE TABLE academico(
	correo VARCHAR(50) NOT NULL CHECK(correo <> '') UNIQUE,
	institucion VARCHAR(100) NOT NULL CHECK(institucion <> ''),
	telCasa BIGINT NOT NULL,
	fotografia VARCHAR(40) NOT NULL CHECK(fotografia <> ''),
	celular BIGINT NOT NULL,
	nombre VARCHAR(60) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(60) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(60) NOT NULL CHECK(apMaterno <> ''),
	municipio VARCHAR(40) NOT NULL CHECK(municipio <> ''),
	estado VARCHAR(40) NOT NULL CHECK(estado <> ''),
	colonia VARCHAR(50) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(60) NOT NULL CHECK(calle <> ''),
	cp INT NOT NULL, 
	numeroCalle INT NOT NULL,
	horaEntrada TIME, 
	horaSalida TIME	
);
COMMENT ON TABLE academico IS 'Tabla que contiene a los académicos que solicitan viajes';
COMMENT ON COLUMN academico.correo IS 'Correo del académico';
COMMENT ON COLUMN academico.institucion IS 'Institución en la que estudia o trabaja la persona';
COMMENT ON COLUMN academico.telCasa IS 'Teléfono de casa de la persona';
COMMENT ON COLUMN academico.fotografia IS 'Nombre del archivo de la fotografía asociada a la persona';
COMMENT ON COLUMN academico.celular IS 'Celular de la persona';
COMMENT ON COLUMN academico.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN academico.apPaterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN academico.apMaterno IS 'Apellido materno de la persona';
COMMENT ON COLUMN academico.municipio IS 'Municipio dónde vive la persona';
COMMENT ON COLUMN academico.estado IS 'Estado dónde vive la persona';
COMMENT ON COLUMN academico.colonia IS 'Colonia donde vive la persona';
COMMENT ON COLUMN academico.calle IS 'Calle donde vive la persona';
COMMENT ON COLUMN academico.cp IS 'Código postal donde vive la persona';
COMMENT ON COLUMN academico.numeroCalle IS 'Número de la calle donde vive la persona';
COMMENT ON COLUMN academico.horaEntrada IS 'Hora a la que inicia a trabajar el académico (opcional)';
COMMENT ON COLUMN academico.horaSalida IS 'Hora a la que termina de trabajar el académico (opcional)';

CREATE TABLE alumno(
	correo VARCHAR(50) NOT NULL CHECK(correo <> '') UNIQUE,
	institucion VARCHAR(100) NOT NULL CHECK(institucion <> ''),
	telCasa BIGINT NOT NULL,
	fotografia VARCHAR(40) NOT NULL CHECK(fotografia <> ''),
	celular BIGINT NOT NULL,
	nombre VARCHAR(60) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(60) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(60) NOT NULL CHECK(apMaterno <> ''),
	municipio VARCHAR(40) NOT NULL CHECK(municipio <> ''),
	estado VARCHAR(40) NOT NULL CHECK(estado <> ''),
	colonia VARCHAR(50) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(60) NOT NULL CHECK(calle <> ''),
	cp INT NOT NULL, 
	numeroCalle INT NOT NULL,
	horaEntrada TIME, 
	horaSalida TIME	
);
COMMENT ON TABLE alumno IS 'Tabla que contiene a los alumnos que solicitan viajes';
COMMENT ON COLUMN alumno.correo IS 'Correo del alumno';
COMMENT ON COLUMN alumno.institucion IS 'Institución en la que estudia o trabaja la persona';
COMMENT ON COLUMN alumno.telCasa IS 'Teléfono de casa de la persona';
COMMENT ON COLUMN alumno.fotografia IS 'Nombre del archivo de la fotografía asociada a la persona';
COMMENT ON COLUMN alumno.celular IS 'Celular de la persona';
COMMENT ON COLUMN alumno.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN alumno.apPaterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN alumno.apMaterno IS 'Apellido materno de la persona';
COMMENT ON COLUMN alumno.municipio IS 'Municipio dónde vive la persona';
COMMENT ON COLUMN alumno.estado IS 'Estado dónde vive la persona';
COMMENT ON COLUMN alumno.colonia IS 'Colonia donde vive la persona';
COMMENT ON COLUMN alumno.calle IS 'Calle donde vive la persona';
COMMENT ON COLUMN alumno.cp IS 'Código postal donde vive la persona';
COMMENT ON COLUMN alumno.numeroCalle IS 'Número de la calle donde vive la persona';
COMMENT ON COLUMN alumno.horaEntrada IS 'Hora a la que inician las clases (opcional)';
COMMENT ON COLUMN alumno.horaSalida IS 'Hora a la que terminan las clases (opcional)';

CREATE TABLE trabajador(
	correo VARCHAR(50) NOT NULL CHECK(correo <> '') UNIQUE,
	institucion VARCHAR(100) NOT NULL CHECK(institucion <> ''),
	telCasa BIGINT NOT NULL,
	fotografia VARCHAR(40) NOT NULL CHECK(fotografia <> ''),
	celular BIGINT NOT NULL,
	nombre VARCHAR(60) NOT NULL CHECK(nombre <> ''),
	apPaterno VARCHAR(60) NOT NULL CHECK(apPaterno <> ''),
	apMaterno VARCHAR(60) NOT NULL CHECK(apMaterno <> ''),
	municipio VARCHAR(40) NOT NULL CHECK(municipio <> ''),
	estado VARCHAR(40) NOT NULL CHECK(estado <> ''),
	colonia VARCHAR(50) NOT NULL CHECK(colonia <> ''),
	calle VARCHAR(60) NOT NULL CHECK(calle <> ''),
	cp INT NOT NULL, 
	numeroCalle INT NOT NULL,
	horaEntrada TIME, 
	horaSalida TIME	
);
COMMENT ON TABLE trabajador IS 'Tabla que contiene a los trabajadores que solicitan viajes';
COMMENT ON COLUMN trabajador.correo IS 'Correo del trabajador';
COMMENT ON COLUMN trabajador.institucion IS 'Institución en la que trabaja la persona';
COMMENT ON COLUMN trabajador.telCasa IS 'Teléfono de casa de la persona';
COMMENT ON COLUMN trabajador.fotografia IS 'Nombre del archivo de la fotografía asociada a la persona';
COMMENT ON COLUMN trabajador.celular IS 'Celular de la persona';
COMMENT ON COLUMN trabajador.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN trabajador.apPaterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN trabajador.apMaterno IS 'Apellido materno de la persona';
COMMENT ON COLUMN trabajador.municipio IS 'Municipio dónde vive la persona';
COMMENT ON COLUMN trabajador.estado IS 'Estado dónde vive la persona';
COMMENT ON COLUMN trabajador.colonia IS 'Colonia donde vive la persona';
COMMENT ON COLUMN trabajador.calle IS 'Calle donde vive la persona';
COMMENT ON COLUMN trabajador.cp IS 'Código postal donde vive la persona';
COMMENT ON COLUMN trabajador.numeroCalle IS 'Número de la calle donde vive la persona';
COMMENT ON COLUMN trabajador.horaEntrada IS 'Hora a la que inicia a trabajar la persona (opcional)';
COMMENT ON COLUMN trabajador.horaSalida IS 'Hora a la que termina de trabajar la persona (opcional)';

CREATE TABLE aseguradora(
	nombre VARCHAR(40) NOT NULL CHECK(nombre <> '') UNIQUE
);
COMMENT ON TABLE aseguradora IS 'Tabla con las aseguradoras de los vehículos';
COMMENT ON COLUMN aseguradora.nombre IS 'Nombre de la aseguradora';

CREATE TABLE vehiculoFuncional(
	nEconomico INT NOT NULL CHECK(nEconomico > 0) UNIQUE,
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8),
	nombre VARCHAR(40) NOT NULL CHECK(nombre <> ''),
	puertas INT NOT NULL CHECK(puertas BETWEEN 2 AND 6),
	cilindros INT NOT NULL CHECK(cilindros BETWEEN 4 AND 12),
	marca VARCHAR(60) NOT NULL CHECK(MARCA <> ''),
	modelo VARCHAR(60) NOT NULL CHECK(modelo <> ''),
	anio DATE NOT NULL CHECK(anio >= '1990-01-01'),
	pasajeros INT NOT NULL CHECK(pasajeros BETWEEN 2 AND 8),
	energia VARCHAR(20) NOT NULL CHECK(energia <> ''),
	transmision VARCHAR(20) NOT NULL CHECK(transmision <> ''),
	llantaRef BOOLEAN NOT NULL,
	tipoSeguro VARCHAR(60) CHECK(tipoSeguro <> ''),
	vigencia DATE CHECK(vigencia >= '2022-01-01')
);
COMMENT ON TABLE vehiculoFuncional IS 'Tabla que contiene a los vehículos dados de alta en la asociación';
COMMENT ON COLUMN vehiculoFuncional.nEconomico IS 'Número de registro del auto en la asociación'; 
COMMENT ON COLUMN vehiculoFuncional.licencia IS 'Número de licencia de los trabajadores'; 
COMMENT ON COLUMN vehiculoFuncional.nombre IS 'Nombre de la aseguradora del auto'; 
COMMENT ON COLUMN vehiculoFuncional.puertas IS 'Número de puertas del vehículo'; 
COMMENT ON COLUMN vehiculoFuncional.cilindros IS 'Número de cilindros del vehículo'; 
COMMENT ON COLUMN vehiculoFuncional.marca IS 'Marca del auto'; 
COMMENT ON COLUMN vehiculoFuncional.modelo IS 'Modelo del auto'; 
COMMENT ON COLUMN vehiculoFuncional.anio IS 'Año del auto'; 
COMMENT ON COLUMN vehiculoFuncional.pasajeros IS 'Número de pasajeros que pueden abordar el auto'; 
COMMENT ON COLUMN vehiculoFuncional.energia IS 'Tipo de energía del auto'; 
COMMENT ON COLUMN vehiculoFuncional.transmision IS 'Tipo de transmision del auto'; 
COMMENT ON COLUMN vehiculoFuncional.llantaRef IS 'Sí el auto tiene llanta de refaciión'; 
COMMENT ON COLUMN vehiculoFuncional.tipoSeguro IS 'Tipo de seguro que posee el auto'; 
COMMENT ON COLUMN vehiculoFuncional.vigencia IS 'Vigencia del auto'; 

CREATE TABLE vehiculoBaja(
	nEconomico INT NOT NULL CHECK(nEconomico > 0) UNIQUE,
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8),
	puertas INT NOT NULL CHECK(puertas BETWEEN 2 AND 6),
	cilindros INT NOT NULL CHECK(cilindros BETWEEN 4 AND 12),
	marca VARCHAR(60) NOT NULL CHECK(MARCA <> ''),
	modelo VARCHAR(60) NOT NULL CHECK(modelo <> ''),
	anio DATE NOT NULL CHECK(anio >= '1990-01-01'),
	pasajeros INT NOT NULL CHECK(pasajeros BETWEEN 2 AND 8),
	energia VARCHAR(20) NOT NULL CHECK(energia <> ''),
	transmision VARCHAR(20) NOT NULL CHECK(transmision <> ''),
	llantaRef BOOLEAN NOT NULL,
	razon VARCHAR(500) NOT NULL CHECK(razon <> '')
);
COMMENT ON TABLE vehiculoBaja IS 'Tabla que contiene a los vehículos dados de baja en la asociación';
COMMENT ON COLUMN vehiculoBaja.nEconomico IS 'Número de registro del auto en la asociación'; 
COMMENT ON COLUMN vehiculoBaja.licencia IS 'Número de licencia de los trabajadores'; 
COMMENT ON COLUMN vehiculoBaja.puertas IS 'Número de puertas del vehículo'; 
COMMENT ON COLUMN vehiculoBaja.cilindros IS 'Número de cilindros del vehículo'; 
COMMENT ON COLUMN vehiculoBaja.marca IS 'Marca del auto'; 
COMMENT ON COLUMN vehiculoBaja.modelo IS 'Modelo del auto'; 
COMMENT ON COLUMN vehiculoBaja.anio IS 'Año del auto'; 
COMMENT ON COLUMN vehiculoBaja.pasajeros IS 'Número de pasajeros que pueden abordar el auto'; 
COMMENT ON COLUMN vehiculoBaja.energia IS 'Tipo de energía del auto'; 
COMMENT ON COLUMN vehiculoBaja.transmision IS 'Tipo de transmision del auto'; 
COMMENT ON COLUMN vehiculoBaja.llantaRef IS 'Sí el auto tiene llanta de refaciión'; 
COMMENT ON COLUMN vehiculoBaja.razon IS 'Razón por la que el auto se dió de baja'; 

CREATE TABLE viaje(
	numViaje INT NOT NULL CHECK(numViaje > 0) UNIQUE,
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8),
	nEconomico INT NOT NULL CHECK(nEconomico > 0),
	fecha DATE NOT NULL CHECK(fecha >= '2022-01-01'),
	nPersonas INT NOT NULL CHECK(nPersonas BETWEEN 1 AND 8),
	tiempo VARCHAR(15) NOT NULL CHECK(tiempo <> ''),
	distancia VARCHAR(15) NOT NULL CHECK(distancia <> ''),
	monto INT NOT NULL CHECK(monto >= 20)
);
COMMENT ON TABLE viaje IS 'Tabla que contiene la información de los viajes hechos por los pasajeros';
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
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8),
	alcaldia VARCHAR(30) NOT NULL CHECK(alcaldia <> ''),
	calle VARCHAR(80) NOT NULL CHECK(calle <> ''),
	cp INT NOT NULL,
	fecha DATE NOT NULL CHECK(fecha >= '2021-01-01'),
	monto INT NOT NULL CHECK(monto > 100),
	agente VARCHAR(80) NOT NULL CHECK(agente <> ''),
	hora TIME NOT NULL
);
COMMENT ON TABLE infraccion IS 'Tabla que contiene las infracciones de los vehículos dados de alta';
COMMENT ON COLUMN infraccion.nEconomico IS 'Número económico del auto';
COMMENT ON COLUMN infraccion.numInfraccion IS 'Número de infracción del auto';
COMMENT ON COLUMN infraccion.licencia IS 'Número de licencia del conductor';
COMMENT ON COLUMN infraccion.alcaldia IS 'Alcaldía dónde se cometió la infracción';
COMMENT ON COLUMN infraccion.calle IS 'Calle dónde se cometió la infracción';
COMMENT ON COLUMN infraccion.cp IS 'Código postal dónde se cometió la infracción';
COMMENT ON COLUMN infraccion.fecha IS 'Fecha cuando se cometió la infracción';
COMMENT ON COLUMN infraccion.monto IS 'Monto de la infracción';
COMMENT ON COLUMN infraccion.agente IS 'Agente que realizó la multa';
COMMENT ON COLUMN infraccion.hora IS 'Hora de la infracción';

CREATE TABLE manejar(
	licencia CHAR(8) NOT NULL CHECK(CHAR_LENGTH(licencia) = 8),
	nEconomico INT NOT NULL CHECK(nEconomico > 0)
);
COMMENT ON TABLE manejar IS 'Tabla de los chóferes que manejan los taxis';
COMMENT ON COLUMN manejar.licencia IS 'Licencia del conductor';
COMMENT ON COLUMN manejar.nEconomico IS 'Número económico del auto';

CREATE TABLE solicitar(
	correo VARCHAR(50) NOT NULL CHECK(correo <> ''),
	numViaje INT NOT NULL CHECK(numViaje > 0),
	costo INT NOT NULL CHECK(costo >= 10)
);
COMMENT ON TABLE solicitar IS 'Tabla que relaciona los viajes que han hechos los clientes';
COMMENT ON COLUMN solicitar.correo IS 'Correo del cliente';
COMMENT ON COLUMN solicitar.numViaje IS 'Número de viaje asociado.';
COMMENT ON COLUMN solicitar.costo IS 'Costo del viaje para el cliente';

--TrabajadorCompania
ALTER TABLE trabajadorCompania ADD CONSTRAINT trabajadorCompania_pkey PRIMARY KEY(licencia); 

--Academico, Alumno y Trabajador
ALTER TABLE academico ADD CONSTRAINT academico_pkey PRIMARY KEY(correo);
ALTER TABLE alumno ADD CONSTRAINT alumno_pkey PRIMARY KEY(correo);
ALTER TABLE trabajador ADD CONSTRAINT trabajador_pkey PRIMARY KEY(correo);

--Aseguradora
ALTER TABLE aseguradora ADD CONSTRAINT aseguradora_pkey PRIMARY KEY(nombre);

--VehiculoFuncional
ALTER TABLE vehiculoFuncional ADD CONSTRAINT vehiculoFuncional_pkey PRIMARY KEY(nEconomico);
ALTER TABLE vehiculoFuncional ADD CONSTRAINT vehiculoFuncional_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vehiculoFuncional ADD CONSTRAINT vehiculoFuncional_fkey2 FOREIGN KEY(nombre) REFERENCES aseguradora
ON UPDATE CASCADE ON DELETE CASCADE;

--VehiculoBaja
ALTER TABLE vehiculoBaja ADD CONSTRAINT vehiculoBaja_pkey PRIMARY KEY(nEconomico);
ALTER TABLE vehiculoBaja ADD CONSTRAINT vehiculoBaja_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;

--Viaje
ALTER TABLE viaje ADD CONSTRAINT viaje_pkey PRIMARY KEY(numViaje);
ALTER TABLE viaje ADD CONSTRAINT viaje_fkey FOREIGN KEY(licencia) REFERENCES trabajadorCompania
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE viaje ADD CONSTRAINT viaje_fkey2 FOREIGN KEY(nEconomico) REFERENCES vehiculoFuncional
ON UPDATE CASCADE ON DELETE CASCADE;

--Origen 
ALTER TABLE origen ADD CONSTRAINT origen_pkey PRIMARY KEY(numViaje, lugarOrigen, horaOrigen);

--Destino
ALTER TABLE destino ADD CONSTRAINT destino_pkey PRIMARY KEY(numViaje, lugarDestino, horaDestino);


--TERMINAR TODAS LAS LLAVES Y CAMBIAR LAS COSAS

