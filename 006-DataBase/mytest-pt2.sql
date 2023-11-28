CREATE TABLE datos_terceros (
    id_tercero SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tipoDocumento CHAR(2),
    FOREIGN KEY (fk_tipoDocumento)
        REFERENCES `detalle` (pk_id_detalle),
    numero_identificacion VARCHAR(12) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    razon_social VARCHAR(100),
    direccion VARCHAR(100),
    fk_estado CHAR(2),
    FOREIGN KEY (fk_estado)
        REFERENCES `detalle` (pk_id_detalle),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_tercero)
);

CREATE TABLE usuario (
    id_usuario SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    contraseña VARCHAR(12) NOT NULL,
    fk_rol CHAR(2) NOT NULL,
    FOREIGN KEY (fk_rol)
        REFERENCES detalle (pk_id_detalle),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario)
);

CREATE TABLE telefono (
    id_telefono SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_tipo_contacto CHAR(2) NOT NULL,
    FOREIGN KEY (fk_tipo_contacto)
        REFERENCES `detalle` (pk_id_detalle),
    fk_prioridad CHAR(2) NOT NULL,
    FOREIGN KEY (fk_prioridad)
        REFERENCES `detalle` (pk_id_detalle),
    PRIMARY KEY (id_telefono)
);

CREATE TABLE correo (
    id_correo SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_tipo_correo CHAR(2) NOT NULL,
    FOREIGN KEY (fk_tipo_correo)
        REFERENCES `detalle` (pk_id_detalle),
    fk_prioridad CHAR(2) NOT NULL,
    FOREIGN KEY (fk_prioridad)
        REFERENCES `detalle` (pk_id_detalle),
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
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_especialidad TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_especialidad)
        REFERENCES `especialidad` (id_especialidad),
    fk_genero CHAR(2) NOT NULL,
    FOREIGN KEY (fk_genero)
        REFERENCES `detalle` (pk_id_detalle),
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY (id_medico)
);

CREATE TABLE entidad_medica (
    id_entidad TINYINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_tipo_entidad CHAR(2) NOT NULL,
    FOREIGN KEY (fk_tipo_entidad)
        REFERENCES `detalle` (pk_id_detalle),
    PRIMARY KEY (id_entidad)
);

CREATE TABLE paciente (
    id_paciente SMALLINT UNSIGNED AUTO_INCREMENT,
    fk_tercero SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_tercero)
        REFERENCES `datos_terceros` (id_tercero),
    fk_genero CHAR(2) NOT NULL,
    FOREIGN KEY (fk_genero)
        REFERENCES `detalle` (pk_id_detalle),
    fecha_nacimiento DATE NOT NULL,
    fk_entidad TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (fk_entidad)
        REFERENCES `entidad_medica` (id_entidad),
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