-- Paquetes

--1. Paquete PKG_GESTION_ADMINISTRATIVA
-- Definicin del Paquete
CREATE OR REPLACE PACKAGE PKG_GESTION_ADMINISTRATIVA AS

    -- Procedimientos
    PROCEDURE InsertarBanco(p_nombre VARCHAR2, p_direccion VARCHAR2);
    PROCEDURE InsertarSucursal(p_nombreSucursal VARCHAR2, p_direccion VARCHAR2, p_idBanco NUMBER);
    PROCEDURE InsertarPersona(p_primerNombre VARCHAR2, p_segundoNombre VARCHAR2, p_primerApellido VARCHAR2, 
                              p_segundoApellido VARCHAR2, p_direccion VARCHAR2, p_correoElectronico VARCHAR2, 
                              p_fechaNacimiento DATE, p_DNI VARCHAR2);
    PROCEDURE InsertarTelefono(p_numero VARCHAR2, p_tipo VARCHAR2, p_idPersona NUMBER);
    PROCEDURE InsertarEmpleado(p_idSucursal NUMBER, p_idPersona NUMBER);
    PROCEDURE InsertarCargo(p_nombre VARCHAR2);
    PROCEDURE InsertarEmpleadoCargo(p_idEmpleado NUMBER, p_idCargo NUMBER, p_fechaInicio DATE, p_fechaFin DATE);
    PROCEDURE InsertarCliente(p_fechaRegistro DATE, p_idPersona NUMBER);

    -- Funciones
    FUNCTION ObtenerTotalBancos RETURN NUMBER;
    FUNCTION ObtenerTotalSucursales RETURN NUMBER;
    FUNCTION ObtenerTotalPersonas RETURN NUMBER;
    FUNCTION ObtenerTotalEmpleados RETURN NUMBER;
    FUNCTION ObtenerTotalClientes RETURN NUMBER;

END PKG_GESTION_ADMINISTRATIVA;
/


