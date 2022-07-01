SELECT a.nombre AS nombre,
    e.direccion AS direccion,
    r.nombre AS region,
    c.nombre AS comuna,
    a.capacidad AS capacidad,
    a.metros_cuadrados AS metros_cuadrados
FROM Aulas AS a
INNER JOIN Edificios AS e ON a.id_edificio = e.id
INNER JOIN Comunas AS c ON e.id_comuna = c.id
INNER JOIN Regiones AS r ON e.id_region = r.id
WHERE a.aula_instrumental = 1;

SELECT p.nombre AS nombre,
        p.apellido_pat AS apellido_pat,
        p.apellido_mat AS apellido_mat,
        p.rut AS rut,
        p.dv AS dv,
        IF(ISNULL(i.id)=1, 'Colaborador', 'Alumno') AS tipo_persona,
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
