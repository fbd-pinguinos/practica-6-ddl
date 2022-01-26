--Numero económico del auto, licencia del dueño y razón de los vehículos dados de baja
select nEconomico, licencia, razon from vehiculo where operando = false;

-- 10 estados con el mayor número de vehículos sin asegurar
SELECT t.estado, count(t.estado) FROM vehiculo v 
LEFT JOIN trabajadorcompania t 
ON v.licencia = t.licencia 
WHERE v.nombre IS NULL
GROUP BY t.estado
ORDER BY count(t.estado) DESC LIMIT 10;

--Información de los viajes que tiene asignados a vehículos con infracciones
SELECT a.*, c.nEconomico, numInfraccion, c.monto
FROM viaje a, vehiculo b, infraccion c
WHERE a.nEconomico = b.nEconomico AND
	  b.nEconomico = c.nEconomico;

--10 modelos de vehículos más comunes
SELECT modelo, count(modelo) FROM vehiculo 
GROUP BY modelo
ORDER BY count(modelo) DESC LIMIT 10;

--Información de los vehículos que tienen infracciones, no estén asegurados y estén operando
SELECT  a.nEconomico, a.licencia, cilindros, modelo, anio, energia, transmision, llantaRef
FROM vehiculo a, infraccion b
WHERE a.nEconomico = b.nEconomico AND
      a.operando = true AND
	  a.nombre is null;

--10 destinos con los mayores costos por viaje promedio.
SELECT d.lugardestino, AVG(v.monto) FROM destino d
LEFT JOIN viaje v 
ON d.numviaje = v.numviaje
GROUP BY d.lugardestino
ORDER BY AVG(v.monto) DESC LIMIT 10;
	  
--Ganancias de cada uno de los chóferes junto con su información
SELECT gananciaChofer(licencia), t.*  
FROM trabajadorCompania t
WHERE esChofer = true;

--Estados dónde nacieron el mayor número de trabajadores
SELECT t.estado, count(t.estado) FROM trabajadorcompania t 
GROUP BY t.estado 
ORDER BY count(t.estado) DESC LIMIT 10;

--Ganancia promedio de los chóferes
SELECT AVG(gananciaChofer(licencia))
FROM trabajadorCompania
WHERE esChofer = true;

--Número de clientes que han realizado los cinco viajes
select count(correo)
from cliente
where sextoviaje(correo) = true;

--Número de viajes que ha dado cada chófer a partir del 2022
SELECT licencia, viajesChofer(licencia, '2022-01-01')  
FROM trabajadorCompania
WHERE esChofer = true;

--10 orignes más comunes
SELECT o.lugarorigen, count(o.lugarorigen) FROM origen o
LEFT JOIN viaje v 
ON o.numviaje = v.numviaje
GROUP BY o.lugarorigen
ORDER BY count(o.lugarorigen) DESC LIMIT 10;

--10 aseguradoras y  tipo de seguro con el mayor numero de autos que están operando
SELECT v.nombre , v.tiposeguro, count(v.tiposeguro) FROM vehiculo v
WHERE v.nombre IS NOT NULL AND v.operando = TRUE 
GROUP BY v.nombre, v.tiposeguro 
ORDER BY count(v.tiposeguro) DESC LIMIT 10;

--Número de chóferes que recibirán bonos
SELECT COUNT(licencia)  
FROM trabajadorCompania
WHERE esChofer = true AND obtieneBono(licencia) = true;

--Identificación de los viajes que se realizaron dentro de CU
SELECT numViaje
FROM viaje
WHERE dentroCU(numViaje) = true;