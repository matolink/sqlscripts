DROP DATABASE conservatorio;
CREATE DATABASE conservatorio;
USE conservatorio;
CREATE TABLE Generos(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Personas(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido_pat VARCHAR(255) NOT NULL,
    apellido_mat VARCHAR(255) NOT NULL,
    rut VARCHAR(255) NOT NULL,
    dv VARCHAR(255) NOT NULL,
    id_genero INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_genero) REFERENCES Generos (id)
);
CREATE TABLE Anos(
    id INT NOT NULL AUTO_INCREMENT,
    periodo INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Alumnos(
    id INT NOT NULL AUTO_INCREMENT,
    id_persona INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_persona) REFERENCES Personas (id)
);
CREATE TABLE Profesores(
    id INT NOT NULL AUTO_INCREMENT,
    id_persona INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    casa_de_estudios VARCHAR(255) NOT NULL,
    ano_titulacion INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_persona) REFERENCES Personas (id),
    FOREIGN KEY (ano_titulacion) REFERENCES Anos (id)
);
CREATE TABLE Areas(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Cargos(
    id INT NOT NULL AUTO_INCREMENT,
    id_area INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_area) REFERENCES Areas (id)
);
CREATE TABLE Colaboradores(
    id INT NOT NULL AUTO_INCREMENT,
    id_persona INT NOT NULL,
    id_cargo INT NOT NULL,
    renta_base INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_persona) REFERENCES Personas (id),
    FOREIGN KEY (id_cargo) REFERENCES Cargos (id)
);
CREATE TABLE Telefonos(
    id INT NOT NULL AUTO_INCREMENT,
    id_persona INT NOT NULL,
    numero VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_persona) REFERENCES Personas (id)
);
CREATE TABLE Edades_recomendadas(
    id INT NOT NULL AUTO_INCREMENT,
    edad_recomendada INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Tipos_instrumentos(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Instrumentos(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    id_edad_recomendada INT NOT NULL,
    id_tipo_instrumento INT NOT NULL,
    dicta_instrumento BIT NOT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_comienzo_impartir DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_edad_recomendada) REFERENCES Edades_recomendadas (id),
    FOREIGN KEY (id_tipo_instrumento) REFERENCES Tipos_instrumentos (id)
);
CREATE TABLE Alumnos_instrumentos(
    id INT NOT NULL AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_instrumento INT NOT NULL,
    fecha_comienzo_practica DATE NOT NULL,
    id_ano INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_instrumento) REFERENCES Instrumentos (id),
    FOREIGN KEY (id_ano) REFERENCES Anos (id)
);
CREATE TABLE Profesores_instrumentos(
    id INT NOT NULL AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_instrumento INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profesor) REFERENCES Profesores (id),
    FOREIGN KEY (id_instrumento) REFERENCES Instrumentos (id)
);
CREATE TABLE Asignaturas(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    id_ano INT NOT NULL,
    cantidad_horas_presencial INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_ano) REFERENCES Anos (id)
);
CREATE TABLE Clases(
    id INT NOT NULL AUTO_INCREMENT,
    id_asignatura INT NOT NULL,
    id_instrumento INT NOT NULL,
    semestre INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_asignatura) REFERENCES Asignaturas (id),
    FOREIGN KEY (id_instrumento) REFERENCES Instrumentos (id)
);
CREATE TABLE Notas(
    id INT NOT NULL AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_clase INT NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_clase) REFERENCES Clases (id)
);
CREATE TABLE Matriculas(
    id INT NOT NULL AUTO_INCREMENT,
    activo BIT,
    id_alumno INT NOT NULL,
    id_ano INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_ano) REFERENCES Anos (id)
);
CREATE TABLE Alumnos_clases(
    id INT NOT NULL AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_clase INT NOT NULL,
    id_ano INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_clase) REFERENCES Clases (id),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id),
    FOREIGN KEY (id_ano) REFERENCES Anos (id)
);
CREATE TABLE Asignaturas_profesores(
    id INT NOT NULL AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_ano INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profesor) REFERENCES Profesores (id),
    FOREIGN KEY (id_asignatura) REFERENCES Asignaturas (id),
    FOREIGN KEY (id_ano) REFERENCES Anos (id)
);
CREATE TABLE Regiones(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Ciudades(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (255) NOT NULL,
    id_region INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_region) REFERENCES Regiones (id)
);
CREATE TABLE Comunas(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (255) NOT NULL,
    id_ciudad INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades (id)
);
CREATE TABLE Edificios(
    id INT NOT NULL AUTO_INCREMENT,
    direccion VARCHAR (255) NOT NULL,
    id_comuna INT NOT NULL,
    id_ciudad INT NOT NULL,
    id_region INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_comuna) REFERENCES Comunas (id),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades (id),
    FOREIGN KEY (id_region) REFERENCES Regiones (id)
);
CREATE TABLE Aulas(
    id INT NOT NULL AUTO_INCREMENT,
    capacidad INT NOT NULL,
    nombre VARCHAR (255) NOT NULL,
    metros_cuadrados INT NOT NULL,
    aula_instrumental BIT NOT NULL,
    id_edificio INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_edificio) REFERENCES Edificios (id)
);
CREATE TABLE Aulas_instrumentos(
    id INT NOT NULL AUTO_INCREMENT,
    id_aula INT NOT NULL,
    id_instrumento INT NOT NULL,
    numero_puestos INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_aula) REFERENCES Aulas (id),
    FOREIGN KEY (id_instrumento) REFERENCES Instrumentos (id)
);