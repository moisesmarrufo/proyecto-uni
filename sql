Drop DATABASE if exists bd_divina_pastora;
CREATE DATABASE bd_divina_pastora;
USE bd_divina_pastora;

-- MÓDULO: MANTENIMIENTO / SEGURIDAD
CREATE TABLE Usuarios (
    Id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Rol ENUM('ADMIN', 'DOCENTE', 'ESTUDIANTE') NOT NULL,
    Estado BOOLEAN DEFAULT TRUE
);

-- MÓDULO: REGISTROS (Tablas separadas por actor)
CREATE TABLE Docentes (
    ID int AUTO_INCREMENT,
    cedula VARCHAR(15) PRIMARY KEY NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    key(ID)
);

CREATE TABLE representantes (
    id_representante INT AUTO_INCREMENT  ,
    cedula VARCHAR(15)  PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    telefono VARCHAR(11) not null UNIQUE,
    direccion varchar(100),
     key(id_representante)
);

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT,
    cedula_escolar VARCHAR(20) PRIMARY KEY NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
   	cedula varchar(11),
    KEY(id_estudiante),
    FOREIGN KEY (cedula) REFERENCES representantes(cedula)
);

CREATE TABLE cursos (
    id_curso INT  PRIMARY KEY AUTO_INCREMENT,
    grado VARCHAR(20) NOT NULL, -- Ej: Primer Grado
    seccion VARCHAR(1) NOT NULL,
    cedula VARCHAR(15),
    FOREIGN KEY (cedula) REFERENCES Docentes(cedula)
);

-- MÓDULO: PROCESOS EDUCATIVOS Y REPORTES
CREATE TABLE actividades_didacticas (
    id_actividad INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE evaluaciones (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_actividad INT,
    calificacion DECIMAL(4,2),
    competencia_alcanzada TEXT,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_actividad) REFERENCES actividades_didacticas(id_actividad)
);

