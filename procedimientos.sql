-- Procedimientos

-- Procedimiento que da de baja un vehiculo.
delimiter //
create or replace procedure bajaVehiculo( int , varchar ) as
$$
declare
	n int := $1;
	r varchar := $2;
begin
	update vehiculo 
	set operando = false, razon = r 
	where nEconomico = n;
end;
$$
language plpgsql//
delimiter;

call bajaVehiculo(2, 'Dueño se salió de la compañia');


create or replace procedure hola() as
begin
end;


call hola()
