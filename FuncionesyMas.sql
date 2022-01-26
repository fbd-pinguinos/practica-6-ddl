-- Funciones

--Funcion que devuelve el número de trabajadores de la compañia que son choferes.
CREATE OR REPLACE FUNCTION numChoferes()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila trabajadorCompania%rowtype;
BEGIN 
	FOR fila IN SELECT esChofer FROM trabajadorCompania
		loop
			if fila.esChofer then
				n := n + 1;
			end if;
		END loop;
		RETURN n;
END;
$$
LANGUAGE plpgsql;

select numChoferes();
