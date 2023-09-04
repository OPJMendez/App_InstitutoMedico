CREATE DATABASE DB_InstitutoMedico;
USE DB_InstitutoMedico;
CREATE TABLE tbl_Sexo (
    PK_IdSexo CHAR,
    Nombre VARCHAR(20) NOT NULL,
    Abreviatura CHAR,
    PRIMARY KEY (PK_IdSexo)
);
CREATE TABLE tbl_Estado (
    PK_IdEstado INT(1),
    Nombre VARCHAR(30) NOT NULL,
    Abreviatura CHAR NOT NULL,
    PRIMARY KEY (PK_IdEstado)
);
CREATE TABLE tbl_tipoDocumento (
    PK_IdTipo INT(1),
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_IdTipo)
);
CREATE TABLE tbl_Rol (
    PK_IdRol INT(1),
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_IdRol)
);
CREATE TABLE tbl_Especialidad (
    PK_IdEspecialidad BIGINT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_IdEspecialidad)
);
CREATE TABLE tbl_historiaClinica (
    PK_IdHistoria BIGINT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_IdHistoria)
);
CREATE TABLE tbl_Eps (
    PK_Nit BIGINT AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    correoElectronico VARCHAR(244) NOT NULL,
    Contacto VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (PK_Nit)
);
CREATE TABLE tbl_Paciente (
    PK_IdPaciente VARCHAR(10),
    FK_tipoDocumento INT(1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Edad INT(2) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    correoElectronico VARCHAR(244) NOT NULL,
    FK_IdRol INT(1) NOT NULL,
    FK_IdEstado INT(1) NOT NULL,
    FK_IdSexo INT(1) NOT NULL,
    FK_IdNit BIGINT NOT NULL,
    FK_IdHistoria BIGINT NOT NULL,
    FOREIGN KEY (FK_IdRol)
        REFERENCES `tbl_Rol` (PK_IdRol),
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado),
    FOREIGN KEY (FK_IdSexo)
        REFERENCES `tbl_Sexo` (PK_IdSexo),
    FOREIGN KEY (FK_IdNit)
        REFERENCES `tbl_Eps` (PK_Nit),
    FOREIGN KEY (FK_IdHistoria)
        REFERENCES `tbl_historiaClinica` (PK_IdHistoria),
    FOREIGN KEY (FK_tipoDocumento)
        REFERENCES `tbl_tipoDocumento` (PK_IdtipoDocumento),
    PRIMARY KEY (PK_IdPaciente)
);
-- Error Code: 1005. Can't create table `db_institutomedico`.`tbl_paciente` (errno: 150 "Foreign key constraint is incorrectly formed")
CREATE TABLE tbl_Medico (
    PK_IdMedico VARCHAR(10),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Edad INT(2) NOT NULL,
    FK_IdSexo INT(1) NOT NULL,
    FOREIGN KEY (FK_IdSexo)
        REFERENCES `tbl_Sexo` (PK_IdSexo),
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    correoElectronico VARCHAR(244) NOT NULL,
    FK_IdRol INT(1) NOT NULL,
    FOREIGN KEY (FK_IdRol)
        REFERENCES `tbl_Rol` (PK_IdRol),
    FK_IdEspecialidad BIGINT NOT NULL,
    FOREIGN KEY (FK_IdEspecialidad)
        REFERENCES `tbl_Especialidad` (PK_IdEspecialidad),
    FK_IdEstado INT(1) NOT NULL,
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado),
    PRIMARY KEY (PK_IdMedico)
);
CREATE TABLE tbl_Cita (
    PK_IdCita BIGINT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    FK_IdEstado INT(1) NOT NULL,
    FOREIGN KEY (FK_IdEstado)
        REFERENCES `tbl_Estado` (PK_IdEstado),
    FK_IdPaciente VARCHAR(10) NOT NULL,
    FOREIGN KEY (FK_IdPaciente)
        REFERENCES `tbl_Paciente` (PK_IdPaciente),
    FK_IdMedico VARCHAR(10) NOT NULL,
    FOREIGN KEY (FK_IdMedico)
        REFERENCES `tbl_Medico` (PK_IdMedico),
    FK_IdEspecialidad BIGINT NOT NULL,
    FOREIGN KEY (FK_IdEspecialidad)
        REFERENCES `tbl_Especialidad` (PK_IdEspecialidad),
    PRIMARY KEY (PK_IdCita)
);
CREATE TABLE tbl_Calificacion (
    PK_IdCalificacion INT(1),
    Nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_IdCalificacion)
);
CREATE TABLE tbl_reporteCita (
    PK_IdReporte BIGINT AUTO_INCREMENT,
    FK_IdCita BIGINT AUTO_INCREMENT,
    FOREIGN KEY (FK_IdCita)
        REFERENCES `tbl_Cita` (PK_IdCita),
    FK_IdPaciente VARCHAR(10) NOT NULL,
    FOREIGN KEY (FK_IdPaciente)
        REFERENCES `tbl_Paciente` (PK_IdPaciente),
    FK_IdMedico VARCHAR(10) NOT NULL,
    FOREIGN KEY (FK_IdMedico)
        REFERENCES `tbl_Medico` (PK_IdMedico),
    reporteMedico VARCHAR(5000) NOT NULL,
    FK_IdCalificacion int(1) not null,
  FOREIGN KEY (FK_IdCalificacion)
        REFERENCES `tbl_Calificacion` (PK_IdCalificacion),  
    PRIMARY KEY (PK_IdReporte)
);