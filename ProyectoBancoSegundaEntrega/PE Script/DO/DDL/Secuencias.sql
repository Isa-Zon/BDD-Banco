--Secuencias

-- Modulo Gestion Administrativa
CREATE SEQUENCE seq_banco START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Banco
CREATE SEQUENCE seq_sucursal START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Sucursal
CREATE SEQUENCE seq_persona START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Persona
CREATE SEQUENCE seq_telefono START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Telefono
CREATE SEQUENCE seq_empleado START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Empleado
CREATE SEQUENCE seq_cargo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Cargo
CREATE SEQUENCE seq_empleado_cargo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla EmpleadoCargo
CREATE SEQUENCE seq_cliente START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Cliente

-- Modulo Referencias
CREATE SEQUENCE seq_referencias START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Referencias
CREATE SEQUENCE seq_cliente_referencia START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla ClienteReferencia

-- Modulo Tarjeta de Credito
CREATE SEQUENCE seq_tipo_tarjeta START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoTarjeta
CREATE SEQUENCE seq_tarjeta_credito START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TarjetaCredito
CREATE SEQUENCE seq_tipo_movimiento START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoMovimiento
CREATE SEQUENCE seq_movimiento START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Movimiento
CREATE SEQUENCE seq_rubro START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Rubro
CREATE SEQUENCE seq_tarjeta_rubro START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TarjetaRubro
CREATE SEQUENCE seq_corte START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Corte
CREATE SEQUENCE seq_moneda START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Moneda
CREATE SEQUENCE seq_corte_moneda START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla CorteMoneda

-- Modulo Cuenta Bancaria
CREATE SEQUENCE seq_tipo_cuenta START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoCuenta
CREATE SEQUENCE seq_cuenta START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Cuenta
CREATE SEQUENCE seq_tarjeta_debito START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TarjetaDebito
CREATE SEQUENCE seq_tipo_transaccion START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoTransaccion
CREATE SEQUENCE seq_transaccion START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Transaccion

-- Modulo Prestamo
CREATE SEQUENCE seq_tipo_prestamo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoPrestamo
CREATE SEQUENCE seq_prestamo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Prestamo
CREATE SEQUENCE seq_tipo_interes START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoInteres
CREATE SEQUENCE seq_prestamo_tipo_interes START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla PrestamoTipoInteres
CREATE SEQUENCE seq_pago_prestamo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla PagoPrestamo
CREATE SEQUENCE seq_cobro_prestamo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla CobroPrestamo

-- Modulo Solicitud Prestamo
CREATE SEQUENCE seq_tipo_solicitud START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla TipoSolicitud
CREATE SEQUENCE seq_solicitud_prestamo START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla SolicitudPrestamo
CREATE SEQUENCE seq_adjunto START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Adjunto
CREATE SEQUENCE seq_etapa START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Etapa
CREATE SEQUENCE seq_regla START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Regla
CREATE SEQUENCE seq_flujo_aprobacion START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla Flujo Aprobacion
CREATE SEQUENCE seq_etapa_flujo_aprobacion START WITH 1 INCREMENT BY 1 NOCYCLE CACHE 10; -- Secuencia para la tabla EtapaFlujoAprobacion

