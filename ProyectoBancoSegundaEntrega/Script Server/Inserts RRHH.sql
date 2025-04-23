--Inserts RRHH

USE RRHH;
GO

-- Inserts para tabla Persona
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (1, 'Nombre1', 'SNombre1', 'Apellido1', 'SApellido1', 'Direccion 1', 'persona1@mail.com', '0801000001');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (2, 'Nombre2', 'SNombre2', 'Apellido2', 'SApellido2', 'Direccion 2', 'persona2@mail.com', '0801000002');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (3, 'Nombre3', 'SNombre3', 'Apellido3', 'SApellido3', 'Direccion 3', 'persona3@mail.com', '0801000003');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (4, 'Nombre4', 'SNombre4', 'Apellido4', 'SApellido4', 'Direccion 4', 'persona4@mail.com', '0801000004');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (5, 'Nombre5', 'SNombre5', 'Apellido5', 'SApellido5', 'Direccion 5', 'persona5@mail.com', '0801000005');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (6, 'Nombre6', 'SNombre6', 'Apellido6', 'SApellido6', 'Direccion 6', 'persona6@mail.com', '0801000006');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (7, 'Nombre7', 'SNombre7', 'Apellido7', 'SApellido7', 'Direccion 7', 'persona7@mail.com', '0801000007');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (8, 'Nombre8', 'SNombre8', 'Apellido8', 'SApellido8', 'Direccion 8', 'persona8@mail.com', '0801000008');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (9, 'Nombre9', 'SNombre9', 'Apellido9', 'SApellido9', 'Direccion 9', 'persona9@mail.com', '0801000009');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (10, 'Nombre10', 'SNombre10', 'Apellido10', 'SApellido10', 'Direccion 10', 'persona10@mail.com', '0801000010');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (11, 'Nombre11', 'SNombre11', 'Apellido11', 'SApellido11', 'Direccion 11', 'persona11@mail.com', '0801000011');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (12, 'Nombre12', 'SNombre12', 'Apellido12', 'SApellido12', 'Direccion 12', 'persona12@mail.com', '0801000012');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (13, 'Nombre13', 'SNombre13', 'Apellido13', 'SApellido13', 'Direccion 13', 'persona13@mail.com', '0801000013');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (14, 'Nombre14', 'SNombre14', 'Apellido14', 'SApellido14', 'Direccion 14', 'persona14@mail.com', '0801000014');
INSERT INTO Persona (idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, numIdentidad) VALUES (15, 'Nombre15', 'SNombre15', 'Apellido15', 'SApellido15', 'Direccion 15', 'persona15@mail.com', '0801000015');

