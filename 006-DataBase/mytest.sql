use my_test;

CREATE TABLE `encabezado` (
    `pk_id_encabezado` CHAR(2),
    `clave` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`pk_id_encabezado`)
);
CREATE TABLE `detalle` (
    `pk_id_detalle` CHAR(2),
    `fk_id_encabezado` CHAR(1) NOT NULL,
    FOREIGN KEY (`fk_id_encabezado`)
        REFERENCES `encabezado` (`pk_id_encabezado`),
    `valor` VARCHAR(40) NOT NULL,
    `abreviatura` VARCHAR(3),
    PRIMARY KEY (`pk_id_detalle`)
);

INSERT INTO `encabezado`
    (`pk_id_encabezado`,`clave`)
VALUES
    ('1','Estado'),
    ('2','Genero'),
    ('3','Tipo de Documento'),
    ('4','Rol'),
    ('5','Tipo de Contacto'),
    ('6','Tipo de Entidad'),
    ('7','Tipo de Correo'),
    ('8','Prioridad');

INSERT INTO detalle
    (`pk_id_detalle`,`fk_id_encabezado`,`valor`,`abreviatura`)
VALUES
    ('1','1','Activo','ACT'),
    ('2','1','Inactivo','INA'),
    ('3','1','En Espera','ESP'),
    ('4','1','Atendida','ATE'),
    ('5','1','Cancelada','CAN'),
    ('6','2','Masculino','M'),
    ('7','2','Femenino','F'),
    ('8','3','Cédula de Ciudadanía','CC'),
    ('9','3','Tarjeta de Identidad','TI'),
    ('10','3','Registro Civil','RC'),
    ('11','3','Cédula de Extranjería','CE'),
    ('12','3','Carné de Identidad','CI'),
    ('13','3','Documento Nacional de Identidad','DNI'),
    ('14','4','Medico','MD'),
    ('15','4','Paciente','PA'),
    ('16','4','Administrador','AD'),
    ('17','5','Telefono',null),
    ('18','5','Celular',null),
    ('19','6','EPS',null),
    ('20','6','IPS',null),
    ('21','7','Personal',null),
    ('22','7','Profesional',null),
    ('23','8','Alta',null),
    ('24','8','Baja',null);

SELECT 
    e.pk_id_detalle AS llavePrimaria, e.valor AS Nombre
FROM
    encabezado AS d
        INNER JOIN
    detalle AS e ON d.pk_id_encabezado = e.fk_id_encabezado