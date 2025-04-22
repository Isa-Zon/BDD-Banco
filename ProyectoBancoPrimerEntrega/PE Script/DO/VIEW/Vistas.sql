-- Vistas

--Modulo Gestion Administrativa
--1. Vista de Bancos y sus Sucursales
CREATE OR REPLACE VIEW vista_bancos_sucursales AS
SELECT 
    b.id AS id_banco,
    b.nombre AS nombre_banco,
    s.id AS id_sucursal,
    s.NombreSucursal AS nombre_sucursal,
    s.direccion AS direccion_sucursal
FROM Banco b
LEFT JOIN Sucursal s ON b.id = s.id_Banco;

--2. Vista de Personas y sus Telefonos
CREATE OR REPLACE VIEW vista_personas_telefonos AS
SELECT 
    p.id AS id_persona,
    p.primerNombre,
    p.segundoNombre,
    p.primerApellido,
    p.segundoApellido,
    p.correoElectronico,
    p.DNI,
    t.numero AS telefono,
    t.tipo AS tipo_telefono
FROM Persona p
LEFT JOIN Telefono t ON p.id = t.idPersona;

--3. Vista de Empleados con su Sucursal y Cargo Actual
CREATE OR REPLACE VIEW vista_empleados_cargos AS
SELECT 
    e.id AS id_empleado,
    p.primerNombre,
    p.primerApellido,
    s.NombreSucursal AS sucursal,
    c.nombre AS cargo,
    ec.fechaInicio,
    ec.fechaFin
FROM Empleado e
JOIN Persona p ON e.idPersona = p.id
JOIN Sucursal s ON e.idSucursal = s.id
JOIN EmpleadoCargo ec ON e.id = ec.idEmpleado
JOIN Cargo c ON ec.idCargo = c.id
WHERE ec.fechaFin IS NULL OR ec.fechaFin >= SYSDATE;

--4. Vista de Clientes y su Informacion Personal
CREATE OR REPLACE VIEW vista_clientes AS
SELECT 
    c.id AS id_cliente,
    p.primerNombre,
    p.segundoNombre,
    p.primerApellido,
    p.segundoApellido,
    p.correoElectronico,
    p.DNI,
    c.fechaRegistro
FROM Cliente c
JOIN Persona p ON c.idPersona = p.id;

--5. Vista de Empleados y su Informacion Personal
CREATE OR REPLACE VIEW vista_empleados AS
SELECT 
    e.id AS id_empleado,
    p.primerNombre,
    p.segundoNombre,
    p.primerApellido,
    p.segundoApellido,
    p.correoElectronico,
    p.DNI,
    s.NombreSucursal AS sucursal
FROM Empleado e
JOIN Persona p ON e.idPersona = p.id
JOIN Sucursal s ON e.idSucursal = s.id;






--MODULO REFERENCIAS
--1. Vista de Referencias y sus Personas Asociadas
CREATE OR REPLACE VIEW vista_referencias AS
SELECT 
    r.id AS id_referencia,
    r.fechaRegistro,
    p.primerNombre,
    p.segundoNombre,
    p.primerApellido,
    p.segundoApellido,
    p.correoElectronico,
    p.DNI
FROM Referencias r
JOIN Persona p ON r.idPersona = p.id;

--2. Vista de Referencias de Clientes
CREATE OR REPLACE VIEW vista_cliente_referencias AS
SELECT 
    cr.id AS id_cliente_referencia,
    c.id AS id_cliente,
    p.primerNombre AS nombre_cliente,
    p.primerApellido AS apellido_cliente,
    r.id AS id_referencia,
    pr.primerNombre AS nombre_referencia,
    pr.primerApellido AS apellido_referencia,
    cr.TipoReferencia,
    cr.Observaciones
FROM ClienteReferencia cr
JOIN Cliente c ON cr.idCliente = c.id
JOIN Persona p ON c.idPersona = p.id
JOIN Referencias r ON cr.idReferencia = r.id
JOIN Persona pr ON r.idPersona = pr.id;





--MODULO TARJETA DE CREDITO
--1. Vista de Tarjetas de Credito y sus Clientes
CREATE OR REPLACE VIEW vista_tarjetas_credito AS
SELECT 
    tc.id AS id_tarjeta,
    tc.Numero AS numero_tarjeta,
    tc.fechaEmision,
    tc.fechaVencimiento,
    c.id AS id_cliente,
    p.primerNombre || ' ' || p.primerApellido AS nombre_cliente,
    tt.descripcion AS tipo_tarjeta
