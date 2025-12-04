USE gestion_proyectos_devapps;
-- Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    rfc VARCHAR(20) UNIQUE,
    nombre_empresa VARCHAR(150)
) ENGINE=InnoDB;

-- Teléfono cliente
CREATE TABLE Telefono_cliente (
    id_telefono_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo_telefono ENUM('movil','fijo','otro') DEFAULT 'otro',
    CONSTRAINT fk_tel_cliente
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Desarrollador
CREATE TABLE Desarrollador (
    id_desarrollador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    sexo ENUM('M','F','Otro'),
    nico_contrato VARCHAR(50),
    fecha_contrato DATE,
    email VARCHAR(150) UNIQUE,
    salario DECIMAL(10,2),
    estado VARCHAR(100),
    tipoDesarrollador VARCHAR(50)
) ENGINE=InnoDB;

-- Teléfono desarrollador
CREATE TABLE Telefono_desarrollador (
    id_telefono_desarrollador INT AUTO_INCREMENT PRIMARY KEY,
    id_desarrollador INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo_telefono ENUM('movil','fijo','otro') DEFAULT 'otro',
    CONSTRAINT fk_tel_dev
        FOREIGN KEY (id_desarrollador) REFERENCES Desarrollador(id_desarrollador)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Proyecto
CREATE TABLE Proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE,
    fecha_entrega DATE,
    costo DECIMAL(12,2),
    estado ENUM('planificado','en_progreso','finalizado','cancelado') DEFAULT 'planificado',
    nombre VARCHAR(150) NOT NULL,
    tipoProyecto VARCHAR(100),
    CONSTRAINT fk_proy_cliente
        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Relación Proyecto–Desarrollador
CREATE TABLE Proyecto_desarrollador (
    id_proyecto_desa INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    id_desarrollador INT NOT NULL,
    rolDesarrollador VARCHAR(50),
    horas INT,
    CONSTRAINT fk_pd_proyecto
        FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_pd_desarrollador
        FOREIGN KEY (id_desarrollador) REFERENCES Desarrollador(id_desarrollador)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT uq_pd UNIQUE (id_proyecto, id_desarrollador)
) ENGINE=InnoDB;