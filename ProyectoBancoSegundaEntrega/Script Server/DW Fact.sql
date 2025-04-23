-- Crear base de datos
CREATE DATABASE DW;
GO
USE DW;
GO

--Datamart de Créditos y Pagos
-- Dimensiones
CREATE TABLE dimCliente (
    id INT PRIMARY KEY,
    nombreCompleto NVARCHAR(150),
    correoElectronico NVARCHAR(100),
    ciudad NVARCHAR(100),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTipoPrestamo (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTipoInteres (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
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

-- Tabla de hechos
CREATE TABLE factPrestamo (
    id INT PRIMARY KEY,
    idCliente INT,
    idTipoPrestamo INT,
    idTipoInteres INT,
    idTiempo INT,
    monto DECIMAL(10,2),
    interes DECIMAL(5,2),
    plazoMensual INT,
    pagosTotales DECIMAL(10,2),
    cobrosTotales DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES dimCliente(id),
    FOREIGN KEY (idTipoPrestamo) REFERENCES dimTipoPrestamo(id),
    FOREIGN KEY (idTipoInteres) REFERENCES dimTipoInteres(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);




--Datamart de Tarjetas y Movimientos
-- Dimensiones
CREATE TABLE dimTarjetaCredito (
    id INT PRIMARY KEY,
    numero NVARCHAR(19),
    fechaEmision DATE,
    fechaVencimiento DATE,
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTipoTarjeta (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(50),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTipoMovimiento (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(50),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimRubro (
    id INT PRIMARY KEY,
    nombre NVARCHAR(50),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

-- Tabla de hechos
CREATE TABLE factMovimientoTarjeta (
    id INT PRIMARY KEY,
    idCliente INT,
    idTarjeta INT,
    idTipoTarjeta INT,
    idTipoMovimiento INT,
    idRubro INT,
    idTiempo INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES dimCliente(id),
    FOREIGN KEY (idTarjeta) REFERENCES dimTarjetaCredito(id),
    FOREIGN KEY (idTipoTarjeta) REFERENCES dimTipoTarjeta(id),
    FOREIGN KEY (idTipoMovimiento) REFERENCES dimTipoMovimiento(id),
    FOREIGN KEY (idRubro) REFERENCES dimRubro(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);






-- Datamart de Transacciones Bancarias
-- Dimensiones
CREATE TABLE dimTipoTransaccion (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimTarjetaDebito (
    id INT PRIMARY KEY,
    numeroTarjeta NVARCHAR(19),
    fechaExpiracion DATE,
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimCuenta (
    id INT PRIMARY KEY,
    numCuenta NVARCHAR(45),
    saldo DECIMAL(10,2),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimSucursal (
    id INT PRIMARY KEY,
    nombreSucursal NVARCHAR(100),
    direccion NVARCHAR(300),
    VERSION INT,
    VERSION_ACTUAL BIT
);

-- Tabla de hechos
CREATE TABLE factTransaccion (
    id INT PRIMARY KEY,
    idCliente INT,
    idCuenta INT,
    idTipoTransaccion INT,
    idSucursal INT,
    idTarjetaDebito INT,
    idTiempo INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES dimCliente(id),
    FOREIGN KEY (idCuenta) REFERENCES dimCuenta(id),
    FOREIGN KEY (idTipoTransaccion) REFERENCES dimTipoTransaccion(id),
    FOREIGN KEY (idSucursal) REFERENCES dimSucursal(id),
    FOREIGN KEY (idTarjetaDebito) REFERENCES dimTarjetaDebito(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);






-- Datamart de Solicitudes de Préstamo
-- Dimensiones
CREATE TABLE dimTipoSolicitud (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimEtapa (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

CREATE TABLE dimEmpleado (
    id INT PRIMARY KEY,
    nombreCompleto NVARCHAR(150),
    cargo NVARCHAR(50),
    sucursal NVARCHAR(100),
    VERSION INT,
    VERSION_ACTUAL BIT
);

-- Tabla de hechos
CREATE TABLE factSolicitudPrestamo (
    id INT PRIMARY KEY,
    idCliente INT,
    idTipoSolicitud INT,
    idEtapa INT,
    idEmpleado INT,
    idTiempo INT,
    monto DECIMAL(10,2),
    estado NVARCHAR(20),
    FOREIGN KEY (idCliente) REFERENCES dimCliente(id),
    FOREIGN KEY (idTipoSolicitud) REFERENCES dimTipoSolicitud(id),
    FOREIGN KEY (idEtapa) REFERENCES dimEtapa(id),
    FOREIGN KEY (idEmpleado) REFERENCES dimEmpleado(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);







--Datamart de Cuentas y Saldos
-- Dimensión adicional
CREATE TABLE dimTipoCuenta (
    id INT PRIMARY KEY,
    descripcion NVARCHAR(100),
    estado NVARCHAR(20),
    VERSION INT,
    VERSION_ACTUAL BIT
);

-- Tabla de hechos
CREATE TABLE factCuenta (
    id INT PRIMARY KEY,
    idCliente INT,
    idTipoCuenta INT,
    idSucursal INT,
    idTiempo INT,
    saldo DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES dimCliente(id),
    FOREIGN KEY (idTipoCuenta) REFERENCES dimTipoCuenta(id),
    FOREIGN KEY (idSucursal) REFERENCES dimSucursal(id),
    FOREIGN KEY (idTiempo) REFERENCES dimTiempo(id)
);





--Indices
CREATE INDEX idxFactPrestamoCliente ON factPrestamo(idCliente);
CREATE INDEX idxFactTransaccionTiempo ON factTransaccion(idTiempo);