FROM TarjetaCredito tc
JOIN Cliente c ON tc.idCliente = c.id
JOIN Persona p ON c.idPersona = p.id
JOIN TipoTarjeta tt ON tc.idTipoTarjeta = tt.id;

--2. Vista de Movimientos de Tarjetas de Credito
CREATE OR REPLACE VIEW vista_movimientos_tarjeta AS
SELECT 
    m.id AS id_movimiento,
    m.fecha,
    m.monto,
    m.idTarjeta AS id_tarjeta,
    tc.Numero AS numero_tarjeta,
    tm.descripcion AS tipo_movimiento
FROM Movimiento m
JOIN TarjetaCredito tc ON m.idTarjeta = tc.id
JOIN TipoMovimiento tm ON m.idTipoMovimiento = tm.id;

--3. Vista de Tarjetas y sus Rubros Asociados
CREATE OR REPLACE VIEW vista_tarjetas_rubros AS
SELECT 
    tr.id AS id_tarjeta_rubro,
    tc.id AS id_tarjeta,
    tc.Numero AS numero_tarjeta,
    r.id AS id_rubro,
    r.Nombre AS rubro
FROM TarjetaRubro tr
JOIN TarjetaCredito tc ON tr.idTarjeta = tc.id
JOIN Rubro r ON tr.idRubro = r.id;

--4. Vista de Cortes y Monedas
CREATE OR REPLACE VIEW vista_corte_monedas AS
SELECT 
    cm.id AS id_corte_moneda,
    c.id AS id_corte,
    c.fechaCorte,
    c.fechaPago,
    m.id AS id_moneda,
    m.descripcion AS tipo_moneda,
    cm.pagoContado,
    cm.pagoMinimo
FROM CorteMoneda cm
JOIN Corte c ON cm.idCorte = c.id
JOIN Moneda m ON cm.idMoneda = m.id;






--Modulo Cuenta Bancaria

DESC Sucursal;


--1. Vista de Cuentas Bancarias con Clientes y Sucursales
CREATE OR REPLACE VIEW vista_cuentas_bancarias AS
SELECT 
    c.id AS id_cuenta,
    c.numCuenta AS numero_cuenta,
    c.saldo,
    tc.descripcion AS tipo_cuenta,
    cl.id AS id_cliente,
    p.primerNombre || ' ' || p.primerApellido AS nombre_cliente,
    s.id AS id_sucursal,
    s.NombreSucursal AS nombre_sucursal  -- CORREGIDO
FROM Cuenta c
JOIN TipoCuenta tc ON c.idTipoCuenta = tc.id
JOIN Cliente cl ON c.idCliente = cl.id
JOIN Persona p ON cl.idPersona = p.id
JOIN Sucursal s ON c.idSucursal = s.id;

--2. Vista de Tarjetas de Debito y sus Cuentas Asociadas
CREATE OR REPLACE VIEW vista_tarjetas_debito AS
SELECT 
    td.id AS id_tarjeta_debito,
    td.numeroTarjeta AS numero_tarjeta,
    td.fechaExpiracion,
    c.id AS id_cuenta,
    c.numCuenta AS numero_cuenta,
    cl.id AS id_cliente,
    p.primerNombre || ' ' || p.primerApellido AS nombre_cliente
FROM TarjetaDebito td
JOIN Cuenta c ON td.idCuenta = c.id
JOIN Cliente cl ON c.idCliente = cl.id
JOIN Persona p ON cl.idPersona = p.id;

--3. Vista de Transacciones Bancarias
CREATE OR REPLACE VIEW vista_transacciones AS
SELECT 
    t.id AS id_transaccion,
    t.fecha,
    t.monto,
    t.origen,
    tt.descripcion AS tipo_transaccion,
    c.id AS id_cuenta,
    c.numCuenta AS numero_cuenta,
    s.id AS id_sucursal,
    s.NombreSucursal AS nombre_sucursal,  -- CORREGIDO
    td.id AS id_tarjeta_debito,
    td.numeroTarjeta AS numero_tarjeta
FROM Transaccion t
JOIN TipoTransaccion tt ON t.idTipoTransaccion = tt.id
JOIN Cuenta c ON t.idCuenta = c.id
JOIN Sucursal s ON t.idSucursal = s.id
LEFT JOIN TarjetaDebito td ON t.idTarjetaDebito = td.id;