-- Inserts para tabla Telefono
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (1, '99991001', 1, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (2, '99991002', 2, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (3, '99991003', 3, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (4, '99991004', 4, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (5, '99991005', 5, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (6, '99991006', 6, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (7, '99991007', 7, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (8, '99991008', 8, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (9, '99991009', 9, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (10, '99991010', 10, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (11, '99991011', 11, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (12, '99991012', 12, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (13, '99991013', 13, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (14, '99991014', 14, 'M');
INSERT INTO Telefono (idTelefono, numero, idPersona, tipoTelefono) VALUES (15, '99991015', 15, 'M');

-- Inserts para tabla Cliente
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (1, 1, '2022-09-22');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (2, 2, '2023-06-15');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (3, 3, '2023-02-03');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (4, 4, '2022-08-18');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (5, 5, '2023-09-19');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (6, 6, '2022-12-10');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (7, 7, '2022-04-14');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (8, 8, '2023-12-04');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (9, 9, '2022-06-27');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (10, 10, '2022-10-23');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (11, 11, '2023-07-13');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (12, 12, '2023-01-03');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (13, 13, '2022-11-30');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (14, 14, '2023-03-28');
INSERT INTO Cliente (idCliente, idPersona, fechaRegistro) VALUES (15, 15, '2022-05-21');

-- Inserts para tabla AreaTrabajo
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (1, 'Área 1');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (2, 'Área 2');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (3, 'Área 3');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (4, 'Área 4');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (5, 'Área 5');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (6, 'Área 6');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (7, 'Área 7');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (8, 'Área 8');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (9, 'Área 9');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (10, 'Área 10');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (11, 'Área 11');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (12, 'Área 12');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (13, 'Área 13');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (14, 'Área 14');
INSERT INTO AreaTrabajo (idAreaTrabajo, descripcion) VALUES (15, 'Área 15');

-- Inserts para tabla Empleado
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (1, 1, 1, '2022-03-27');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (2, 2, 2, '2022-04-06');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (3, 3, 3, '2021-10-14');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (4, 4, 4, '2022-10-23');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (5, 5, 5, '2022-07-03');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (6, 6, 6, '2022-12-21');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (7, 7, 7, '2022-06-19');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (8, 8, 8, '2021-12-09');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (9, 9, 9, '2021-10-02');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (10, 10, 10, '2021-07-21');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (11, 11, 11, '2022-04-16');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (12, 12, 12, '2021-09-22');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (13, 13, 13, '2022-08-03');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (14, 14, 14, '2022-12-02');
INSERT INTO Empleado (idEmpleado, idPersona, idAreaTrabajo, fechaRegistro) VALUES (15, 15, 15, '2022-05-08');



INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (1, 1, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (2, 2, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (3, 3, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (4, 4, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (5, 5, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (6, 6, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (7, 7, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (8, 8, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (9, 9, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (10, 10, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (11, 11, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (12, 12, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (13, 13, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (14, 14, '2022-01-01', NULL);
INSERT INTO Empleado_has_Cargo (idEmpleado, idCargo, fechaNombramiento, fechaFin) VALUES (15, 15, '2022-01-01', NULL);



INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (1, 'Cargo 1', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (2, 'Cargo 2', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (3, 'Cargo 3', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (4, 'Cargo 4', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (5, 'Cargo 5', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (6, 'Cargo 6', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (7, 'Cargo 7', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (8, 'Cargo 8', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (9, 'Cargo 9', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (10, 'Cargo 10', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (11, 'Cargo 11', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (12, 'Cargo 12', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (13, 'Cargo 13', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (14, 'Cargo 14', 'A');
INSERT INTO Cargo (idCargo, descripcion, estado) VALUES (15, 'Cargo 15', 'A');






-- Inserts en dimAreaTrabajo
INSERT INTO dimAreaTrabajo (id, descripcion, VERSION, VERSION_ACTUAL)
VALUES (1, 'Tecnología', 1, 1),
	   (2, 'Finanzas', 1, 1),
       (3, 'Recursos Humanos', 1, 1),
       (4, 'Marketing', 1, 1),
       (5, 'Ventas', 1, 1),
       (6, 'Atención al Cliente', 1, 1),
       (7, 'Legal', 1, 1),
       (8, 'Compras', 1, 1),
       (9, 'Logística', 1, 1),
       (10, 'Administración', 1, 1);


-- Inserts en dimCargo

INSERT INTO dimCargo (id, descripcion, estado, VERSION, VERSION_ACTUAL) VALUES
(1, 'Analista de sistemas', 'A', 1, 1),
(2, 'Gerente', 'A', 1, 1),
(3, 'Programador', 'A', 1, 1),
(4, 'Diseñador', 'A', 1, 1),
(5, 'Técnico', 'A', 1, 1),
(6, 'Asistente', 'A', 1, 1),
(7, 'Supervisor', 'A', 1, 1),
(8, 'Consultor', 'A', 1, 1),
(9, 'Operador', 'A', 1, 1),
(10, 'Coordinador', 'A', 1, 1);


-- Inserts en dimTiempo

INSERT INTO dimTiempo (id, fecha, anio, mes, dia) VALUES
(1, '2022-01-10', 2022, 1, 10),
(2, '2022-05-15', 2022, 5, 15),
(3, '2023-02-01', 2023, 2, 1),
(4, '2023-07-10', 2023, 7, 10),
(5, '2024-03-05', 2024, 3, 5),
(6, '2024-06-20', 2024, 6, 20),
(7, '2024-09-15', 2024, 9, 15),
(8, '2024-11-30', 2024, 11, 30),
(9, '2025-01-01', 2025, 1, 1),
(10, '2025-04-01', 2025, 4, 1);


-- Inserts en dimEmpleado

INSERT INTO dimEmpleado (id, nombreCompleto, correo, direccion, identidad, fechaRegistro, idAreaTrabajo, VERSION, VERSION_ACTUAL) VALUES
(1, 'María López', 'maria.lopez@empresa.com', 'Col. Kennedy, Tegucigalpa', '0801199001234', '2022-01-10', 1, 1, 1),
(2, 'Juan Pérez', 'juan.perez@empresa.com', 'Col. Palmira, Tegucigalpa', '0801199105678', '2022-05-15', 2, 1, 1),
(3, 'Lucía Sánchez', 'lucia.sanchez@empresa.com', 'Col. Alameda, Tegucigalpa', '0801198909876', '2023-02-01', 3, 1, 1),
(4, 'Carlos García', 'carlos.garcia@empresa.com', 'Comayagüela Centro', '0801198701234', '2023-07-10', 4, 1, 1),
(5, 'Ana Torres', 'ana.torres@empresa.com', 'Col. El Hatillo, Tegucigalpa', '0801198508765', '2024-03-05', 5, 1, 1),
(6, 'Pedro Martínez', 'pedro.martinez@empresa.com', 'Santa Lucía, FM', '0801199303456', '2024-06-20', 6, 1, 1),
(7, 'Laura Díaz', 'laura.diaz@empresa.com', 'La Leona, Tegucigalpa', '0801199206543', '2024-09-15', 7, 1, 1),
(8, 'Daniela Reyes', 'daniela.reyes@empresa.com', 'San Pedro Sula Centro', '0801199607654', '2024-11-30', 8, 1, 1),
(9, 'José Ramírez', 'jose.ramirez@empresa.com', 'Col. Florencia, Tegucigalpa', '0801199708765', '2025-01-01', 9, 1, 1),
(10, 'Patricia Castro', 'patricia.castro@empresa.com', 'Col. Miramontes, Tegucigalpa', '0801199809876', '2025-04-01', 10, 1, 1);


-- Inserts en factEmpleadoCargo

INSERT INTO factEmpleadoCargo (idEmpleado, idCargo, idAreaTrabajo, idTiempo, fechaNombramiento, fechaFin) VALUES
(1, 1, 1, 1, '2022-01-10', NULL),
(2, 2, 2, 2, '2022-05-15', NULL),
(3, 3, 3, 3, '2023-02-01', NULL),
(4, 4, 4, 4, '2023-07-10', NULL),
(5, 5, 5, 5, '2024-03-05', NULL),
(6, 6, 6, 6, '2024-06-20', NULL),
(7, 7, 7, 7, '2024-09-15', NULL),
(8, 8, 8, 8, '2024-11-30', NULL),
(9, 9, 9, 9, '2025-01-01', NULL),
(10, 10, 10, 10, '2025-04-01', NULL);


-- Inserts en factEmpleadoBien

INSERT INTO factEmpleadoBien (idEmpleado, idBien, fechaAsignacion, fechaFin) VALUES
(1, 101, '2022-02-01', NULL),
(2, 102, '2022-06-01', NULL),
(3, 103, '2023-03-01', NULL),
(4, 104, '2023-08-01', NULL),
(5, 105, '2024-04-01', NULL),
(6, 106, '2024-07-01', NULL),
(7, 107, '2024-10-01', NULL),
(8, 108, '2024-12-15', NULL),
(9, 109, '2025-02-01', NULL),
(10, 110, '2025-04-10', NULL);
