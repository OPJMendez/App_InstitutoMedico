CREATE VIEW vista_estado AS
    SELECT 
        e.pk_id_encabezado AS id_estado,
        d.pk_id_detalle AS id_detalle,
        d.valor AS estado,
        d.abreviatura as abreviatura
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '1';

SELECT * FROM `vista_estado`;

CREATE VIEW `vista_genero` AS
    SELECT 
        e.pk_id_encabezado AS `id_genero`,
        d.pk_id_detalle AS `id_detalle`,
        d.valor AS `genero`,
        d.abreviatura AS `abreviatura`
    FROM
        `encabezado` as `e`
            JOIN
        `detalle` as `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '2';

SELECT 
    *
FROM
    vista_genero;


CREATE VIEW vista_tipoDocumento AS
    SELECT 
        e.pk_id_encabezado AS `id_tipo_documento`,
        d.pk_id_detalle AS `id_detalle`,
        d.valor AS `tipo_documento`,
        d.abreviatura as `abreviatura`
    FROM
        `encabezado` as `e`
            JOIN
        `detalle` as `d` 
        ON e.pk_id_encabezado = d.fk_id_encabezado
    WHERE
        e.pk_id_encabezado = '3';
        
SELECT * FROM vista_tipoDocumento;

CREATE VIEW vista_rol AS
    SELECT 
        e.pk_id_encabezado AS id_rol,
        d.pk_id_detalle AS id_detalle,
        d.valor AS rol
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '4';
select * from vista_rol;

CREATE VIEW vista_tipo_contacto AS
    SELECT 
        e.pk_id_encabezado AS id_tipoContacto,
        d.pk_id_detalle AS id_detalle,
        d.valor AS tipoContacto
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '5';
        
select * from vista_tipoContacto;

CREATE VIEW vista_tipoEntidad AS
    SELECT 
        e.pk_id_encabezado AS id_tipoEntidad,
        d.pk_id_detalle AS id_detalle,
        d.valor AS tipoEntidad
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '6';
        
select * from vista_tipoEntidad;

CREATE VIEW vista_tipoCorreo AS
    SELECT 
        e.pk_id_encabezado AS id_tipoCorreo,
        d.pk_id_detalle AS id_detalle,
        d.valor AS tipoCorreo
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '7';
        
select * from vista_tipoCorreo;

CREATE VIEW vista_prioridad AS
    SELECT 
        e.pk_id_encabezado AS id_prioridad,
        d.pk_id_detalle AS id_detalle,
        d.valor AS prioridad
    FROM
        `encabezado` AS `e`
            JOIN
        `detalle` AS `d` ON `e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`
    WHERE
        `e`.`pk_id_encabezado` = '8';
        
select * from vista_prioridad;