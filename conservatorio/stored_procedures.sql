DELIMITER $$

CREATE PROCEDURE sp_insert_generos(IN sp_nombre INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM Generos WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Generos(nombre)
            VALUES (sp_nombre);
        ELSE
            SELECT 'Genero ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_personas(IN sp_rut INT ,IN sp_nombre VARCHAR(255),IN sp_apellido_pat VARCHAR(255),IN sp_apellido_mat VARCHAR(255),IN sp_dv VARCHAR(255),IN sp_id_genero INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM personas WHERE rut = sp_rut))
        THEN
            INSERT INTO Personas(rut, nombre, apellido_pat, apellido_mat, dv, id_genero)
            VALUES (sp_rut, sp_nombre, sp_apellido_pat, sp_apellido_mat, sp_dv, sp_id_genero);
        ELSE
            SELECT 'Persona ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_anos(IN sp_periodo INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM Anos WHERE periodo = sp_periodo))
        THEN
            INSERT INTO Anos(periodo)
            VALUES (sp_periodo);
        ELSE
            SELECT 'Ano ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_alumnos(IN sp_id_persona INT, IN sp_fecha_nacimiento DATE)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM alumnos WHERE id_persona = sp_id_persona))
        THEN
            INSERT INTO alumnos(id_persona, fecha_nacimiento)
            VALUES (sp_id_persona, sp_fecha_nacimiento);
        ELSE
            SELECT 'Alumno ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_profesores(IN sp_id_persona INT, IN sp_fecha_ingreso DATE,IN sp_casa_de_estudios VARCHAR(255),IN sp_ano_titulacion INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM profesores WHERE id_persona = sp_id_persona))
        THEN
            INSERT INTO Profesores(id_persona, fecha_ingreso, casa_de_estudios, ano_titulacion)
            VALUES (sp_id_persona, sp_fecha_ingreso, sp_casa_de_estudios, sp_ano_titulacion);
        ELSE
            SELECT 'Profesor ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_areas(IN sp_nombre VARCHAR(255))
    BEGIN
        IF (NOT EXISTS (SELECT * FROM areas WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Areas(nombre)
            VALUES (sp_nombre);
        ELSE
            SELECT 'Area ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_cargos(IN sp_nombre VARCHAR(255), IN sp_id_area INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM cargos WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Cargos(nombre, id_area)
            VALUES (sp_nombre, sp_id_area);
        ELSE
            SELECT 'Ano ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_colaboradores(IN sp_id_persona INT, IN sp_id_cargo INT, IN sp_renta_base INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM colaboradores WHERE id_persona = sp_id_persona AND id_cargo = sp_id_cargo))
        THEN
            INSERT INTO Colaboradores(id_persona, id_cargo, renta_base)
            VALUES (sp_id_persona, sp_id_cargo, sp_renta_base);
        ELSE
            SELECT 'Colaborador ya ingresado' AS 'ERROR';
        END IF;
    END$$
    
CREATE PROCEDURE sp_insert_telefonos(IN sp_id_persona INT, IN sp_numero VARCHAR(255))
    BEGIN
        IF (NOT EXISTS (SELECT * FROM telefonos WHERE id_persona = sp_id_persona AND numero = sp_numero))
        THEN
            INSERT INTO Telefonos(id_persona, numero)
            VALUES (sp_id_persona, sp_numero);
        ELSE
            SELECT 'Telefono ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_edades_recomendadas(IN sp_edad_recomendada INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM edades_recomendadas WHERE edad_recomendada = sp_edad_recomendada))
        THEN
            INSERT INTO Edades_recomendadas(edad_recomendada)
            VALUES (sp_edad_recomendada);
        ELSE
            SELECT 'Edad ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_tipos_instrumentos(IN sp_nombre VARCHAR(255))
    BEGIN
        IF (NOT EXISTS (SELECT * FROM tipos_instrumentos WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Tipos_instrumentos(nombre)
            VALUES (sp_nombre);
        ELSE
            SELECT 'Tipo ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_instrumentos(IN sp_nombre VARCHAR(255), IN sp_id_edad_recomendada INT, IN sp_id_tipo_instrumento INT, IN sp_dicta_instrumento BIT, IN sp_fecha_creacion DATE, IN sp_fecha_comienzo_impartir DATE)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM instrumentos WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Instrumentos(nombre, id_edad_recomendada, id_tipo_instrumento, dicta_instrumento, fecha_creacion, fecha_comienzo_impartir)
            VALUES (sp_nombre, sp_id_edad_recomendada, sp_id_tipo_instrumento, sp_dicta_instrumento, sp_fecha_creacion, sp_fecha_comienzo_impartir);
        ELSE
            SELECT 'Instrumento ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_alumnos_instrumentos(IN sp_id_alumno INT, IN sp_id_instrumento INT, IN sp_fecha_comienzo_practica DATE, IN sp_id_ano INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM alumnos_instrumentos WHERE id_alumno = sp_id_alumno AND id_instrumento = sp_id_instrumento))
        THEN
            INSERT INTO Alumnos_instrumentos(id_alumno, id_instrumento, fecha_comienzo_practica, id_ano)
            VALUES (sp_id_alumno, sp_id_instrumento, sp_fecha_comienzo_practica, sp_id_ano);
        ELSE
            SELECT 'Relación ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_profesores_instrumentos(IN sp_id_profesor INT, IN sp_id_instrumento INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM profesores_instrumentos WHERE id_profesor = sp_id_profesor AND id_instrumento = sp_id_instrumento))
        THEN
            INSERT INTO Profesores_instrumentos(id_profesor, id_instrumento)
            VALUES (sp_id_profesor, sp_id_instrumento);
        ELSE
            SELECT 'Relación ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_asignaturas(IN sp_nombre VARCHAR(255), IN sp_id_ano INT, IN sp_cantidad_horas_presencial INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM asignaturas WHERE nombre = sp_nombre AND ano = sp_ano))
        THEN
            INSERT INTO Asignaturas(nombre, id_ano, cantidad_horas_presencial)
            VALUES (sp_nombre, sp_id_ano, sp_cantidad_horas_presencial);
        ELSE
            SELECT 'Asignatura ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_clases(IN sp_id_asignatura INT, IN sp_id_instrumento INT, IN sp_semestre INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM clases WHERE id_asignatura = sp_id_asignatura AND id_instrumento = sp_id_instrumento AND semestre = sp_semestre))
        THEN
            INSERT INTO Clases(id_asignatura, id_instrumento, semestre)
            VALUES (sp_id_asignatura, sp_id_instrumento, sp_semestre);
        ELSE
            SELECT 'Clase ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_notas(IN sp_id_alumno INT, IN sp_id_clase INT, IN sp_nota INT)
    BEGIN
        INSERT INTO Notas(id_alumno, id_clase, nota)
        VALUES (sp_id_alumno, sp_id_clase, sp_nota);
    END$$

CREATE PROCEDURE sp_insert_matriculas(IN sp_id_alumno INT, IN sp_id_ano INT, IN sp_activo BIT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM matriculas WHERE id_alumno = sp_id_alumno AND id_ano = sp_id_ano))
        THEN
            INSERT INTO Matriculas(id_alumno, id_ano, activo)
            VALUES (sp_id_alumno, sp_id_ano, sp_activo);
        ELSE
            SELECT 'Matricula ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_alumnos_clases(IN sp_id_alumno INT, IN sp_id_clase INT, IN sp_id_ano INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM alumnos_clases WHERE id_alumno = sp_id_alumno AND id_clase = sp_id_clase AND id_ano = sp_id_ano))
        THEN
            INSERT INTO Alumnos_clases(id_alumno, id_clase, id_ano)
            VALUES (sp_id_alumno, sp_id_clase, sp_id_ano);
        ELSE
            SELECT 'Relacion ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_asignaturas_profesores(IN sp_id_profesor INT, IN sp_id_asignatura INT, IN sp_id_ano INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM Asignaturas_profesores WHERE id_profesor = sp_id_profesor AND id_asignatura = sp_id_asignatura AND id_ano = sp_id_ano))
        THEN
            INSERT INTO Asignaturas_profesores(id_profesor, id_asignatura, id_ano)
            VALUES (sp_id_profesor, sp_id_asignatura, sp_id_ano);
        ELSE
            SELECT 'Relacion ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_regiones(IN sp_nombre VARCHAR(255))
    BEGIN
        IF (NOT EXISTS (SELECT * FROM regiones WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Regiones(nombre)
            VALUES (sp_nombre);
        ELSE
            SELECT 'Region ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_ciudades(IN sp_nombre VARCHAR(255), IN sp_id_region INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM ciudades WHERE nombre = sp_nombre AND id_region = sp_id_region))
        THEN
            INSERT INTO Ciudades(nombre, id_region)
            VALUES (sp_nombre, sp_id_region);
        ELSE
            SELECT 'Ciudad ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_comunas(IN sp_nombre VARCHAR(255), IN sp_id_ciudad INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM comunas WHERE nombre = sp_nombre AND id_ciudad = sp_id_ciudad))
        THEN
            INSERT INTO Comunas(nombre, id_ciudad)
            VALUES (sp_nombre, sp_id_ciudad);
        ELSE
            SELECT 'Comuna ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_edificios(IN sp_direccion VARCHAR(255), IN sp_id_comuna INT, IN sp_id_ciudad INT, IN sp_id_region INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM edificios WHERE direccion = sp_direccion AND id_comuna = sp_id_comuna AND id_ciudad = sp_id_ciudad AND id_region = sp_id_region))
        THEN
            INSERT INTO Edificios(direccion, id_comuna, id_ciudad, id_region)
            VALUES (sp_direccion, sp_id_comuna, sp_id_ciudad, sp_id_region);
        ELSE
            SELECT 'Edificio ya ingresado' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_aulas(IN sp_nombre VARCHAR(255), IN sp_capacidad INT, IN sp_metros_cuadrados INT, IN sp_aula_instrumental BIT, IN sp_id_edificio INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM aulas WHERE nombre = sp_nombre))
        THEN
            INSERT INTO Aulas(nombre, capacidad, metros_cuadrados, aula_instrumental, id_edificio)
            VALUES (sp_nombre, sp_id_ciudad, sp_metros_cuadrados, sp_aula_instrumental, sp_id_edificio);
        ELSE
            SELECT 'Aula ya ingresada' AS 'ERROR';
        END IF;
    END$$

CREATE PROCEDURE sp_insert_aulas_instrumentos(IN sp_aula INT, IN sp_id_instrumento INT, IN sp_numero_puestos INT)
    BEGIN
        IF (NOT EXISTS (SELECT * FROM aulas_instrumentos WHERE aula = sp_aula AND id_instrumento = sp_id_instrumento))
        THEN
            INSERT INTO aulas_instrumentos(aula, id_instrumento, numero_puestos)
            VALUES (sp_aula, sp_id_instrumento, sp_numero_puestos);
        ELSE
            SELECT 'Relacion ya ingresada' AS 'ERROR';
        END IF;
    END$$

DELIMITER ;