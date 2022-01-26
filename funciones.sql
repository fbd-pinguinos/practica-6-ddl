-- Funciones

--Funcion que devuelve el número de trabajadores de la compañia que son choferes.
CREATE OR REPLACE FUNCTION numChoferes()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila trabajadorCompania%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM trabajadorCompania
		loop
			if fila.esChofer then
				n := n + 1;
			end if;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numChoferes.
select numChoferes();


-- Función que devuelve el número de vehículos funcionales en la compañía.
CREATE OR REPLACE FUNCTION numVehiculosFuncionales()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila vehiculo%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM vehiculo
		loop
			if fila.operando then
				n := n + 1;
			end if;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numVehiculosFuncionales
select numVehiculosFuncionales();


-- Función que devuelve el número de clientes.
CREATE OR REPLACE FUNCTION numClientes()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila cliente%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM cliente
		loop
			n := n + 1;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numClientes.
select numClientes();


-- Función que devuelve el número total de alumnos que son clientes.
CREATE OR REPLACE FUNCTION numAlumnos()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila cliente%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM cliente where (ocupacion = 'Alumno')
		loop
			n := n + 1;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numAlumnos.
select numAlumnos();


-- Función que devuelve el número de total de académicos que son clientes.
CREATE OR REPLACE FUNCTION numAcademico()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila cliente%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM cliente where (ocupacion = 'Académico')
		loop
			n := n + 1;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numAcademico.
select numAcademico();


-- Función que devuelve el número de total de trabajadores que son clientes.
CREATE OR REPLACE FUNCTION numTrabajadores()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila cliente%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM cliente where (ocupacion = 'Trabajador')
		loop
			n := n + 1;
		END loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función numTrabajadores.
select numTrabajadores();


-- Función que devuelve el porcentaje de clientes que tienen la ocupación indicada como parámetro.
CREATE OR REPLACE FUNCTION porcentajeClientes( VARCHAR )
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
 	m numeric := 0;
	fila cliente%rowtype;
BEGIN 
	FOR fila IN SELECT * FROM cliente
		loop
		m := m + 1;
		if (fila.ocupacion = $1) then
			n := n + 1;
		end if;
		END loop;
	if (m = 0) then
		raise notice 'No hay clientes registrados en la base de datos.';
	end if;
	RETURN n * 100 / m;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función porcentajeClientes.
select porcentajeClientes('Académico');


-- Funación que nos dice sí un cliente lleva 5 viajes consecutivos.
CREATE OR REPLACE FUNCTION sextoViaje( VARCHAR )
RETURNS boolean
AS $$
DECLARE
 	n boolean;
 	m numeric;
BEGIN 
	m = count(numviaje) from solicitar natural join viaje where correo = $1;
	RETURN m % 6 = 5;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función sextoViaje.
select sextoviaje('jkirkhouse71@lulu.com');


-- Función que nos dice el número de viajes que ha realizado un chofer a partir de cierta fecha dada.
CREATE OR REPLACE FUNCTION viajesChofer(VARCHAR, date)
RETURNS numeric
AS $$
DECLARE
 	m numeric;
BEGIN 
	m = count(numviaje) from solicitar natural join viaje where licencia = $1 and fecha > $2;
	RETURN m;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función viajesChofer.
select viajesChofer('A24724662', date '2022-01-05');


-- Función que nos dice si un chofer va a recibir bono, es decir realizó más de 25 viajes el último mes.
CREATE OR REPLACE FUNCTION obtieneBono( VARCHAR )
RETURNS boolean
AS $$
DECLARE
 	n boolean;
 	m numeric;
BEGIN 
	m = viajesChofer($1, current_date - 30);
	RETURN m > 25;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función obtieneBono.
select obtieneBono('K09139332');


-- Funcion que nos devuelve la ganancia del último mes de un chofer.
CREATE OR REPLACE FUNCTION gananciaChofer( VARCHAR )
RETURNS real
AS $$
DECLARE
 	ganancia real := 0;
 	fila viaje%rowtype;
 	mes date := current_date - 30;
BEGIN 
	for fila in select * from viaje where licencia = $1 and fecha > mes
		loop
		if dentroCU(fila.numViaje)
		then ganancia := ganancia + (fila.monto * .08);
		else ganancia := ganancia + (fila.monto * .12);
		end if;
		end loop;
	if obtieneBono($1) then
		ganancia := ganancia * 1.1;
	end if;
	RETURN ganancia;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función gananciaChofer.
select gananciaChofer('K09139332');


-- Función que nos dice si un viaje fue dentro de CU.
CREATE OR REPLACE FUNCTION dentroCU( int )
RETURNS boolean
AS $$
DECLARE
 	n boolean := true;
 	fila origen%rowtype;
 	fila2 destino%rowtype;
BEGIN 
	for fila in select * from origen where numviaje = $1
		loop
		n = n and (fila.lugarorigen = 'CU');
		end loop;
	for fila2 in select * from destino where numviaje = $1
		loop
		n = n and (fila2.lugardestino = 'CU');
		end loop;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función dentroCU.
select dentroCU(350);


-- Función para calcular el cobro de un viaje a un cliente.
CREATE OR REPLACE FUNCTION cobroCliente( VARCHAR, int, boolean, real )
RETURNS real
AS $$
DECLARE
 	cobro real := 0;
 	cl varchar := $1;
 	npersonas int := $2;
 	dentroCU boolean := $3;
 	distancia real := $4;
 	tipoCliente varchar := ocupacion from cliente where correo = cl;
	sextoViaje boolean := sextoViaje(cl);
	costoKilometro int;
begin
	if sextoViaje then 
		cobro := 15;
		costoKilometro := 8;
	else cobro := 20;
		 costoKilometro := 10;
	end if;
	if (not dentroCU) then
		cobro := cobro + (distancia * costoKilometro);
	end if;
	cobro := cobro * (1 - (npersonas-1)*.08);
	if tipoCliente = 'Alumno' then
		cobro := cobro * .85;
	else cobro := corbo * .9;
	end if;
	RETURN cobro;
END;
$$
LANGUAGE plpgsql;

-- Probamos la función cobroCliente.
select cobroCliente('mjailler6t@tamu.edu', 2, false, 25.7);


-- Función que devuelve el número de viaje máximo:
CREATE OR REPLACE FUNCTION numViajeMax()
RETURNS int
AS $$
DECLARE
 	n int;
BEGIN 
	n = max(numviaje) from viaje;
	RETURN n;
END;
$$
LANGUAGE plpgsql;

-- Proamos la función numViajeMax.
select numViajeMax();