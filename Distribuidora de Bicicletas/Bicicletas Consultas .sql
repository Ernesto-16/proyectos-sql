USE Distribuidora_bicicletas;
#1
select * from BICICLETA;
#2
select nombre ,rfc_cliente from CLIENTE;
#3
select nombre,rfc from EMPLEADO;
#4
select * from BICICLETA where tipo ="Montaña";
#5
select * from VENTA where fecha_venta="2025-06-01";
#6
select num_emp, SUM(precio_cobrado) as total_ventas  from VENTA 
group by num_emp; 
#7
select distinct  BICICLETA.modelo
from BICICLETA
join VENTA on BICICLETA.num_serie = VENTA.num_serie;

#8
select VENTA.num_venta, CLIENTE.nombre as cliente, EMPLEADO.nombre as empleado, VENTA.precio_cobrado
from VENTA
join CLIENTE on VENTA.num_cliente = CLIENTE.num_cliente
join EMPLEADO on VENTA.num_emp = EMPLEADO.num_emp;
#9
select metodo_pago, SUM(precio_cobrado) as total_recaudado
from VENTA
group by metodo_pago;
#10
SELECT BICICLETA.*
FROM BICICLETA
LEFT JOIN VENTA ON BICICLETA.num_serie = VENTA.num_serie
WHERE VENTA.num_serie IS NULL;

#11
SELECT CLIENTE.nombre, VENTA.precio_cobrado
FROM VENTA
JOIN CLIENTE ON VENTA.num_cliente = CLIENTE.num_cliente
ORDER BY precio_cobrado DESC
LIMIT 1;
#12
SELECT ACCESORIO.nombre, SUM(ACCESORIO_VENTA.cantidad) AS total_vendido, SUM(ACCESORIO.precio * ACCESORIO_VENTA.cantidad) AS total_generado
FROM ACCESORIO_VENTA
JOIN ACCESORIO ON ACCESORIO_VENTA.id_accesorio = ACCESORIO.id_accesorio
WHERE ACCESORIO.tipo = 'Adicional'
GROUP BY ACCESORIO.nombre;
