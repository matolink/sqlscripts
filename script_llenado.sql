INSERT INTO cliente (id,razon_social,rut,direccion,id_region,id_comuna,id_ciudad,id_ano,id_telefono)
VALUES
    (1,'SODIMAC SA','65789498-4','ALCANTARA 1133',13,15,1,2015,1),
    (2,'SUPERMERCADO LIDER','657948579-5','VICUÑA MACKENNA 13242',13, 14, 1, 2022, 2);

INSERT INTO productos (id,nombre,id_tipo_producto,id_precio_venta)
VALUES
    (1,'JABON POPEYE',2,1),
    (2,'PERFIL 3M',1,2);

INSERT INTO anos (id,ano)
VALUES
    (2015,2015),
    (2022,2022);

INSERT INTO region (id,nombre)
VALUES
    (1,'ARICA Y PARINACOTA'),
    (13,'METROPOLITANA DE SANTIAGO');

INSERT INTO comuna (id,nombre)
VALUES
    (15,'COMUNA X 1'),
    (14,'COMUNA X 2');

INSERT INTO ciudad (id,nombre)
VALUES
    (1,'SANTIAGO'),
    (14,'CIUDAD 2');

INSERT INTO medio_pago (id,tipo_pago)
VALUES
    (1,'debito'),
    (2,'credito'),
    (3,'efectivo');

INSERT INTO telefono (id,id_cliente,numero)
VALUES
    (1,1,'95487498'),
    (2,1,'14928744'),
    (3,2,'43908743');

INSERT INTO tipo_producto (id,tipo_producto)
VALUES
    (1,'casa'),
    (2,'construcción'),
    (3,'comida');

INSERT INTO fecha_compra_producto (id,id_producto,precio,cantidad,fecha_precio)
VALUES
    (1,1,990,400,'2020-12-06'),
    (2,1,1400,100,'2021-12-06'),
    (3,2,2200,30,'2021-02-26'),
    (4,2,8200,3,'2022-02-26');

INSERT INTO precio_venta (id,id_producto,precio_venta,fecha_precio_venta)
VALUES
    (1,1,1990,'2020-12-06'),
    (2,1,2400,'2021-12-06'),
    (3,2,3200,'2021-02-26'),
    (4,2,18200,'2022-02-26');

INSERT INTO detalle_venta (num_factura,id,id_cliente,id_producto,cantidad,fecha_venta_producto,fecha_factura,id_medio_pago,id_ano)
VALUES
    (1,1,1,1,3,'2021-05-01','2021-05-01',1,2021),
    (2,2,1,2,30,'2021-07-01','2021-07-01',2,2021),
    (3,3,1,1,23,'2021-09-01','2021-09-01',3,2021),
    (4,4,2,2,13,'2021-10-01','2021-10-01',1,2021),
    (5,5,2,1,53,'2022-01-01','2022-01-01',2,2022),
    (6,6,2,2,23,'2022-02-01','2022-02-01',3,2022),
    (7,7,2,1,3,'2022-05-01','2022-05-01',1,2022);