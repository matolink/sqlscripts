DELIMITER $$
CREATE PROCEDURE sp_maestra_aulas_instrumentales()
    BEGIN
        CREATE TABLE Maestra_aulas_instrumentales (
            id INT NOT NULL AUTO_INCREMENT,
            nombre VARCHAR(255) NOT NULL, 
            numero_edificio INT NOT NULL,
            direccion_edificio VARCHAR(255) NOT NULL,
            region VARCHAR(255) NOT NULL,
            comuna VARCHAR(255) NOT NULL,
            capacidad INT NOT NULL,
            metros_cuadrados INT NOT NULL,
            PRIMARY KEY (id)
            );
        INSERT INTO Maestra_aulas_instrumentales(nombre, numero_edificio, direccion_edificio, region, comuna, capacidad, metros_cuadrados)
        SELECT a.nombre AS nombre,
            e.id AS numero_edificio,
            e.direccion AS direccion_edificio,
            r.nombre AS region,
            c.nombre AS comuna,
            a.capacidad AS capacidad,
            a.metros_cuadrados AS metros_cuadrados
        FROM Aulas AS a
        INNER JOIN Edificios AS e ON a.id_edificio = e.id
        INNER JOIN Comunas AS c ON e.id_comuna = c.id
        INNER JOIN Regiones AS r ON e.id_region = r.id
        WHERE a.aula_instrumental = 1;
    END$$
DELIMITER ;