--MODULO PRESTAMO
--1. Vista de Prestamos con Clientes y Tipos de Prestamos
CREATE OR REPLACE VIEW vista_prestamos AS
SELECT 
    p.id AS id_prestamo,
    p.monto,
    p.interes,
    p.plazoMensual,
    p.fechaDesembolso,
    tp.descripcion AS tipo_prestamo,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM Prestamo p
JOIN TipoPrestamo tp ON p.idTipoPrestamo = tp.id
JOIN Cliente c ON p.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;

--2. Vista de Tipos de Interes Aplicados a Prestamos
CREATE OR REPLACE VIEW vista_prestamos_intereses AS
SELECT 
    pti.id AS id_prestamo_tipo_interes,
    p.id AS id_prestamo,
    p.monto,
    ti.descripcion AS tipo_interes,
    pti.porcentaje,
    pti.fechaInicio,
    pti.fechaFin
FROM PrestamoTipoInteres pti
JOIN Prestamo p ON pti.idPrestamo = p.id
JOIN TipoInteres ti ON pti.idTipoInteres = ti.id;

--3. Vista de Pagos de Prestamos
CREATE OR REPLACE VIEW vista_pagos_prestamos AS
SELECT 
    pp.id AS id_pago_prestamo,
    pp.fecha,
    pp.monto,
    p.id AS id_prestamo,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM PagoPrestamo pp
JOIN Prestamo p ON pp.idPrestamo = p.id
JOIN Cliente c ON p.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;

--4. Vista de Cobros de Prestamos
CREATE OR REPLACE VIEW vista_cobros_prestamos AS
SELECT 
    cp.id AS id_cobro_prestamo,
    cp.fecha,
    cp.monto,
    p.id AS id_prestamo,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM CobroPrestamo cp
JOIN Prestamo p ON cp.idPrestamo = p.id
JOIN Cliente c ON p.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;




--MODULO SOLICITUD PRESTAMO
--1. Vista de Solicitudes de Prestamo con Tipo y Cliente
CREATE OR REPLACE VIEW vista_solicitudes_prestamo AS
SELECT 
    sp.id AS id_solicitud,
    sp.fecha,
    sp.monto,
    sp.motivo,
    ts.descripcion AS tipo_solicitud,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM SolicitudPrestamo sp
JOIN TipoSolicitud ts ON sp.idTipoSolicitud = ts.id
JOIN Cliente c ON sp.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;

--2. Vista de Adjuntos de Solicitudes de Prestamo
CREATE OR REPLACE VIEW vista_adjuntos_solicitud AS
SELECT 
    a.id AS id_adjunto,
    a.descripcion,
    a.ubicacion,
    sp.id AS id_solicitud,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM Adjunto a
JOIN SolicitudPrestamo sp ON a.idSolicitudPrestamo = sp.id
JOIN Cliente c ON sp.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;

--3. Vista de Flujo de Aprobacion por Solicitud
CREATE OR REPLACE VIEW vista_flujo_aprobacion AS
SELECT 
    fa.id AS id_flujo,
    fa.descripcion,
    sp.id AS id_solicitud,
    c.id AS id_cliente,
    per.primerNombre || ' ' || per.primerApellido AS nombre_cliente
FROM FlujoAprobacion fa
JOIN SolicitudPrestamo sp ON fa.idSolicitudPrestamo = sp.id
JOIN Cliente c ON sp.idCliente = c.id
JOIN Persona per ON c.idPersona = per.id;

--4. Vista de Etapas del Flujo de Aprobacion con Empleados Asignados
CREATE OR REPLACE VIEW vista_etapas_flujo_aprobacion AS
SELECT 
    efa.id AS id_etapa_flujo,
    e.descripcion AS etapa,
    efa.fechaInicio,
    efa.fechaFin,
    efa.estado,
    emp.id AS id_empleado,
    per.primerNombre || ' ' || per.primerApellido AS nombre_empleado,
    fa.id AS id_flujo,
    sp.id AS id_solicitud
FROM EtapaFlujoAprobacion efa
JOIN Etapa e ON efa.idEtapa = e.id
JOIN FlujoAprobacion fa ON efa.idFlujoAprobacion = fa.id
JOIN SolicitudPrestamo sp ON fa.idSolicitudPrestamo = sp.id
JOIN Empleado emp ON efa.idEmpleado = emp.id
JOIN Persona per ON emp.idPersona = per.id;

--5. Vista de Reglas por Etapa
CREATE OR REPLACE VIEW vista_reglas_etapa AS
SELECT 
    r.id AS id_regla,
    r.descripcion,
    r.estado,
    e.descripcion AS etapa
FROM Regla r
JOIN Etapa e ON r.idEtapa = e.id;




