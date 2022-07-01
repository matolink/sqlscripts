DELIMITER $$
CREATE PROCEDURE sp_maestra_temp()
    BEGIN
        CREATE TEMPORARY TABLE Maestra_temporal_ec
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