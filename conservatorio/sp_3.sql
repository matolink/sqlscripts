DELIMITER $$
CREATE PROCEDURE sp_maestra_estudiantes_colaboradores()
    BEGIN
        CREATE TABLE Maestra_estudiantes_colaboradores (
            id INT NOT NULL AUTO_INCREMENT,
            nombre VARCHAR(255) NOT NULL, 
            apellido_pat VARCHAR(255) NOT NULL, 
            apellido_mat VARCHAR(255) NOT NULL, 
            rut VARCHAR(255) NOT NULL, 
            dv VARCHAR(255) NOT NULL, 
            tipo_persona VARCHAR(255) NOT NULL, 
            cargo VARCHAR(255) NOT NULL, 
            renta_base INT NOT NULL,
            instrumento VARCHAR(255) NOT NULL,
            tipo_instrumento VARCHAR(255) NOT NULL,
            PRIMARY KEY (id)
            );
        INSERT INTO Maestra_estudiantes_colaboradores(nombre, apellido_pat, apellido_mat, rut, dv, tipo_persona, cargo, renta_base, instrumento, tipo_instrumento)
        SELECT p.nombre AS nombre,
            p.apellido_pat AS apellido_pat,
            p.apellido_mat AS apellido_mat,
            p.rut AS rut,
            p.dv AS dv,
            (SELECT IF ((a.id IS NOT NULL), 'Alumno', 'Colaborador')) AS tipo_persona,
            ca.nombre AS cargo,
            c.renta_base AS renta_base,
            i.nombre AS instrumento,
            ti.nombre AS tipo_instrumento
            FROM Personas AS p
            LEFT JOIN Alumnos AS a ON p.id = a.id_persona
            LEFT JOIN Colaboradores AS c ON p.id = c.id_persona
            LEFT JOIN Alumnos_instrumentos AS ai ON a.id = ai.id_alumno
            LEFT JOIN Instrumentos AS i ON ai.id_instrumento = i.id
            LEFT JOIN Tipos_instrumentos AS ti ON i.id_tipo_instrumento = ti.id
            LEFT JOIN Cargos AS ca ON c.id_cargo = ca.id;
    END$$
DELIMITER ;