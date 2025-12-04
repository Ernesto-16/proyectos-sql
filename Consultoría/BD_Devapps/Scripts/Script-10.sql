USE gestion_proyectos_devapps;
show tables;
USE gestion_proyectos_devapps;

-- -------------------------
-- CLIENTE ()
-- -------------------------
INSERT INTO Cliente (id_cliente, nombre, apellido_paterno, apellido_materno, rfc, nombre_empresa) VALUES
(1, 'María', 'Gómez', 'López', 'GGLM890123XXX', 'Soluciones MX S.A.'),
(2, 'Carlos', 'Pérez', 'Hernández', 'PEHC750501YYY', 'Innovatek'),
(3, 'Ana', 'Ruiz', 'Soto', 'RUSA920715ZZZ', 'Ruiz & Asociados'),
(4, 'Luis', 'Fernández', 'Mora', 'FEML810912AAA', 'Mora Digital'),
(5, 'Sofía', 'Vargas', 'Ortega', 'VAGS950430BBB', 'Vargas Studio');

-- -------------------------
-- TELEFONO_CLIENTE (5) - uno por cliente
-- -------------------------
INSERT INTO Telefono_cliente (id_telefono_cliente, id_cliente, numero, tipo_telefono) VALUES
(1, 1, '5512345678', 'movil'),
(2, 2, '5556781234', 'fijo'),
(3, 3, '5522334455', 'movil'),
(4, 4, '5588776655', 'movil'),
(5, 5, '5577123456', 'fijo');




-- -------------------------
-- DESARROLLADOR (5)
-- -------------------------
INSERT INTO Desarrollador (id_desarrollador, nombre, apellido_paterno, apellido_materno, sexo, nico_contrato, fecha_contrato, email, salario, estado, tipoDesarrollador) VALUES
(1, 'Diego', 'Ramírez', 'Sánchez', 'M', 'CNT-1001', '2023-02-15', 'diego.ramirez@example.com', 35000.00, 'Estado de México', 'Backend'),
(2, 'Lucía', 'Morales', 'Vega', 'F', 'CNT-1002', '2022-08-01', 'lucia.morales@example.com', 33000.00, 'Ciudad de México', 'Frontend'),
(3, 'Javier', 'Ortiz', 'Díaz', 'M', 'CNT-1003', '2024-01-10', 'javier.ortiz@example.com', 38000.00, 'Jalisco', 'Fullstack'),
(4, 'Karen', 'Núñez', 'Reyes', 'F', 'CNT-1004', '2021-11-20', 'karen.nunez@example.com', 30000.00, 'Puebla', 'QA'),
(5, 'Miguel', 'Sánchez', 'Lara', 'M', 'CNT-1005', '2020-05-05', 'miguel.sanchez@example.com', 42000.00, 'Nuevo León', 'Arquitecto');

-- -------------------------
-- TELEFONO_DESARROLLADOR (5) - uno por desarrollador
-- -------------------------
INSERT INTO Telefono_desarrollador (id_telefono_desarrollador, id_desarrollador, numero, tipo_telefono) VALUES
(1, 1, '5511111111', 'movil'),
(2, 2, '5522222222', 'movil'),
(3, 3, '5533333333', 'movil'),
(4, 4, '5544444444', 'fijo'),
(5, 5, '5555555555', 'movil');

-- -------------------------
-- PROYECTO (5)
-- -------------------------
INSERT INTO Proyecto (id_proyecto, id_cliente, fecha_pedido, fecha_entrega, costo, estado, nombre, tipoProyecto) VALUES
(1, 1, '2024-03-01', '2024-06-30', 120000.00, 'en_progreso', 'Plataforma e-commerce', 'Web'),
(2, 2, '2024-04-15', '2024-11-30', 250000.00, 'planificado', 'App móvil B2C', 'Mobile'),
(3, 3, '2023-12-01', '2024-04-15', 90000.00, 'finalizado', 'Portal de clientes', 'Web'),
(4, 4, '2024-05-10', '2024-09-01', 60000.00, 'en_progreso', 'Integración API pagos', 'Integración'),
(5, 5, '2024-06-01', '2024-12-31', 300000.00, 'planificado', 'Suite administrativa', 'Enterprise');

-- -------------------------
-- PROYECTO_DESARROLLADOR (5) - asignaciones
-- -------------------------
INSERT INTO Proyecto_desarrollador (id_proyecto_desa, id_proyecto, id_desarrollador, rolDesarrollador, horas) VALUES
(1, 1, 1, 'Backend Lead', 320),
(2, 1, 2, 'Frontend', 280),
(3, 2, 3, 'Fullstack', 400),
(4, 4, 4, 'QA', 120),
(5, 5, 5, 'Arquitecto', 600);