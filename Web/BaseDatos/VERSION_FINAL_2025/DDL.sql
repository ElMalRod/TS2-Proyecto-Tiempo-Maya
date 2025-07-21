-- DDL TIEMPO MAYA
CREATE DATABASE IF NOT EXISTS tiempomaya;
USE tiempomaya;

-- Tabla: categoria
CREATE TABLE IF NOT EXISTS categoria (
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;


-- Tabla: nahual
CREATE TABLE IF NOT EXISTS nahual (
    idweb INT NOT NULL,
    iddesk INT DEFAULT NULL,
    nombre VARCHAR(20) NOT NULL,
    nombreYucateco VARCHAR(50) DEFAULT NULL,
    significado VARCHAR(100) NOT NULL,
    htmlCodigo LONGTEXT,
    categoria VARCHAR(100) NOT NULL,
    descripcion MEDIUMTEXT,
    rutaEscritorio VARCHAR(100) DEFAULT NULL,
    htmlCodigo_kq LONGTEXT,
    htmlCodigo_yu LONGTEXT,
    htmlCodigo_en LONGTEXT,
    htmlCodigo_qu LONGTEXT,

    PRIMARY KEY (idweb),
    UNIQUE KEY iddesk_UNIQUE (iddesk),
    KEY fk_nahual_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;


-- Tabla: animal_guia
CREATE TABLE IF NOT EXISTS animal_guia (
    idweb_nahual INT NOT NULL,
    animal VARCHAR(255) NOT NULL,
    PRIMARY KEY (idweb_nahual),
    FOREIGN KEY (idweb_nahual) REFERENCES nahual(idweb)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: animal_nahuatl
CREATE TABLE IF NOT EXISTS animal_nahuatl (
    id INT NOT NULL,
    nombre VARCHAR(50) COLLATE utf8mb4_general_ci NOT NULL,
    nahuatl VARCHAR(50) COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: cruz
CREATE TABLE IF NOT EXISTS cruz (
    nacimiento INT NOT NULL,
    izquierdo INT NOT NULL,
    derecho INT NOT NULL,
    destino INT NOT NULL,
    concepcion INT DEFAULT NULL,

    PRIMARY KEY (nacimiento),
    KEY idx_izquierdo (izquierdo),
    KEY idx_derecho (derecho),
    KEY idx_destino (destino),
    KEY idx_concepcion (concepcion),

    FOREIGN KEY (nacimiento) REFERENCES nahual(idweb),
    FOREIGN KEY (izquierdo) REFERENCES nahual(idweb),
    FOREIGN KEY (derecho) REFERENCES nahual(idweb),
    FOREIGN KEY (destino) REFERENCES nahual(idweb),
    FOREIGN KEY (concepcion) REFERENCES nahual(idweb)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: cruznahual
CREATE TABLE IF NOT EXISTS cruznahual (
    idCruz INT NOT NULL AUTO_INCREMENT,
    nahual VARCHAR(15) NOT NULL,
    concepcion VARCHAR(15) NOT NULL,
    derecho VARCHAR(15) NOT NULL,
    izquierdo VARCHAR(15) NOT NULL,
    destino VARCHAR(15) NOT NULL,
    descripcion LONGTEXT NOT NULL,
    categoria VARCHAR(100) NOT NULL,

    PRIMARY KEY (idCruz),
    KEY fk_cruz_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: energia
CREATE TABLE IF NOT EXISTS energia (
    id INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    significado TINYTEXT NOT NULL,
    htmlCodigo MEDIUMTEXT NOT NULL,
    nombreYucateco VARCHAR(30) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    htmlCodigo_kq LONGTEXT,
    htmlCodigo_yu LONGTEXT,
    htmlCodigo_en LONGTEXT,
    htmlCodigo_qu LONGTEXT,

    PRIMARY KEY (id),
    KEY fk_energia_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: fondos
CREATE TABLE IF NOT EXISTS fondos (
    idFondo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    momento VARCHAR(15) NOT NULL,
    ruta VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,

    PRIMARY KEY (idFondo),
    KEY fk_fondo_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;


-- Tabla: kin
CREATE TABLE IF NOT EXISTS kin (
    id INT NOT NULL,
    iddesk INT NOT NULL,
    nombre VARCHAR(25) DEFAULT NULL,
    significado VARCHAR(150) DEFAULT NULL,
    htmlCodigo MEDIUMTEXT,
    categoria VARCHAR(100) NOT NULL,
    nombreYucateco VARCHAR(25) DEFAULT NULL,
    htmlCodigo_en LONGTEXT,
    htmlCodigo_qu LONGTEXT,
    htmlCodigo_kq LONGTEXT,
    htmlCodigo_yu LONGTEXT,

    PRIMARY KEY (id),
    KEY fk_kin_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: lugar
CREATE TABLE IF NOT EXISTS lugar (
    idLugar INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion LONGTEXT NOT NULL,
    precio VARCHAR(50) NOT NULL,
    horario VARCHAR(50) NOT NULL,
    imagen VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,

    PRIMARY KEY (idLugar),
    KEY fk_turismo_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: pagina
CREATE TABLE IF NOT EXISTS pagina (
    orden INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    seccion VARCHAR(45) DEFAULT NULL,
    htmlCodigo LONGTEXT,
    htmlCodigo_en LONGTEXT,
    htmlCodigo_qu LONGTEXT,
    htmlCodigo_kq LONGTEXT,
    htmlCodigo_yu LONGTEXT,

    PRIMARY KEY (nombre, categoria),
    KEY FK_PAGINA_CATG (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: periodo
CREATE TABLE IF NOT EXISTS periodo (
    orden INT DEFAULT NULL,
    nombre VARCHAR(50) NOT NULL,
    fechaInicio VARCHAR(5) NOT NULL,
    fechaFin VARCHAR(5) NOT NULL,
    ACInicio VARCHAR(3) DEFAULT NULL,
    ACFin VARCHAR(3) DEFAULT NULL,
    descripcion VARCHAR(250) DEFAULT NULL,
    htmlCodigo LONGTEXT,
    categoria VARCHAR(100) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- Tabla: uinal
CREATE TABLE IF NOT EXISTS uinal (
    idweb INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    significado VARCHAR(75) NOT NULL,
    dias INT DEFAULT NULL,
    htmlCodigo MEDIUMTEXT,
    categoria VARCHAR(100) NOT NULL,
    iddesk INT DEFAULT NULL,
    ruta VARCHAR(100) DEFAULT NULL,
    htmlCodigo_kq LONGTEXT,
    htmlCodigo_yu LONGTEXT,
    htmlCodigo_en LONGTEXT,
    htmlCodigo_qu LONGTEXT,

    PRIMARY KEY (idweb),
    UNIQUE KEY iddesk_UNIQUE (iddesk),
    KEY fk_uinal_categoria1_idx (categoria),
    FOREIGN KEY (categoria) REFERENCES categoria(nombre)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
