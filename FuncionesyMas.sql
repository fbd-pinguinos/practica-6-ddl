-- Funciones

--Funcion que devuelve el número de trabajadores de la compañia que son choferes.
CREATE OR REPLACE FUNCTION numChoferes()
RETURNS NUMERIC
AS $$
DECLARE
 	n numeric := 0;
	fila viaje%rowtype;
BEGIN 
	FOR fila IN SELECT COUNT(esChofer) FROM trabajadorCompania WHERE esChofer = true;
		LOOP
			n := n + 1;
		END LOOP
		RETURN n;
END;
$$
LANGUAGE plpgsql;