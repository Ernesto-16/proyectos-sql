CREATE DATABASE Distribuidora_bicicletas;
USE Distribuidora_bicicletas;

CREATE TABLE TIENDA (
    num_tienda INT PRIMARY KEY,
    ciudad VARCHAR(50) NOT NULL,
    cp VARCHAR(10) NOT NULL
);

CREATE TABLE CLIENTE (
    num_cliente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    rfc_cliente VARCHAR(20) NOT NULL,
    correo VARCHAR(100)
);

CREATE TABLE EMPLEADO (
    num_emp INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    rfc VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    num_tienda INT,  -- Columna para relacionar al empleado con una tienda
    FOREIGN KEY (num_tienda) REFERENCES TIENDA(num_tienda)
);

CREATE TABLE BICICLETA (
    num_serie INT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL,  -- Ejemplo: montaña, ruta, urbana
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL
);


CREATE TABLE ACCESORIO (
    id_accesorio INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(20) -- "adicional" o "incluido"
);

CREATE TABLE VENTA (
    num_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,  -- Ejemplo: 'efectivo', 'tarjeta'
    precio_cobrado DECIMAL(10,2) NOT NULL,
    num_emp INT NOT NULL,
    num_cliente INT NOT NULL,
    num_serie INT NOT NULL,
    FOREIGN KEY (num_emp) REFERENCES EMPLEADO(num_emp),
    FOREIGN KEY (num_cliente) REFERENCES CLIENTE(num_cliente),
    FOREIGN KEY (num_serie) REFERENCES BICICLETA(num_serie)
);


CREATE TABLE TELEFONO_TIENDA (
    id_tel_tienda INT PRIMARY KEY,
    num_tienda INT NOT NULL,
    tipo_telefono VARCHAR(20),
    telefono VARCHAR(20),
    FOREIGN KEY (num_tienda) REFERENCES TIENDA(num_tienda)
);

CREATE TABLE TELEFONO_EMPLEADO (
    id_tel_emp INT PRIMARY KEY,
    num_emp INT NOT NULL,
    tipo_telefono VARCHAR(20),
    telefono VARCHAR(20),
    FOREIGN KEY (num_emp) REFERENCES EMPLEADO(num_emp)
);

CREATE TABLE ACCESORIO_VENTA (
    num_venta INT NOT NULL,
    id_accesorio INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (num_venta, id_accesorio),
    FOREIGN KEY (num_venta) REFERENCES VENTA(num_venta),
    FOREIGN KEY (id_accesorio) REFERENCES ACCESORIO(id_accesorio)
);

CREATE TABLE ACCESORIO_INCLUIDO (
    num_serie INT NOT NULL,
    id_accesorio INT NOT NULL,
    PRIMARY KEY (num_serie, id_accesorio),
    FOREIGN KEY (num_serie) REFERENCES BICICLETA(num_serie),
    FOREIGN KEY (id_accesorio) REFERENCES ACCESORIO(id_accesorio)
);

show tables;