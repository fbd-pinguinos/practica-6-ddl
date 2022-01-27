-- Procedimientos

-- Procedimiento que agrega un cliente.
CREATE OR REPLACE PROCEDURE nuevo_cliente(correo varchar, institucion varchar, telCasa char, celular char, nombre varchar, apPaterno varchar, apMaterno varchar, fotografia varchar, estado varchar, municipio varchar, colonia varchar, calle varchar, numero int, horaEntrada time, horaSalida time, ocupacion varchar, cp int)
AS $$
begin
	insert into dirCliente
	values(estado, municipio, colonia, calle, numero, cp);
	insert into cliente 
	values(correo, institucion, telCasa, celular, nombre, apPaterno, apMaterno, fotografia, estado, municipio, colonia, calle, numero, horaEntrada, horaSalida, ocupacion );
END;
$$
LANGUAGE plpgsql;

-- Probamos el procedimiento nuevo_cliente.
CALL nuevo_cliente('ejemplo@guardian.co.uk','Centro de Investigaciones sobre América Latina y el Caribe (CIALC)','8663573016','8408194939','Rebeca','Camara','Tapia','Rebeca.jpg','Nayarit','La Yesca','El Capulin','Valentín Gómez Farías',7566, '11:54', '17:20','Académico', 20000);
select * from cliente where correo = 'ejemplo@guardian.co.uk';


-- Procedimiento que agrega un trabajador.
CREATE OR REPLACE PROCEDURE nuevo_trabajadorCompania(licencia char, correo varchar, celular char, nombre varchar, apPaterno varchar, apMaterno varchar, fotografia varchar, fechaIngreso date, fechaSalida date, estado varchar, municipio varchar, colonia varchar, calle varchar, numero int, rfc char, esDuenio boolean, esChofer boolean, cp int)
AS $$
begin
	insert into dirTrabajadorCompania
	values(estado, municipio, colonia, calle, numero, cp);
	insert into trabajadorCompania 
	values(licencia, correo, celular, nombre, apPaterno, apMaterno, fotografia, fechaIngreso, fechaSalida, estado, municipio, colonia, calle, numero, rfc, esDuenio, esChofer);
END;
$$
LANGUAGE plpgsql;

-- Probamos el procedimiento nuevo_cliente.
CALL nuevo_trabajadorCompania('R12345678','bvickd@themeforest.net','7628769906','Olimpio','Manuel','Frausto','Olimpio.jpg','2015-07-22','2017-07-25','Yucatán','Teabo','El Ejemplo LMAO','De Amaquixtle',5036,'DUKU039649FV',false,true, 20020);
select * from trabajadorCompania where licencia = 'R12345678';


-- Procedimiento que agrega un nuevo vehiculo.
CREATE OR REPLACE PROCEDURE nuevo_vehiculo(nEconomico int, licencia char, cilindros int, modelo varchar, anio char, energia varchar, transmision varchar, llantaRef boolean, marca varchar, puertas char, pasajeros int)
AS $$
begin
	insert into marca values(modelo, marca);
	insert into capacidadCoche values(modelo, anio, puertas, pasajeros);
	insert into vehiculo 
	values(nEconómico, licencia, null, cilindros, modelo, anio, energia, transmision, llantaRef, true, null, null, null);
END;
$$
LANGUAGE plpgsql;


-- Procedimiento que da de baja un vehiculo.
CREATE OR REPLACE PROCEDURE baja_vehiculo(n varchar, r varchar)
AS $$
begin
	update vehiculo set razon = r, funcional = false where nEconomico = n;
END;
$$
LANGUAGE plpgsql;


-- Procedimiento que agrega una nueva tupla a manejar.
CREATE OR REPLACE PROCEDURE nuevo_manejar(licencia char, nEconomico int)
AS $$
begin
	insert into manejar values(licencia, nEconomico);
END;
$$
LANGUAGE plpgsql;


-- Procedimiento que agrega un nuevo seguro a un vehiculo.
CREATE OR REPLACE PROCEDURE nuevo_seguro(n varchar, ne int, t varchar, v date)
AS $$
begin
	insert into aseguradora values(n);
	update vehiculo set nombre = n, tipoSeguro = t, vigencia = v where nEconomico = ne;
END;
$$
LANGUAGE plpgsql;


-- Procedimiento que agrega una nueva infracción.
CREATE OR REPLACE PROCEDURE nuevo_infracción(nEconomico int, numInfraccion int, licencia char, calle varchar, cp int, fecha date, monto int, agente varchar, hora time, alcaldia varchar)
AS $$
begin
	insert into delegacion values(cp, alcaldia);
	insert into infraccion values(nEconomico, numInfraccion, licencia, calle, cp, fecha, monto, agente, hora);
END;
$$
LANGUAGE plpgsql;
