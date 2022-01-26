-- Disparadores
	
-- Función para el siguiente disparador.
-- Sí se fuera a ingresar un trabajadros que no es chofer ni es dueño lanza una excepción.
create or replace function check_chofer_o_duenio() returns trigger
as
$$
begin
   if(not (new.esChofer or new.esDuenio)) then
      raise exception 'Todos los trabajadores tienen que ser choferes o dueños.';
   end if;
   return new;
end;
$$
language plpgsql;

--Creamos el disparador.
create trigger chofer_o_duenio
before insert or update on trabajadorCompania
for each row
execute procedure check_chofer_o_duenio();

-- Probamos el disparador.
insert into trabajadorCompania values('N14795625', 'dem@ciencias.unam', '5523044116', 'Demian Alejandro', 
										'Monterrubio', 'Acosta', 'foto.jgp', '1990-01-01', '1990-01-01', 
										'CDMX', 'Xochimilco', 'Bosques del Sur', 'Bosque del sauce', 4, 
										'123456789012', false, false);


-- Función para el siguiente disparador.
-- Función que evita poder meter clientes que no son trabajadores, ni choferes, ni académicos.
create or replace function check_tipo_cliente() returns trigger
as
$$
declare
	tipo varchar := new.ocupacion;
begin
   if(tipo <> 'Alumno' and tipo <> 'Trabajador' and tipo <> 'Académico') then
      raise exception 'Todos los clientes tienen que ser alumnos, trabajadores o académicos.';
   end if;
   return new;
end;
$$
language plpgsql;

--Creamos el disparador.
create trigger tipo_cliente
before insert or update on cliente
for each row
execute procedure check_tipo_cliente();

-- Probamos el disparador.
insert into cliente values('dem@ciencias.unam', 'Facultad de Ciencias', '56531363', '5523044116',
							'Demian Alejandro', 'Monterrubio', 'Acosta', 'foto.jgp', 'CDMX', 'Xochimilco',
							'Bosques del Sur', 'Bosque del sauce', 4, null, null, 'nini');


-- Función para el siguiente disparador.
-- Cada vez que se ingresa o actualiza la tabla de trabajadorCompania muestra el número de trabajadores.
create or replace function muestra_trabajadores() returns trigger
as
$$
begin
	raise notice 'Número de trabajadores: %', numCompania();
	return new;
end;
$$
language plpgsql;

--Creamos el disparador.
create trigger actualiza_trabajadores_compania
after insert or update on trabajadorCompania
for each row
execute procedure muestra_trabajadores();

-- Probamos el disparador.
update trabajadorCompania set esChofer = false where licencia = 'C01935182';


-- Función para el siguiente disparador.
-- Cada vez que se intenta borrar una fila de la tabla vehiculos lanza un error.
create or replace function no_borrar_vehiculos() returns trigger 
as 
$$
begin
	raise exception 'Los vehiculos no se deben borrar, se deben dar de baja.';
end;
$$
language plpgsql;

-- Creamos el disparador.
create trigger evita_borrados
before delete on vehiculo
for each row
execute procedure no_borrar_vehiculos();

-- Probamos el dosparador.
delete from vehiculo where nEconomico = 106;


-- Función para el siguiente disparador.
-- Se asegura que sí un vehiculo no tiene el nombre de su seguro, entonces tampoco tenga tipo ni vigencia.
-- Y si sí tiene nombre del seguro se asegura que tenga tipo y vigencia
create or replace function no_seguro() returns trigger 
as 
$$
begin
	if (new.nombre is null) then
		if ( not (new.tipoSeguro is null) or not (new.vigencia is null)) then 
			raise exception 'Falta ingresar el nombre del seguro.';
		end if;
	elsif (new.tipoSeguro is null or new.vigencia is null) then
		raise exception 'Falta ingresar el tipo o vigencia del seguro.';
	else
		return new;
	end if;
	return new;
end;
$$
language plpgsql;

-- Creamos el disparador.
create trigger consistencia_seguro
before insert or update on vehiculo
for each row
execute procedure no_seguro();

-- Probamos el dosparador.
update vehiculo set nombre = null where nEconomico = 106;


-- Función para el siguiente disparador.
-- Se asegura que a un vehiculo no se le pueda asignar un seguro con fecha de vencimiento vencida.
create or replace function vigencia_correcta() returns trigger 
as 
$$
begin
	if (new.vigencia <= current_date) then 
		raise exception 'No se puede ingresar una vigencia caduca.';
	end if;
	return new;
end;
$$
language plpgsql;

-- Creamos el disparador.
create trigger consistencia_vigencia
before insert or update on vehiculo
for each row
execute procedure vigencia_correcta();

-- Probamos el dosparador.
update vehiculo set vigencia = current_date where nEconomico = 107;


-- Función para el siguiente disparador.
-- Función que evita poder meter vehiculos que no tengan energía Híbrido o Gasolina.
create or replace function check_energia() returns trigger
as
$$
declare
	e varchar := new.energia;
begin
	if(not (e = 'Híbrido' or e = 'Gasolina')) then
      raise exception 'Solo hay autos con energía Híbrido o Gasolina.';
   	end if;
	return new;
end;
$$
language plpgsql;

--Creamos el disparador.
create trigger tipo_energia
before insert or update on vehiculo
for each row
execute procedure check_energia();

-- Probamos el disparador.
update vehiculo set energia = 'Amor' where nEconomico = 2;


-- Función para el siguiente disparador.
-- Función que evita poder meter vehiculos que no tengan transmisión Estándar o Automático.
create or replace function check_transmision() returns trigger
as
$$
declare
	t varchar := new.transmision;
begin
	if(t <> 'Estándar' and t <> 'Automático') then
      raise exception 'Solo hay autos con transmision Estándar o Automático.';
   	end if;
	return new;
end;
$$
language plpgsql;

--Creamos el disparador.
create trigger tipo_transmision
before insert or update on vehiculo
for each row
execute procedure check_transmision();

-- Probamos el disparador.
update vehiculo set transmision = 'Telepatía' where nEconomico = 2;


-- Función para el siguiente disparador.
-- Se asegura que la fecha de ingreso de un trabajador de la compañia sea menor a la fecha de salida.
create or replace function revisa_fechas() returns trigger
as 
$$
begin
	if (new.fechaSalida is null) then
		return new;
	end if;
	if (new.fechaIngreso > new.fechaSalida) then 
		raise exception 'Las fechas no son consistentes.';
	end if;
	return new;
end;
$$
language plpgsql;

-- Creamos el disparador.
create trigger consistencia_fechas
before insert or update on trabajadorCompania
for each row
execute procedure revisa_fechas();

-- Probamos el dosparador.
update trabajadorCompania set fechaIngreso = current_date, fechaSalida = current_date-1 where licencia = 'T69885176';
