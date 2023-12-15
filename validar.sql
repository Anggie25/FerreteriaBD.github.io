

drop database if exists Veterinaria;
CREATE DATABASE Veterinaria CHARACTER SET utf8mb4;
USE Veterinaria;

-- Tabla de Dueños
CREATE TABLE Dueños (
    id_dueño INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(15),
    direccion VARCHAR(100)
);

-- Insertar datos en la tabla Dueños
INSERT INTO Dueños (nombre, apellido, telefono, direccion)
VALUES ('Daniel', 'Guaman', '0997655539', 'Calle Nueva loja'),
       ('Luiz', 'Diaz', '0966734522', 'Avenida de las Americas'),
       ('Alegrandro', 'Solano', '0103044885', 'La florida'),
       ('Angelica', 'Maurad', '0966734544', 'Totoracocha'),
       ('Jessica', 'Andrade', '0103044541', 'Pedregal');
       
select * from Dueños;

-- Tabla de Mascotas
CREATE TABLE Mascotas (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    especie VARCHAR(100),
    raza VARCHAR(100),
    fecha_nacimiento DATE,
    id_dueño INT,
    FOREIGN KEY (id_dueño) REFERENCES Dueños(id_dueño)
);

INSERT INTO Mascotas (nombre, especie, raza, fecha_nacimiento, id_dueño)
VALUES ('Bruno', 'Perro', 'salchicha', '2021-05-11', 1),
       ('Amarrillo', 'Gato', 'Egipcio', '2023-06-12', 2),
       ('Lina', 'Gallina', 'Sussex Clara.', '2023-11-21', 3),
       ('Clara', 'Gato', 'Asiático.', '2023-06-12', 5),
       ('Ojon', 'cuy', ' ruso.', '2022-11-11', 4);

-- Tabla de Vacunas
CREATE TABLE Vacunas (
    id_vacuna INT PRIMARY KEY AUTO_INCREMENT,
    nombre_vacuna VARCHAR(100),
    fecha_vacunacion DATE,
    id_mascota INT,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota)
);

-- Insertar datos en la tabla Vacunas
INSERT INTO Vacunas (nombre_vacuna, fecha_vacunacion, id_mascota)
VALUES ('Vacuna Rabia', '2023-11-25', 1),
       ('Vacuna Rabia', '2023-11-10', 3),
       ('Vacuna gripe felina', '2023-11-27', 2),
       ('Vacuna gripe felina', '2023-11-05', 5),
       ('Vacuna Rabia', '2023-11-25', 4);
   


-- Tabla de Veterinarios
CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    direccion VARCHAR(100)
);
select * from veterinarios;

-- Insertar datos en la tabla Veterinarios
INSERT INTO Veterinarios (nombre, especialidad, telefono, direccion)
VALUES ('Jhon', 'Cirujano', '0274635524', 'Galo Ancelmo'),
       ('Dayanna', 'Fisioterapeuta', '0273555369', 'Rio bonito'),
       ('Johnatan', 'Oftalmología', '0973524112', '9 de mayo'),
       ('Digna', 'Oncologo', '0893746152', 'La Lopez'),
       ('Edzequiel', 'Conducta Animal', '0107263547', 'Balao Alto');




-- Tabla de Citas
CREATE TABLE Citas (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cita DATE,
    id_mascota INT,
    id_veterinario INT,
    motivo_consulta TEXT,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);

-- Insertar datos en la tabla Citas
INSERT INTO Citas (fecha_cita, id_mascota, id_veterinario, motivo_consulta)
VALUES ('2023-11-26', 1, 3, 'Chequeo anual'),
       ('2023-11-26', 2, 2, 'Se callo del 8 piso'),
       ('2023-11-26', 3, 3, 'Chequeo anual'),
       ('2023-11-26', 4, 1, 'Atropellada'),
       ('2023-11-26', 3, 5, 'Lo pisaron accidentalmente');
       
       
       
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    usuario VARCHAR(50),
    contraseña VARCHAR(15),
    Tipo_usuario int
);

CREATE TABLE Tipo_usuario (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);
select * from Usuarios;

INSERT INTO Usuarios (nombre, usuario, contraseña, tipo_usuario)
VALUES ('Daniel', 'Daniel15', '123456', 'Dueño'),
       ('Angelica', 'Angelica15', '123456', 'Dueño'),
       ('Luiz', 'Luiz15', '123456', 'Dueño'),
       ('Alejandro', 'Alejandro15', '123456', 'Dueño'),
       ('Jessica', 'Jessica15', '123456', 'Dueño'),
       ('Dayanna', 'Dayanna16', '123456', 'Veterinario'),
       ('Johnatan', 'Johnatan16', '123456', 'Veterinario'),
       ('Digna', 'Digna16', '123456', 'Veterinario'),
       ('Edzequiel', 'Edzequiel16', '123456', 'Veterinario'),
       ('Jhon', 'Jhon16', '123456', 'Veterinario');
       


INSERT INTO Tipo_usuario (nombre)
VALUES ('Dueño'),
       ('Veterinario');
	
select * from Tipo_usuario;
       

ALTER TABLE Usuarios
DROP COLUMN direccion;


