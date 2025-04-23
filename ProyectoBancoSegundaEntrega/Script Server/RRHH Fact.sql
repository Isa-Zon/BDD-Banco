CREATE DATABASE RRHH;
GO
USE RRHH;
GO

--Dimensiones
CREATE TABLE dimEmpleado (
    id INT PRIMARY KEY,
    nombreCompleto NVARCHAR(150),
    correo NVARCHAR(100),
    direccion NVARCHAR(150),
    identidad NVARCHAR(45),
    fechaRegistro DATE,
    idAreaTrabajo INT,
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimAreaTrabajo (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimCargo (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(5),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTiempo (
    id INT PRIMARY KEY,
    fecha DATE,
    anio INT,
    mes INT,
    dia INT
);


--Tabla Hechos
CREATE TABLE factEmpleadoCargo (
    idEmpleado INT,
    idCargo INT,
    idAreaTrabajo INT,
    idTiempo INT,
    fechaNombramiento DATE,
    fechaFin DATE,
    PRIMARY KEY (idEmpleado, idCargo),
    FOREIGN KEY (idEmpleado) REFERENCES dimEmpleado(id),
    FOREIGN KEY (idCargo) REFERENCES dimCargo(id),
    FOREIGN KEY (idAreaTrabajo) REFERENCES dimAreaTrabajo(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);



--Tabla de bienes asignados
CREATE TABLE factEmpleadoBien (
    idEmpleado INT,
    idBien INT,
    fechaAsignacion DATE,
    fechaFin DATE,
    PRIMARY KEY (idEmpleado, idBien),
    FOREIGN KEY (idEmpleado) REFERENCES dimEmpleado(id)
);


--indices
CREATE INDEX idxFactEmpleadoCargoEmpleado ON factEmpleadoCargo(idEmpleado);
CREATE INDEX idxFactEmpleadoCargoFecha ON factEmpleadoCargo(idTiempo);
