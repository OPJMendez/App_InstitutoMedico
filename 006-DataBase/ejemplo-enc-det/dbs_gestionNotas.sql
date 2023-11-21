create database dbs_gestion_notas;
use dbs_gestion_notas;

create table tbl_personal(
Pk_id tinyint(4) unsigned primary key auto_increment, 
Fk_tipoDocumento tinyint(2) not null,
NumeroDocumento varchar(25) not null,
Nombre_p varchar(50) not null,
Nombre_s varchar(50),
Apellido_p varchar(50) not null,
Apellido_s varchar(50),
Direccion varchar(150) not null,
Fk_vs_genero tinyint(4)not null,
FechaNacimiento date not null,
Fk_vs_estado tinyint(4) not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_cargos(
Pk_id tinyint(1) unsigned primary key auto_increment,
Fk_idPersonal tinyint(4) unsigned not null,
Fk_vs_cargo tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_usuarios(
Pk_id tinyint(5) unsigned primary key auto_increment, 
Usuario varchar (150) not null,
Clave varchar (250) not null,
Fk_idPersonal tinyint(4) unsigned not null,
Fk_vs_rol tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_calificaciones(
Pk_id tinyint(2) unsigned primary key auto_increment, 
Fk_idPersonal tinyint(4) unsigned not null,
Notas float not null,
Fk_vs_periodo tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_encabezados(
Pk_id tinyint(2) unsigned primary key auto_increment, 
Nombre varchar(50) not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_encabezados_det(
Pk_id tinyint(2) unsigned primary key auto_increment, 
Nombre varchar(50) not null,
Nomenclatura char(4) not null,
Fk_encabezados_id tinyint(2) unsigned,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_accesos(
Pk_id int unsigned primary key auto_increment, 
Fk_idPersonal tinyint(4) unsigned not null,
Ingreso datetime,
Salida datetime,
Fk_vs_acceso tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_telefono(
Pk_id tinyint(1) unsigned primary key auto_increment, 
Numero_tel tinyint(1) not null,
Fk_personal_id tinyint(4) unsigned,
Fk_vs_prioridad tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_correo(
Pk_id tinyint(1) unsigned primary key auto_increment, 
Correo varchar(100) not null,
Fk_personal_id tinyint(4) unsigned,
Fk_vs_prioridad tinyint(4) unsigned not null,
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);

create table tbl_cursos(
Pk_id tinyint(1) unsigned primary key auto_increment, 
Nombre varchar(100) not null,
Nomenclatura char(3) not null,
Fk_cargos_id tinyint(1) unsigned, 
Fk_vs_estado tinyint(4) unsigned not null,
Us_crea tinyint(5) not null,
Fe_crea timestamp
);




