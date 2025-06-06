}--Tablas del Proyecto "Banco" en Oracle SQL Developer

	-- MODULO GESTION ADMINISTRATIVA

-- Crear la tabla Banco
	CREATE TABLE Banco (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		nombre VARCHAR2(50) NOT NULL,
		direccion VARCHAR2(500) NOT NULL
	);

-- Crear la tabla Sucursal con relacion de uno a muchos con Banco
	CREATE TABLE Sucursal (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		NombreSucursal VARCHAR2(50) NOT NULL,
		direccion VARCHAR2(500) NOT NULL,
		id_Banco NUMBER,
		CONSTRAINT fk_banco FOREIGN KEY (id_Banco) REFERENCES Banco(id)
	);

-- Crear la tabla Persona
	CREATE TABLE Persona (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		primerNombre VARCHAR2(20) NOT NULL,
		segundoNombre VARCHAR2(20),
		primerApellido VARCHAR2(20) NOT NULL,
		segundoApellido VARCHAR2(20),
		direccion VARCHAR2(500) NOT NULL,
		correoElectronico VARCHAR2(100) NOT NULL,
		fechaNacimiento DATE NOT NULL,
		DNI VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Telefono con relacion de uno a muchos con Persona
	CREATE TABLE Telefono (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		numero VARCHAR2(15) NOT NULL,
		tipo VARCHAR2(20) NOT NULL,
		idPersona NUMBER,
		CONSTRAINT fk_persona FOREIGN KEY (idPersona) REFERENCES Persona(id)
	);

-- Crear la tabla Empleado
	CREATE TABLE Empleado (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idSucursal NUMBER,
		idPersona NUMBER,
		CONSTRAINT fk_sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
		CONSTRAINT fk_persona_empleado FOREIGN KEY (idPersona) REFERENCES Persona(id)
	);

-- Crear la tabla Cargo
	CREATE TABLE Cargo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		nombre VARCHAR2(45) NOT NULL
	);

-- Crear la tabla EmpleadoCargo, relacion de muchos a muchos entre Empleado y Cargo
	CREATE TABLE EmpleadoCargo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idEmpleado NUMBER,
		idCargo NUMBER,
		fechaInicio DATE NOT NULL,
		fechaFin DATE NOT NULL,
		CONSTRAINT fk_empleado FOREIGN KEY (idEmpleado) REFERENCES Empleado(id),
		CONSTRAINT fk_cargo FOREIGN KEY (idCargo) REFERENCES Cargo(id)
	);

-- Crear la tabla Cliente
	CREATE TABLE Cliente (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fechaRegistro DATE NOT NULL,
		idPersona NUMBER,
		CONSTRAINT fk_persona_cliente FOREIGN KEY (idPersona) REFERENCES Persona(id)
	);

------------------------------------------------------------------------------------------------------------------------------

-- MODULO REFERENCIAS

-- Crear la tabla Referencias
	CREATE TABLE Referencias (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fechaRegistro DATE NOT NULL,
		idPersona NUMBER,
		CONSTRAINT fk_referencia_persona FOREIGN KEY (idPersona) REFERENCES Persona(id)
	);

-- Crear la tabla ClienteReferencia para la relacion de muchos a muchos entre Cliente y Referencias
	CREATE TABLE ClienteReferencia (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idCliente NUMBER,
		idReferencia NUMBER,
		TipoReferencia VARCHAR2(50) NOT NULL,
		Observaciones CLOB,
		CONSTRAINT fk_cliente_referencia_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
		CONSTRAINT fk_cliente_referencia_referencia FOREIGN KEY (idReferencia) REFERENCES Referencias(id)
	);

-------------------------------------------------------------------------------------------------------------------------------------

-- MODULO TARJETA DE CREDITO

