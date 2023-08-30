CREATE DATABASE DB_InstitutoMedico;
USE DB_InstitutoMedico;
CREATE TABLE tbl_Sexo (
    PK_IdSexo CHAR,
    Nombre VARCHAR(20) NOT NULL,
    Abreviatura CHAR,
    PRIMARY KEY (PK_IdSexo)
);
CREATE TABLE tbl_Estado (
    PK_IdEstado CHAR,
    Nombre VARCHAR(30) NOT NULL,
    Abreviatura CHAR,
    PRIMARY KEY (PK_IdEstado)
);
CREATE TABLE tbl_Medico (
    PK_IdMedico VARCHAR(10),
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Edad INT(2) NOT NULL,
    correoElectronico VARCHAR(244) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (PK_IdMedico),
    FK_IdSexo CHAR NOT NULL,
    FK_IdEstado CHAR NOT NULL,
    FOREIGN KEY (FK_IdSexo)
        REFERENCES `tbl_Sexo` (PK_IdSexo),
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado)
);
CREATE TABLE tbl_Paciente (
    PK_IdPaciente VARCHAR(10),
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Edad INT(2) NOT NULL,
    correoElectronico VARCHAR(244) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (PK_IdPaciente),
        FK_IdSexo CHAR NOT NULL,
    FK_IdEstado CHAR NOT NULL,
    FOREIGN KEY (FK_IdSexo)
        REFERENCES `tbl_Sexo` (PK_IdSexo),
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado)
);
CREATE TABLE tbl_Cita (
    PK_IdCita BIGINT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    FK_IdPaciente VARCHAR(10) NOT NULL,
    FK_IdMedico VARCHAR(10) NOT NULL,
    FK_IdEstado CHAR NOT NULL,
    PRIMARY KEY (PK_IdCita),
    FOREIGN KEY (FK_IdPaciente)
        REFERENCES `tbl_Paciente` (PK_IdPaciente),
    FOREIGN KEY (FK_IdMedico)
        REFERENCES `tbl_Medico` (PK_IdMedico),
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado)
)  AUTO_INCREMENT = 5115;
CREATE TABLE tbl_reporteCita (
    PK_IdReporte BIGINT AUTO_INCREMENT,
    FK_IdCita BIGINT NOT NULL,
    FK_IdPaciente VARCHAR(10) NOT NULL,
    FK_IdMedico VARCHAR(10) NOT NULL,
    Calificacion INT(1) NOT NULL,
    PRIMARY KEY (PK_IdReporte),
    FOREIGN KEY (FK_IdCita)
        REFERENCES `tbl_Cita` (PK_IdCita),
    FOREIGN KEY (FK_IdPaciente)
        REFERENCES `tbl_Paciente` (PK_IdPaciente),
    FOREIGN KEY (FK_IdMedico)
        REFERENCES `tbl_Medico` (PK_IdMedico)
)  AUTO_INCREMENT=8016;