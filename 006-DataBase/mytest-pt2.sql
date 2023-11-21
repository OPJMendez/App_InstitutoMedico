CREATE TABLE datos_terceros (
    id_tercero SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tipo_documento CHAR(2),
    FOREIGN KEY (fk_tipo_documento)
        REFERENCES `vista_tipo_documento` (id_detalle),
    numero_identificacion VARCHAR(10) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    razon_social VARCHAR(100),
    direccion VARCHAR(100),
    fk_estado CHAR(2),
    FOREIGN KEY (fk_estado)
        REFERENCES `vista_estado` (id_detalle),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_tercero)
);

CREATE TABLE telefono (
    id_telefono SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_tipo_contacto CHAR(2) NOT NULL,
    FOREIGN KEY (fk_tipo_contacto)
        REFERENCES `vista_tipoContacto` (id_detalle),
    fk_prioridad CHAR(2) NOT NULL,
    FOREIGN KEY (fk_prioridad)
        REFERENCES `vista_prioridad` (id_detalle),
    PRIMARY KEY (id_telefono)
);
CREATE TABLE correo (
    id_correo SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_tipo_correo CHAR(2) NOT NULL,
    FOREIGN KEY (fk_tipo_contacto)
        REFERENCES `vista_tipoCorreo` (id_detalle),
    fk_prioridad CHAR(2) NOT NULL,
    FOREIGN KEY (fk_prioridad)
        REFERENCES `vista_prioridad` (id_detalle),
    PRIMARY KEY (id_correo)
);
CREATE TABLE especialidad (
    id_especialidad TINYINT UNSIGNED,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_especialidad)
);

CREATE TABLE medico (
    id_medico TINYINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_especialidad TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_especialidad)
        REFERENCES `especialidad` (id_especialidad),
    fk_genero CHAR(2) NOT NULL,
    FOREIGN KEY (fk_id_especialidad)
        REFERENCES `especialidad` (id_especialidad),
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY (id_medico)
);

CREATE TABLE eps (
    id_eps TINYINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    PRIMARY KEY (id_eps)
);

CREATE TABLE paciente (
    id_paciente SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_id_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_genero CHAR(2) NOT NULL,
    FOREIGN KEY (fk_id_especialidad)
        REFERENCES `especialidad` (id_especialidad),
    fecha_nacimiento DATE NOT NULL,
    fk_eps TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_eps)
        REFERENCES `eps` (id_eps),
    PRIMARY KEY (id_paciente)
);

CREATE TABLE cita (
    id_cita MEDIUMINT UNSIGNED AUTO_INCREMENT,
    fk_paciente SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_paciente)
        REFERENCES `paciente` (id_paciente),
    fk_especialidad TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_especialidad)
        REFERENCES `especialidad` (id_especialidad),
    fk_medico TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_medico)
        REFERENCES `medico` (id_medico),
    valoracion_medica TEXT,
    comentarios_paciente TEXT,
    fecha_cita TIMESTAMP,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_cita)
);

SELECT * FROM detalle;
SELECT * FROM encabezado;
SELECT * FROM vista_estado;
SELECT * FROM vista_genero;
SELECT * FROM vista_tipo_documento;