-- Implementacion del Paquete PKG_GESTION_ADMINISTRATIVA
CREATE OR REPLACE PACKAGE BODY PKG_GESTION_ADMINISTRATIVA AS

    -- Procedimiento para insertar un nuevo banco
    PROCEDURE InsertarBanco(p_nombre VARCHAR2, p_direccion VARCHAR2) IS
    BEGIN
        INSERT INTO Banco (nombre, direccion) VALUES (p_nombre, p_direccion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarBanco;

    -- Procedimiento para insertar una nueva sucursal
    PROCEDURE InsertarSucursal(p_nombreSucursal VARCHAR2, p_direccion VARCHAR2, p_idBanco NUMBER) IS
    BEGIN
        INSERT INTO Sucursal (NombreSucursal, direccion, id_Banco) VALUES (p_nombreSucursal, p_direccion, p_idBanco);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarSucursal;

    -- Procedimiento para insertar una nueva persona
    PROCEDURE InsertarPersona(p_primerNombre VARCHAR2, p_segundoNombre VARCHAR2, p_primerApellido VARCHAR2, 
                              p_segundoApellido VARCHAR2, p_direccion VARCHAR2, p_correoElectronico VARCHAR2, 
                              p_fechaNacimiento DATE, p_DNI VARCHAR2) IS
    BEGIN
        INSERT INTO Persona (primerNombre, segundoNombre, primerApellido, segundoApellido, direccion, 
                             correoElectronico, fechaNacimiento, DNI)
        VALUES (p_primerNombre, p_segundoNombre, p_primerApellido, p_segundoApellido, p_direccion, 
                p_correoElectronico, p_fechaNacimiento, p_DNI);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarPersona;

    -- Procedimiento para insertar un nuevo telefono
    PROCEDURE InsertarTelefono(p_numero VARCHAR2, p_tipo VARCHAR2, p_idPersona NUMBER) IS
    BEGIN
        INSERT INTO Telefono (numero, tipo, idPersona) VALUES (p_numero, p_tipo, p_idPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTelefono;

    -- Procedimiento para insertar un nuevo empleado
    PROCEDURE InsertarEmpleado(p_idSucursal NUMBER, p_idPersona NUMBER) IS
    BEGIN
        INSERT INTO Empleado (idSucursal, idPersona) VALUES (p_idSucursal, p_idPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarEmpleado;

    -- Procedimiento para insertar un nuevo cargo
    PROCEDURE InsertarCargo(p_nombre VARCHAR2) IS
    BEGIN
        INSERT INTO Cargo (nombre) VALUES (p_nombre);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarCargo;

    -- Procedimiento para insertar un nuevo empleado-cargo
    PROCEDURE InsertarEmpleadoCargo(p_idEmpleado NUMBER, p_idCargo NUMBER, p_fechaInicio DATE, p_fechaFin DATE) IS
    BEGIN
        INSERT INTO EmpleadoCargo (idEmpleado, idCargo, fechaInicio, fechaFin) VALUES (p_idEmpleado, p_idCargo, p_fechaInicio, p_fechaFin);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarEmpleadoCargo;

    -- Procedimiento para insertar un nuevo cliente
    PROCEDURE InsertarCliente(p_fechaRegistro DATE, p_idPersona NUMBER) IS
    BEGIN
        INSERT INTO Cliente (fechaRegistro, idPersona) VALUES (p_fechaRegistro, p_idPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarCliente;

    -- Funcion para obtener el total de bancos
    FUNCTION ObtenerTotalBancos RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Banco;
        RETURN v_total;
    END ObtenerTotalBancos;

    -- Funcion para obtener el total de sucursales
    FUNCTION ObtenerTotalSucursales RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Sucursal;
        RETURN v_total;
    END ObtenerTotalSucursales;

    -- Funcion para obtener el total de personas
    FUNCTION ObtenerTotalPersonas RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Persona;
        RETURN v_total;
    END ObtenerTotalPersonas;

    -- Funcion para obtener el total de empleados
    FUNCTION ObtenerTotalEmpleados RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Empleado;
        RETURN v_total;
    END ObtenerTotalEmpleados;

    -- Funcion para obtener el total de clientes
    FUNCTION ObtenerTotalClientes RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Cliente;
        RETURN v_total;
    END ObtenerTotalClientes;

END PKG_GESTION_ADMINISTRATIVA;
/






--Pruebas
-- Prueba de Insercion de Banco
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarBanco('Banco Ejemplo', 'Calle Principal 123');
    DBMS_OUTPUT.PUT_LINE('Banco insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar banco: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Sucursal
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarSucursal('Sucursal Ejemplo', 'Calle Secundaria 456', 1);
    DBMS_OUTPUT.PUT_LINE('Sucursal insertada con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar sucursal: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Persona
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarPersona('Juan', 'Perez', 'Garcia', 'Lopez', 'Calle 789', 
                                                'juan@example.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 
                                                '12345678');
    DBMS_OUTPUT.PUT_LINE('Persona insertada con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar persona: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Telefono
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarTelefono('987654321', 'Movil', 1);
    DBMS_OUTPUT.PUT_LINE('Telefono insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar telefono: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Empleado
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarEmpleado(1, 1);
    DBMS_OUTPUT.PUT_LINE('Empleado insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar empleado: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Cargo
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarCargo('Gerente');
    DBMS_OUTPUT.PUT_LINE('Cargo insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar cargo: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Empleado-Cargo
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarEmpleadoCargo(1, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Empleado-Cargo insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar empleado-cargo: ' || SQLERRM);
END;
/

-- Prueba de Insercion de Cliente
BEGIN
    PKG_GESTION_ADMINISTRATIVA.InsertarCliente(SYSDATE, 1);
    DBMS_OUTPUT.PUT_LINE('Cliente insertado con exito.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar cliente: ' || SQLERRM);
END;
/

-- Prueba de Obtencion del Total de Bancos
DECLARE
    v_total NUMBER;
BEGIN
    v_total := PKG_GESTION_ADMINISTRATIVA.ObtenerTotalBancos;
    DBMS_OUTPUT.PUT_LINE('Total de bancos: ' || v_total);
END;
/

-- Prueba de Obtencion del Total de Sucursales
DECLARE
    v_total NUMBER;
BEGIN
    v_total := PKG_GESTION_ADMINISTRATIVA.ObtenerTotalSucursales;
    DBMS_OUTPUT.PUT_LINE('Total de sucursales: ' || v_total);
END;
/

-- Prueba de Obtencion del Total de Personas
DECLARE
    v_total NUMBER;
BEGIN
    v_total := PKG_GESTION_ADMINISTRATIVA.ObtenerTotalPersonas;
    DBMS_OUTPUT.PUT_LINE('Total de personas: ' || v_total);
END;
/

-- Prueba de Obtencion del Total de Empleados
DECLARE
    v_total NUMBER;
BEGIN
    v_total := PKG_GESTION_ADMINISTRATIVA.ObtenerTotalEmpleados;
    DBMS_OUTPUT.PUT_LINE('Total de empleados: ' || v_total);
END;
/








--2. Paquete PKG_REFERENCIAS
-- Definicion del Paquete
CREATE OR REPLACE PACKAGE PKG_REFERENCIAS AS

    -- Procedimientos
    PROCEDURE InsertarReferencia(p_fechaRegistro DATE, p_idPersona NUMBER);
    PROCEDURE InsertarClienteReferencia(p_idCliente NUMBER, p_idReferencia NUMBER, p_tipoReferencia VARCHAR2, p_observaciones CLOB);
    PROCEDURE ActualizarReferencia(p_idReferencia NUMBER, p_fechaRegistro DATE, p_idPersona NUMBER);
    PROCEDURE EliminarReferencia(p_idReferencia NUMBER);
    PROCEDURE EliminarClienteReferencia(p_idClienteReferencia NUMBER);

    -- Funciones
    FUNCTION ObtenerTotalReferencias RETURN NUMBER;
    FUNCTION ObtenerTotalClienteReferencias RETURN NUMBER;

END PKG_REFERENCIAS;
/

-- Implementacion del Paquete PKG_REFERENCIAS
CREATE OR REPLACE PACKAGE BODY PKG_REFERENCIAS AS

    -- Procedimiento para insertar una nueva referencia
    PROCEDURE InsertarReferencia(p_fechaRegistro DATE, p_idPersona NUMBER) IS
    BEGIN
        INSERT INTO Referencias (fechaRegistro, idPersona) VALUES (p_fechaRegistro, p_idPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarReferencia;

    -- Procedimiento para insertar una nueva relacion cliente-referencia
    PROCEDURE InsertarClienteReferencia(p_idCliente NUMBER, p_idReferencia NUMBER, p_tipoReferencia VARCHAR2, p_observaciones CLOB) IS
    BEGIN
        INSERT INTO ClienteReferencia (idCliente, idReferencia, TipoReferencia, Observaciones) 
        VALUES (p_idCliente, p_idReferencia, p_tipoReferencia, p_observaciones);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarClienteReferencia;

    -- Procedimiento para actualizar una referencia existente
    PROCEDURE ActualizarReferencia(p_idReferencia NUMBER, p_fechaRegistro DATE, p_idPersona NUMBER) IS
    BEGIN
        UPDATE Referencias SET fechaRegistro = p_fechaRegistro, idPersona = p_idPersona 
        WHERE id = p_idReferencia;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END ActualizarReferencia;

    -- Procedimiento para eliminar una referencia
    PROCEDURE EliminarReferencia(p_idReferencia NUMBER) IS
    BEGIN
        DELETE FROM Referencias WHERE id = p_idReferencia;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END EliminarReferencia;

    -- Procedimiento para eliminar una relacion cliente-referencia
    PROCEDURE EliminarClienteReferencia(p_idClienteReferencia NUMBER) IS
    BEGIN
        DELETE FROM ClienteReferencia WHERE id = p_idClienteReferencia;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END EliminarClienteReferencia;

    -- Funcion para obtener el total de referencias
    FUNCTION ObtenerTotalReferencias RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Referencias;
        RETURN v_total;
    END ObtenerTotalReferencias;

    -- Funcion para obtener el total de relaciones cliente-referencia
    FUNCTION ObtenerTotalClienteReferencias RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM ClienteReferencia;
        RETURN v_total;
    END ObtenerTotalClienteReferencias;

END PKG_REFERENCIAS;
/






-- 3. Paquete PKG_TARJETA_CREDITO
-- Definicion del Paquete
CREATE OR REPLACE PACKAGE PKG_TARJETA_CREDITO AS

    -- Procedimientos
    PROCEDURE InsertarTipoTarjeta(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarTarjetaCredito(p_fechaEmision DATE, p_fechaVencimiento DATE, p_numero VARCHAR2, p_cvv VARCHAR2, p_idCliente NUMBER, p_idTipoTarjeta NUMBER);
    PROCEDURE InsertarTipoMovimiento(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarMovimiento(p_fecha DATE, p_monto NUMBER, p_idTarjeta NUMBER, p_idTipoMovimiento NUMBER);
    PROCEDURE InsertarRubro(p_nombre VARCHAR2, p_estado VARCHAR2);

    -- Funciones
    FUNCTION ObtenerTotalTarjetas RETURN NUMBER;
    FUNCTION ObtenerTotalMovimientos RETURN NUMBER;

END PKG_TARJETA_CREDITO;
/

-- Implementacion del Paquete PKG_TARJETA_CREDITO
CREATE OR REPLACE PACKAGE BODY PKG_TARJETA_CREDITO AS

    -- Procedimiento para insertar un nuevo tipo de tarjeta
    PROCEDURE InsertarTipoTarjeta(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoTarjeta (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoTarjeta;

    -- Procedimiento para insertar una nueva tarjeta de credito
    PROCEDURE InsertarTarjetaCredito(p_fechaEmision DATE, p_fechaVencimiento DATE, p_numero VARCHAR2, p_cvv VARCHAR2, p_idCliente NUMBER, p_idTipoTarjeta NUMBER) IS
    BEGIN
        INSERT INTO TarjetaCredito (fechaEmision, fechaVencimiento, Numero, CVV, idCliente, idTipoTarjeta) 
        VALUES (p_fechaEmision, p_fechaVencimiento, p_numero, p_cvv, p_idCliente, p_idTipoTarjeta);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTarjetaCredito;

    -- Procedimiento para insertar un nuevo tipo de movimiento
    PROCEDURE InsertarTipoMovimiento(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoMovimiento (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoMovimiento;

    -- Procedimiento para insertar un nuevo movimiento
    PROCEDURE InsertarMovimiento(p_fecha DATE, p_monto NUMBER, p_idTarjeta NUMBER, p_idTipoMovimiento NUMBER) IS
    BEGIN
        INSERT INTO Movimiento (fecha, monto, idTarjeta, idTipoMovimiento) 
        VALUES (p_fecha, p_monto, p_idTarjeta, p_idTipoMovimiento);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarMovimiento;

    -- Procedimiento para insertar un nuevo rubro
    PROCEDURE InsertarRubro(p_nombre VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO Rubro (Nombre, Estado) VALUES (p_nombre, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarRubro;

    -- Funcion para obtener el total de tarjetas de credito
    FUNCTION ObtenerTotalTarjetas RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM TarjetaCredito;
        RETURN v_total;
    END ObtenerTotalTarjetas;

    -- Funcion para obtener el total de movimientos
    FUNCTION ObtenerTotalMovimientos RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Movimiento;
        RETURN v_total;
    END ObtenerTotalMovimientos;

END PKG_TARJETA_CREDITO;
/







-- 4. Paquete PKG_CUENTA_BANCARIA
-- Definicion del Paquete
CREATE OR REPLACE PACKAGE PKG_CUENTA_BANCARIA AS

    -- Procedimientos
    PROCEDURE InsertarTipoCuenta(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarCuenta(p_numCuenta VARCHAR2, p_saldo NUMBER, p_idTipoCuenta NUMBER, p_idCliente NUMBER, p_idSucursal NUMBER);
    PROCEDURE InsertarTarjetaDebito(p_numeroTarjeta VARCHAR2, p_fechaExpiracion DATE, p_cvv VARCHAR2, p_idCuenta NUMBER);
    PROCEDURE InsertarTipoTransaccion(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarTransaccion(p_fecha DATE, p_monto NUMBER, p_origen VARCHAR2, p_idCuenta NUMBER, p_idTipoTransaccion NUMBER, p_idSucursal NUMBER, p_idTarjetaDebito NUMBER);

    -- Funciones
    FUNCTION ObtenerTotalCuentas RETURN NUMBER;
    FUNCTION ObtenerTotalTransacciones RETURN NUMBER;

END PKG_CUENTA_BANCARIA;
/

-- Implementacion del Paquete PKG_CUENTA_BANCARIA
CREATE OR REPLACE PACKAGE BODY PKG_CUENTA_BANCARIA AS

    -- Procedimiento para insertar un nuevo tipo de cuenta
    PROCEDURE InsertarTipoCuenta(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoCuenta (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoCuenta;

    -- Procedimiento para insertar una nueva cuenta
    PROCEDURE InsertarCuenta(p_numCuenta VARCHAR2, p_saldo NUMBER, p_idTipoCuenta NUMBER, p_idCliente NUMBER, p_idSucursal NUMBER) IS
    BEGIN
        INSERT INTO Cuenta (numCuenta, saldo, idTipoCuenta, idCliente, idSucursal) 
        VALUES (p_numCuenta, p_saldo, p_idTipoCuenta, p_idCliente, p_idSucursal);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarCuenta;

    -- Procedimiento para insertar una nueva tarjeta de debito
    PROCEDURE InsertarTarjetaDebito(p_numeroTarjeta VARCHAR2, p_fechaExpiracion DATE, p_cvv VARCHAR2, p_idCuenta NUMBER) IS
    BEGIN
        INSERT INTO TarjetaDebito (numeroTarjeta, fechaExpiracion, cvv, idCuenta) 
        VALUES (p_numeroTarjeta, p_fechaExpiracion, p_cvv, p_idCuenta);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTarjetaDebito;

    -- Procedimiento para insertar un nuevo tipo de transaccion
    PROCEDURE InsertarTipoTransaccion(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoTransaccion (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoTransaccion;

    -- Procedimiento para insertar una nueva transaccion
    PROCEDURE InsertarTransaccion(p_fecha DATE, p_monto NUMBER, p_origen VARCHAR2, p_idCuenta NUMBER, p_idTipoTransaccion NUMBER, p_idSucursal NUMBER, p_idTarjetaDebito NUMBER) IS
    BEGIN
        INSERT INTO Transaccion (fecha, monto, origen, idCuenta, idTipoTransaccion, idSucursal, idTarjetaDebito) 
        VALUES (p_fecha, p_monto, p_origen, p_idCuenta, p_idTipoTransaccion, p_idSucursal, p_idTarjetaDebito);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTransaccion;

    -- Funcion para obtener el total de cuentas
    FUNCTION ObtenerTotalCuentas RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Cuenta;
        RETURN v_total;
    END ObtenerTotalCuentas;

    -- Funcion para obtener el total de transacciones
    FUNCTION ObtenerTotalTransacciones RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Transaccion;
        RETURN v_total;
    END ObtenerTotalTransacciones;

END PKG_CUENTA_BANCARIA;
/





-- 5. Paquete PKG_PRESTAMO
-- Definicion del Paquete
CREATE OR REPLACE PACKAGE PKG_PRESTAMO AS

    -- Procedimientos
    PROCEDURE InsertarTipoPrestamo(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarPrestamo(p_monto NUMBER, p_interes NUMBER, p_plazoMensual NUMBER, p_fechaDesembolso DATE, p_idCliente NUMBER, p_idTipoPrestamo NUMBER);
    PROCEDURE InsertarTipoInteres(p_descripcion VARCHAR2, p_estado VARCHAR2);
    PROCEDURE InsertarPrestamoTipoInteres(p_idPrestamo NUMBER, p_idTipoInteres NUMBER, p_porcentaje NUMBER, p_fechaInicio DATE, p_fechaFin DATE);
    PROCEDURE InsertarPagoPrestamo(p_fecha DATE, p_monto NUMBER, p_idPrestamo NUMBER);
    PROCEDURE InsertarCobroPrestamo(p_fecha DATE, p_monto NUMBER, p_idPrestamo NUMBER);

    -- Funciones
    FUNCTION ObtenerTotalPrestamos RETURN NUMBER;
    FUNCTION ObtenerTotalPagos RETURN NUMBER;

END PKG_PRESTAMO;
/

-- Implementacion del Paquete PKG_PRESTAMO
CREATE OR REPLACE PACKAGE BODY PKG_PRESTAMO AS

    -- Procedimiento para insertar un nuevo tipo de prestamo
    PROCEDURE InsertarTipoPrestamo(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoPrestamo (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoPrestamo;

    -- Procedimiento para insertar un nuevo prestamo
    PROCEDURE InsertarPrestamo(p_monto NUMBER, p_interes NUMBER, p_plazoMensual NUMBER, p_fechaDesembolso DATE, p_idCliente NUMBER, p_idTipoPrestamo NUMBER) IS
    BEGIN
        INSERT INTO Prestamo (monto, interes, plazoMensual, fechaDesembolso, idCliente, idTipoPrestamo) 
        VALUES (p_monto, p_interes, p_plazoMensual, p_fechaDesembolso, p_idCliente, p_idTipoPrestamo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarPrestamo;

    -- Procedimiento para insertar un nuevo tipo de interes
    PROCEDURE InsertarTipoInteres(p_descripcion VARCHAR2, p_estado VARCHAR2) IS
    BEGIN
        INSERT INTO TipoInteres (descripcion, estado) VALUES (p_descripcion, p_estado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarTipoInteres;

    -- Procedimiento para insertar la relacion entre prestamo y tipo de interes
    PROCEDURE InsertarPrestamoTipoInteres(p_idPrestamo NUMBER, p_idTipoInteres NUMBER, p_porcentaje NUMBER, p_fechaInicio DATE, p_fechaFin DATE) IS
    BEGIN
        INSERT INTO PrestamoTipoInteres (idPrestamo, idTipoInteres, porcentaje, fechaInicio, fechaFin) 
        VALUES (p_idPrestamo, p_idTipoInteres, p_porcentaje, p_fechaInicio, p_fechaFin);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarPrestamoTipoInteres;

    -- Procedimiento para insertar un nuevo pago de prestamo
    PROCEDURE InsertarPagoPrestamo(p_fecha DATE, p_monto NUMBER, p_idPrestamo NUMBER) IS
    BEGIN
        INSERT INTO PagoPrestamo (fecha, monto, idPrestamo) 
        VALUES (p_fecha, p_monto, p_idPrestamo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarPagoPrestamo;

    -- Procedimiento para insertar un nuevo cobro de prestamo
    PROCEDURE InsertarCobroPrestamo(p_fecha DATE, p_monto NUMBER, p_idPrestamo NUMBER) IS
    BEGIN
        INSERT INTO CobroPrestamo (fecha, monto, idPrestamo) 
        VALUES (p_fecha, p_monto, p_idPrestamo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; -- Deshacer cambios si ocurre un error
            RAISE; -- Lanzar el error para ser manejado externamente
    END InsertarCobroPrestamo;

    -- Funcion para obtener el total de prestamos
    FUNCTION ObtenerTotalPrestamos RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Prestamo;
        RETURN v_total;
    END ObtenerTotalPrestamos;

    -- Funcion para obtener el total de pagos
    FUNCTION ObtenerTotalPagos RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM PagoPrestamo;
        RETURN v_total;
    END ObtenerTotalPagos;

END PKG_PRESTAMO;
/








--6. Paquete PKG_SOLICITUD_PRESTAMO
--Definicion del Paquete
CREATE OR REPLACE PACKAGE PKG_SOLICITUD_PRESTAMO AS 

    -- Procedimientos
    PROCEDURE InsertarSolicitud(p_idCliente NUMBER, p_idTipoSolicitud NUMBER, p_monto NUMBER, p_motivo CLOB, p_fecha DATE);
    PROCEDURE ActualizarSolicitud(p_idSolicitud NUMBER, p_monto NUMBER, p_motivo CLOB);
    PROCEDURE EliminarSolicitud(p_idSolicitud NUMBER);
    PROCEDURE AprobarSolicitud(p_idSolicitud NUMBER, p_idEmpleado NUMBER);
    PROCEDURE RechazarSolicitud(p_idSolicitud NUMBER, p_motivo CLOB);

    -- Funciones
    FUNCTION TotalPrestamosAprobados RETURN NUMBER;
    FUNCTION CantidadSolicitudesPorCliente(p_idCliente NUMBER) RETURN NUMBER;

END PKG_SOLICITUD_PRESTAMO;
/



--Implementacion del Paquete
CREATE OR REPLACE PACKAGE BODY PKG_SOLICITUD_PRESTAMO AS 

    -- Procedimiento para insertar una nueva solicitud de prestamo
    PROCEDURE InsertarSolicitud(p_idCliente NUMBER, p_idTipoSolicitud NUMBER, p_monto NUMBER, p_motivo CLOB, p_fecha DATE) IS
    BEGIN
        INSERT INTO SolicitudPrestamo (fecha, monto, motivo, idTipoSolicitud, idCliente)
        VALUES (p_fecha, p_monto, p_motivo, p_idTipoSolicitud, p_idCliente);
        COMMIT;
    END InsertarSolicitud;

    -- Procedimiento para actualizar el monto y motivo de una solicitud existente
    PROCEDURE ActualizarSolicitud(p_idSolicitud NUMBER, p_monto NUMBER, p_motivo CLOB) IS
    BEGIN
        UPDATE SolicitudPrestamo
        SET monto = p_monto, motivo = p_motivo
        WHERE id = p_idSolicitud;
        COMMIT;
    END ActualizarSolicitud;

    -- Procedimiento para eliminar una solicitud de prestamo
    PROCEDURE EliminarSolicitud(p_idSolicitud NUMBER) IS
    BEGIN
        DELETE FROM SolicitudPrestamo WHERE id = p_idSolicitud;
        COMMIT;
    END EliminarSolicitud;



-- Procedimiento para aprobar una solicitud de prestamo
PROCEDURE AprobarSolicitud(p_idSolicitud NUMBER, p_idEmpleado NUMBER) IS
    v_idFlujoAprobacion NUMBER;
BEGIN
    -- Obtener el id del flujo de aprobacion correspondiente a la solicitud
    SELECT id INTO v_idFlujoAprobacion 
    FROM FlujoAprobacion 
    WHERE idSolicitudPrestamo = p_idSolicitud;

    -- Insertar en la tabla EtapaFlujoAprobacion
    INSERT INTO EtapaFlujoAprobacion (idEtapa, idFlujoAprobacion, fechaInicio, fechaFin, estado, idEmpleado)
    VALUES (1, v_idFlujoAprobacion, SYSDATE, SYSDATE + 30, 'APROBADO', p_idEmpleado); -- Asignamos un valor a fechaFin

    COMMIT;
END AprobarSolicitud;

    -- Procedimiento para rechazar una solicitud de prestamo
    PROCEDURE RechazarSolicitud(p_idSolicitud NUMBER, p_motivo CLOB) IS
    BEGIN
        UPDATE SolicitudPrestamo 
        SET motivo = p_motivo
        WHERE id = p_idSolicitud;

        INSERT INTO EtapaFlujoAprobacion (idEtapa, idFlujoAprobacion, fechaInicio, fechaFin, estado, idEmpleado)
        VALUES (2, (SELECT id FROM FlujoAprobacion WHERE idSolicitudPrestamo = p_idSolicitud), SYSDATE, NULL, 'RECHAZADO', NULL);
        COMMIT;
    END RechazarSolicitud;

    -- Funcion para obtener el total de prestamos aprobados
    FUNCTION TotalPrestamosAprobados RETURN NUMBER IS
        v_total NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_total
        FROM SolicitudPrestamo sp
        JOIN EtapaFlujoAprobacion efa ON sp.id = efa.idFlujoAprobacion
        WHERE efa.estado = 'APROBADO';
        
        RETURN v_total;
    END TotalPrestamosAprobados;

    -- Funcion para contar la cantidad de solicitudes por cliente
    FUNCTION CantidadSolicitudesPorCliente(p_idCliente NUMBER) RETURN NUMBER IS
        v_cantidad NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_cantidad
        FROM SolicitudPrestamo
        WHERE idCliente = p_idCliente;
        
        RETURN v_cantidad;
    END CantidadSolicitudesPorCliente;

END PKG_SOLICITUD_PRESTAMO;
/




























--PAQUETE PARA VDEO DE LA PRCTICA:  Creacin e Implementacin de un Procedimiento Almacenado en un Paquete de Oracle
--Paquete: PKG_GESTION_PRESTAMO
--Este paquete gestionar las operaciones relacionadas con prstamos, incluyendo la creacin de prstamos, la asignacin 
--de tipos de inters, y la validacin de datos. El procedimiento principal es InsertarPrestamo.

-- Especificacin del Paquete
CREATE OR REPLACE PACKAGE PKG_GESTION_PRESTAMO AS

    -- Procedimiento para insertar un prstamo
    PROCEDURE InsertarPrestamo(
        pnMonto IN NUMBER,
        pnInteres IN NUMBER,
        pnPlazoMensual IN NUMBER,
        pdFechaDesembolso IN DATE,
        pnIdCliente IN NUMBER,
        pnIdTipoPrestamo IN NUMBER,
        pnIdPrestamo OUT NUMBER, -- Parmetro de salida (ID del prestamo creado)
        pvMensaje OUT VARCHAR2    -- Parmetro de salida (Mensaje de exito o error)
    );

    -- Funcin para validar si un cliente existe
    FUNCTION ValidarCliente(pnIdCliente IN NUMBER) RETURN BOOLEAN;

    -- Funcin para validar si un tipo de prstamo existe
    FUNCTION ValidarTipoPrestamo(pnIdTipoPrestamo IN NUMBER) RETURN BOOLEAN;

END PKG_GESTION_PRESTAMO;
/

-- Cuerpo del Paquete
CREATE OR REPLACE PACKAGE BODY PKG_GESTION_PRESTAMO AS

    -- Procedimiento para insertar un prestamo
    PROCEDURE InsertarPrestamo(
        pnMonto IN NUMBER,
        pnInteres IN NUMBER,
        pnPlazoMensual IN NUMBER,
        pdFechaDesembolso IN DATE,
        pnIdCliente IN NUMBER,
        pnIdTipoPrestamo IN NUMBER,
        pnIdPrestamo OUT NUMBER,
        pvMensaje OUT VARCHAR2
    ) IS
    BEGIN
        -- Validar que el cliente exista
        IF NOT ValidarCliente(pnIdCliente) THEN
            pvMensaje := 'Error: El cliente no existe.';
            RETURN;
        END IF;

        -- Validar que el tipo de prstamo exista
        IF NOT ValidarTipoPrestamo(pnIdTipoPrestamo) THEN
            pvMensaje := 'Error: El tipo de prestamo no existe.';
            RETURN;
        END IF;

        -- Insertar el prstamo
        INSERT INTO Prestamo (monto, interes, plazoMensual, fechaDesembolso, idCliente, idTipoPrestamo)
        VALUES (pnMonto, pnInteres, pnPlazoMensual, pdFechaDesembolso, pnIdCliente, pnIdTipoPrestamo)
        RETURNING id INTO pnIdPrestamo;

        -- Mensaje de xito
        pvMensaje := 'Prestamo insertado correctamente.';
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            pvMensaje := 'Error: ' || SQLERRM;
    END InsertarPrestamo;

    -- Funcin para validar si un cliente existe
    FUNCTION ValidarCliente(pnIdCliente IN NUMBER) RETURN BOOLEAN IS
        vnCount NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vnCount FROM Cliente WHERE id = pnIdCliente;
        RETURN (vnCount > 0);
    END ValidarCliente;

    -- Funcin para validar si un tipo de prstamo existe
    FUNCTION ValidarTipoPrestamo(pnIdTipoPrestamo IN NUMBER) RETURN BOOLEAN IS
        vnCount NUMBER;
    BEGIN
        SELECT COUNT(*) INTO vnCount FROM TipoPrestamo WHERE id = pnIdTipoPrestamo;
        RETURN (vnCount > 0);
    END ValidarTipoPrestamo;

END PKG_GESTION_PRESTAMO;
/

