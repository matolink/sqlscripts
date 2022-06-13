/*CREATE DATABASE facturas;

USE facturas;

CREATE TABLE cliente (
    id int(11) NOT NULL AUTO_INCREMENT,
    razon_social varchar(64) NOT NULL,
    rut varchar(15) NOT NULL,
    direccion varchar(15) NOT NULL,
    id_region int(11) NOT NULL,
    id_comuna int(11) NOT NULL,
    id_ciudad int(11) NOT NULL,
    correo varchar(64) NOT NULL,
    id_ano int(4) NOT NULL,
    id_telefono int(4) NOT NULL,
    PRIMARY KEY (id)
);
*/

CREATE TABLE productos (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(64) NOT NULL,
    id_tipo_producto int(11) NOT NULL,
    id_precio_venta int(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ano (
    id int(11) NOT NULL AUTO_INCREMENT,
    ano int(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE region (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ciudad (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE comuna (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medio_pago (
    id int(11) NOT NULL AUTO_INCREMENT,
    tipo_pago varchar(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE telefono (
    id int(11) NOT NULL AUTO_INCREMENT,
    id_cliente int(11) NOT NULL,
    numero varchar(15) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tipo_producto (
    id int(11) NOT NULL AUTO_INCREMENT,
    tipo_producto varchar(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE fecha_compra_producto (
    id int(11) NOT NULL AUTO_INCREMENT,
    id_producto int(11) NOT NULL,
    precio int(15) NOT NULL,
    cantidad int(12) NOT NULL,
    fecha_precio DATE,
    PRIMARY KEY (id)
);

CREATE TABLE precio_venta (
    id int(11) NOT NULL AUTO_INCREMENT,
    id_producto int(11) NOT NULL,
    precio_venta int(15) NOT NULL,
    fecha_precio_venta DATE,
    PRIMARY KEY (id)
);

CREATE TABLE detalle_venta (
    num_factura int(11) NOT NULL,
    id int(11) NOT NULL AUTO_INCREMENT,
    id_cliente int(11) NOT NULL,
    id_producto int(11) NOT NULL,
    cantidad int(15) NOT NULL,
    fecha_venta_producto DATE,
    fecha_factura DATE,
    id_medio_pago int(11) NOT NULL,
    id_ano int(11) NOT NULL,
    PRIMARY KEY (id)
);