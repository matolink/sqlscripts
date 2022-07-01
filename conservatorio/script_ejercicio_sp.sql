drop database ejercicio;

create database ejercicio;

use ejercicio;

create table Persona
(
Id_Persona integer not null,
Rut integer not null,
Digito_Verificador Varchar(1) not null,
Nombre varchar(50) not null,
Apellido_Paterno varchar(50) not null,
Apellido_Materno varchar(50) not null,
Id_Region integer null,
fecha_hora_carga datetime NULL  DEFAULT NOW()
);

delimiter $$

create procedure sp_procedimiento_prueba(IN id integer, IN rut integer, IN dv varchar(1), IN nombre varchar (50), IN apaterno varchar (50), IN amaterno varchar(50), IN id_region integer)

begin

insert into Persona (Id_persona,Rut,Digito_Verificador,Nombre,Apellido_paterno,Apellido_materno,Id_region)
values (id,rut,dv,nombre,apaterno,amaterno,id_region);

end $$

delimiter ;

call sp_procedimiento_prueba(1,2198743,'1','matias','gutierrez','orellana',3);