-- Crear la tabla TipoTarjeta
	CREATE TABLE TipoTarjeta (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(45) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla TarjetaCredito con relacion de uno a muchos con TipoTarjeta
	CREATE TABLE TarjetaCredito (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fechaEmision DATE NOT NULL,
		fechaVencimiento DATE NOT NULL,
		Numero VARCHAR2(19) NOT NULL,
		CVV VARCHAR2(5) NOT NULL,
		idCliente NUMBER,
		idTipoTarjeta NUMBER,
		CONSTRAINT fk_tarjetacredito_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
		CONSTRAINT fk_tarjetacredito_tipotarjeta FOREIGN KEY (idTipoTarjeta) REFERENCES TipoTarjeta(id)
	);

-- Crear la tabla TipoMovimiento
	CREATE TABLE TipoMovimiento (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(45) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Movimiento con relacion de uno a muchos con TipoMovimiento
	CREATE TABLE Movimiento (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fecha DATE NOT NULL,
		monto NUMBER(10, 2) NOT NULL,
		idTarjeta NUMBER,
		idTipoMovimiento NUMBER,
		CONSTRAINT fk_movimiento_tarjeta FOREIGN KEY (idTarjeta) REFERENCES TarjetaCredito(id),
		CONSTRAINT fk_movimiento_tipomovimiento FOREIGN KEY (idTipoMovimiento) REFERENCES TipoMovimiento(id)
	);

-- Crear la tabla Rubro
	CREATE TABLE Rubro (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		Nombre VARCHAR2(45) NOT NULL,
		Estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla TarjetaRubro para la relacion de muchos a muchos entre TarjetaCredito y Rubro
	CREATE TABLE TarjetaRubro (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idTarjeta NUMBER,
		idRubro NUMBER,
		CONSTRAINT fk_tarjetarubro_tarjeta FOREIGN KEY (idTarjeta) REFERENCES TarjetaCredito(id),
		CONSTRAINT fk_tarjetarubro_rubro FOREIGN KEY (idRubro) REFERENCES Rubro(id)
	);

-- Crear la tabla Corte
	CREATE TABLE Corte (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fechaCorte DATE NOT NULL,
		fechaPago DATE NOT NULL
	);

-- Crear la tabla Moneda
	CREATE TABLE Moneda (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(45) NOT NULL
	);

-- Crear la tabla CorteMoneda para la relacion de muchos a muchos entre Corte y Moneda
	CREATE TABLE CorteMoneda (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idCorte NUMBER,
		idMoneda NUMBER,
		pagoContado NUMBER(10, 2) NOT NULL,
		pagoMinimo NUMBER(10, 2) NOT NULL,
		CONSTRAINT fk_cortemoneda_corte FOREIGN KEY (idCorte) REFERENCES Corte(id),
		CONSTRAINT fk_cortemoneda_moneda FOREIGN KEY (idMoneda) REFERENCES Moneda(id)
	);

-------------------------------------------------------------------------------------------------------------------------------

-- MODULO CUENTA BANCARIA

-- Crear la tabla TipoCuenta
	CREATE TABLE TipoCuenta (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Cuenta con relaciones a TipoCuenta, Cliente y Sucursal
	CREATE TABLE Cuenta (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		numCuenta VARCHAR2(45) NOT NULL,
		saldo NUMBER(10, 2) NOT NULL,
		idTipoCuenta NUMBER,
		idCliente NUMBER,
		idSucursal NUMBER,
		CONSTRAINT fk_cuenta_tipocuenta FOREIGN KEY (idTipoCuenta) REFERENCES TipoCuenta(id),
		CONSTRAINT fk_cuenta_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
		CONSTRAINT fk_cuenta_sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(id)
	);

-- Crear la tabla TarjetaDebito con relacion a Cuenta
	CREATE TABLE TarjetaDebito (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		numeroTarjeta VARCHAR2(19) NOT NULL,
		fechaExpiracion DATE NOT NULL,
		cvv VARCHAR2(4) NOT NULL,
		idCuenta NUMBER,
		CONSTRAINT fk_tarjetadebito_cuenta FOREIGN KEY (idCuenta) REFERENCES Cuenta(id)
	);

-- Crear la tabla TipoTransaccion
	CREATE TABLE TipoTransaccion (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Transaccion con relaciones a TipoTransaccion, Cuenta, TarjetaDebito, y Sucursal
CREATE TABLE Transaccion (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    fecha DATE NOT NULL,
    monto NUMBER(10, 2) NOT NULL,
    origen VARCHAR2(100),
    idCuenta NUMBER,
    idTipoTransaccion NUMBER,
    idSucursal NUMBER,
    idTarjetaDebito NUMBER,
    CONSTRAINT fk_transaccion_cuenta FOREIGN KEY (idCuenta) REFERENCES Cuenta(id),
    CONSTRAINT fk_transaccion_tipotransaccion FOREIGN KEY (idTipoTransaccion) REFERENCES TipoTransaccion(id),
    CONSTRAINT fk_transaccion_sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
    CONSTRAINT fk_transaccion_tarjetadebito FOREIGN KEY (idTarjetaDebito) REFERENCES TarjetaDebito(id)
);

----------------------------------------------------------------------------------------------------------------------------------

-- MODULO PRESTAMO

-- Crear la tabla TipoPrestamo
	CREATE TABLE TipoPrestamo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Prestamo con relaciones a Cliente y TipoPrestamo
	CREATE TABLE Prestamo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		monto NUMBER(10, 2) NOT NULL,
		interes NUMBER(5, 2) NOT NULL,
		plazoMensual NUMBER NOT NULL,
		fechaDesembolso DATE NOT NULL,
		idCliente NUMBER,
		idTipoPrestamo NUMBER,
		CONSTRAINT fk_prestamo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
		CONSTRAINT fk_prestamo_tipoprestamo FOREIGN KEY (idTipoPrestamo) REFERENCES TipoPrestamo(id)
	);

-- Crear la tabla TipoInteres
	CREATE TABLE TipoInteres (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla PrestamoTipoInteres para la relacion de muchos a muchos entre Prestamo y TipoInteres
	CREATE TABLE PrestamoTipoInteres (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		idPrestamo NUMBER,
		idTipoInteres NUMBER,
		porcentaje NUMBER(5, 2) NOT NULL,
		fechaInicio DATE NOT NULL,
		fechaFin DATE,
		CONSTRAINT fk_prestamotipointeres_prestamo FOREIGN KEY (idPrestamo) REFERENCES Prestamo(id),
		CONSTRAINT fk_prestamotipointeres_tipointeres FOREIGN KEY (idTipoInteres) REFERENCES TipoInteres(id)
	);

-- Crear la tabla PagoPrestamo con relacion a Prestamo
	CREATE TABLE PagoPrestamo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fecha DATE NOT NULL,
		monto NUMBER(10, 2) NOT NULL,
		idPrestamo NUMBER,
		CONSTRAINT fk_pagoprestamo_prestamo FOREIGN KEY (idPrestamo) REFERENCES Prestamo(id)
	);

-- Crear la tabla CobroPrestamo con relacion a Prestamo
	CREATE TABLE CobroPrestamo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fecha DATE NOT NULL,
		monto NUMBER(10, 2) NOT NULL,
		idPrestamo NUMBER,
		CONSTRAINT fk_cobroprestamo_prestamo FOREIGN KEY (idPrestamo) REFERENCES Prestamo(id)
	);

----------------------------------------------------------------------------------------------------------------------------------

-- MODULO SOLICITUD PRESTAMO

-- Crear la tabla TipoSolicitud
	CREATE TABLE TipoSolicitud (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla SolicitudPrestamo con relaciones a Cliente y TipoSolicitud
	CREATE TABLE SolicitudPrestamo (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		fecha DATE NOT NULL,
		monto NUMBER(10, 2) NOT NULL,
		motivo CLOB NOT NULL,
		idTipoSolicitud NUMBER,
		idCliente NUMBER,
		CONSTRAINT fk_solicitudprestamo_tiposolicitud FOREIGN KEY (idTipoSolicitud) REFERENCES TipoSolicitud(id),
		CONSTRAINT fk_solicitudprestamo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id)
	);

-- Crear la tabla Adjunto con relacion a SolicitudPrestamo
	CREATE TABLE Adjunto (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(255) NOT NULL,
		ubicacion VARCHAR2(500) NOT NULL,
		idSolicitudPrestamo NUMBER,
		CONSTRAINT fk_adjunto_solicitudprestamo FOREIGN KEY (idSolicitudPrestamo) REFERENCES SolicitudPrestamo(id)
	);

-- Crear la tabla Etapa
	CREATE TABLE Etapa (
		id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
		descripcion VARCHAR2(100) NOT NULL,
		estado VARCHAR2(20) NOT NULL
	);

-- Crear la tabla Regla con relacion a Etapa
CREATE TABLE Regla (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    descripcion CLOB NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    idEtapa NUMBER,
    CONSTRAINT fk_regla_etapa FOREIGN KEY (idEtapa) REFERENCES Etapa(id)
);

-- Crear la tabla FlujoAprobacion con relacion uno a uno con SolicitudPrestamo
CREATE TABLE FlujoAprobacion (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    descripcion VARCHAR2(300) NOT NULL,
    idSolicitudPrestamo NUMBER,
    CONSTRAINT fk_flujoaprobacion_solicitudprestamo FOREIGN KEY (idSolicitudPrestamo) REFERENCES SolicitudPrestamo(id)
);

-- Crear la tabla EtapaFlujoAprobacion para la relacion de muchos a muchos entre Etapa y FlujoAprobacion con relacion a Empleado
CREATE TABLE EtapaFlujoAprobacion (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    idEtapa NUMBER,
    idFlujoAprobacion NUMBER,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    estado VARCHAR2(45) NOT NULL,
    idEmpleado NUMBER,
    CONSTRAINT fk_etapaflujoaprobacion_etapa FOREIGN KEY (idEtapa) REFERENCES Etapa(id),
    CONSTRAINT fk_etapaflujoaprobacion_flujo FOREIGN KEY (idFlujoAprobacion) REFERENCES FlujoAprobacion(id),
    CONSTRAINT fk_etapaflujoaprobacion_empleado FOREIGN KEY (idEmpleado) REFERENCES Empleado(id)
);
