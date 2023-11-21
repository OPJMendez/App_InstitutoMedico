CREATE TABLE tabla_encabezado (
    id_encabezado CHAR(1),
    descripcion VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_encabezado)
);

insert into tabla_encabezado
values('1','Estado');

CREATE TABLE tabla_detalle (
    id_detalle CHAR(1),
    valor VARCHAR(20) NOT NULL,
    fk_id_encabezado CHAR(1) NOT NULL,
    FOREIGN KEY (fk_id_encabezado)
        REFERENCES `tabla_encabezado` (id_encabezado),
    PRIMARY KEY (id_detalle)
);

insert into tabla_detalle
values('1','Activo','1');


Activo
Inactivo
En Espera
Atendida
Cancelada
Pospuesta

Masculino - M
Femenino - F

Cédula de Ciudadanía - CC
Tarjeta de Identidad - TI
Registro Civil - RC
Cédula de Extranjería - CE
Carné de Identidad - CI
Documento Nacional de Identidad - DNI

