-- ========================================
-- USUARIOS y ROLES (locales desde BDD)
-- ========================================

-- Activar modo para permitir nombres locales
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 1. CREACION DE ROLES (todos juntos)
CREATE ROLE rol_admin;
CREATE ROLE rol_empleado;
CREATE ROLE rol_cliente;
CREATE ROLE rol_referencia;
CREATE ROLE rol_auditor;

-- Roles por modulo
CREATE ROLE rol_gestion_admin;
CREATE ROLE rol_referencias;
CREATE ROLE rol_tarjeta;
CREATE ROLE rol_cuenta;
CREATE ROLE rol_prestamo;
CREATE ROLE rol_solicitud;

-- 2. CREACION DE USUARIOS (todos juntos)
CREATE USER usuario_admin IDENTIFIED BY admin123;
CREATE USER usuario_empleado IDENTIFIED BY empleado123;
CREATE USER usuario_cliente IDENTIFIED BY cliente123;
CREATE USER usuario_referencia IDENTIFIED BY referencia123;
CREATE USER usuario_auditor IDENTIFIED BY auditor123;

-- Usuarios por modulo
CREATE USER usuario_ges_admin IDENTIFIED BY gesadmin123;
CREATE USER usuario_ref IDENTIFIED BY ref123;
CREATE USER usuario_tarjeta IDENTIFIED BY tarjeta123;
CREATE USER usuario_cuenta IDENTIFIED BY cuenta123;
CREATE USER usuario_prestamo IDENTIFIED BY prestamo123;
CREATE USER usuario_solicitud IDENTIFIED BY solicitud123;

-- 3. ASIGNACION DE ROLES A USUARIOS
GRANT rol_admin TO usuario_admin;
GRANT rol_empleado TO usuario_empleado;
GRANT rol_cliente TO usuario_cliente;
GRANT rol_referencia TO usuario_referencia;
GRANT rol_auditor TO usuario_auditor;

-- Asignar roles por modulo
GRANT rol_gestion_admin TO usuario_ges_admin;
GRANT rol_referencias TO usuario_ref;
GRANT rol_tarjeta TO usuario_tarjeta;
GRANT rol_cuenta TO usuario_cuenta;
GRANT rol_prestamo TO usuario_prestamo;
GRANT rol_solicitud TO usuario_solicitud;

-- 4. OTORGAR PRIVILEGIOS A LOS ROLES
--  Asegurate que las tablas mencionadas existan o este paso fallara

-- rol_admin
GRANT ALL PRIVILEGES TO rol_admin;

-- rol_cliente
GRANT SELECT, INSERT, UPDATE ON CLIENTE TO rol_cliente;

-- rol_empleado
GRANT SELECT, INSERT, UPDATE, DELETE ON EMPLEADO TO rol_empleado;

-- rol_referencia
GRANT SELECT, INSERT, UPDATE ON REFERENCIAS TO rol_referencia;

-- rol_auditor
GRANT SELECT ON EMPLEADO TO rol_auditor;
GRANT SELECT ON CLIENTE TO rol_auditor;
GRANT SELECT ON REFERENCIAS TO rol_auditor;

-- rol_gestion_admin
GRANT SELECT, INSERT, UPDATE, DELETE ON Banco TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Sucursal TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Persona TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Telefono TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Empleado TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cargo TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON EmpleadoCargo TO rol_gestion_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente TO rol_gestion_admin;

-- rol_referencias
GRANT SELECT, INSERT, UPDATE, DELETE ON Referencias TO rol_referencias;
GRANT SELECT, INSERT, UPDATE, DELETE ON ClienteReferencia TO rol_referencias;

-- rol_tarjeta
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoTarjeta TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON TarjetaCredito TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoMovimiento TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Movimiento TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Rubro TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON TarjetaRubro TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Corte TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Moneda TO rol_tarjeta;
GRANT SELECT, INSERT, UPDATE, DELETE ON CorteMoneda TO rol_tarjeta;

-- rol_cuenta
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoCuenta TO rol_cuenta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cuenta TO rol_cuenta;
GRANT SELECT, INSERT, UPDATE, DELETE ON TarjetaDebito TO rol_cuenta;
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoTransaccion TO rol_cuenta;
GRANT SELECT, INSERT, UPDATE, DELETE ON Transaccion TO rol_cuenta;

-- rol_prestamo
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoPrestamo TO rol_prestamo;
GRANT SELECT, INSERT, UPDATE, DELETE ON Prestamo TO rol_prestamo;
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoInteres TO rol_prestamo;
GRANT SELECT, INSERT, UPDATE, DELETE ON PrestamoTipoInteres TO rol_prestamo;
GRANT SELECT, INSERT, UPDATE, DELETE ON PagoPrestamo TO rol_prestamo;
GRANT SELECT, INSERT, UPDATE, DELETE ON CobroPrestamo TO rol_prestamo;

-- rol_solicitud
GRANT SELECT, INSERT, UPDATE, DELETE ON TipoSolicitud TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON SolicitudPrestamo TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON Adjunto TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON Etapa TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON Regla TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON FlujoAprobacion TO rol_solicitud;
GRANT SELECT, INSERT, UPDATE, DELETE ON EtapaFlujoAprobacion TO rol_solicitud;
