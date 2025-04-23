CREATE TABLE Persona (
  idPersona INT NOT NULL,
  pNombre VARCHAR(45) NULL,
  sNombre VARCHAR(45) NULL,
  pApellido VARCHAR(45) NULL,
  sApellido VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  correo VARCHAR(45) NULL,
  numIdentidad VARCHAR(45) NULL,
  PRIMARY KEY (idPersona))
;
CREATE TABLE Telefono (
  idTelefono INT NOT NULL,
  numero VARCHAR(45) NULL,
  idPersona INT NOT NULL,
  tipoTelefono VARCHAR(1) NULL,
  PRIMARY KEY (idTelefono),
  CONSTRAINT fk_Telefono_Persona
    FOREIGN KEY (idPersona)
    REFERENCES Persona (idPersona)
    )
;
CREATE TABLE Cliente (
  idCliente INT NOT NULL,
  idPersona INT NOT NULL,
  fechaRegistro DATE,
  PRIMARY KEY (idCliente),
  CONSTRAINT fk_Cliente_Persona1
    FOREIGN KEY (idPersona)
    REFERENCES Persona (idPersona)
    )
;
CREATE TABLE AreaTrabajo (
  idAreaTrabajo INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idAreaTrabajo))
;
CREATE TABLE Empleado (
  idEmpleado INT NOT NULL,
  idPersona INT NOT NULL,
  idAreaTrabajo INT NOT NULL,
  fechaRegistro DATE,
  PRIMARY KEY (idEmpleado),
  CONSTRAINT fk_Empleado_Persona1
    FOREIGN KEY (idPersona)
    REFERENCES Persona (idPersona)
    ,
  CONSTRAINT fk_Empleado_AreaTrabajo1
    FOREIGN KEY (idAreaTrabajo)
    REFERENCES AreaTrabajo (idAreaTrabajo)
    )
;
CREATE TABLE Cargo (
  idCargo INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  estado VARCHAR(1) NULL,
  PRIMARY KEY (idCargo))
;
CREATE TABLE Empleado_has_Cargo (
  idEmpleado INT NOT NULL,
  idCargo INT NOT NULL,
  fechaNombramiento DATE NULL,
  fechaFin DATE NULL,
  PRIMARY KEY (idEmpleado, idCargo),
  CONSTRAINT fk_Empleado_has_Cargo_Empleado1
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleado (idEmpleado)
    ,
  CONSTRAINT fk_Empleado_has_Cargo_Cargo1
    FOREIGN KEY (idCargo)
    REFERENCES Cargo (idCargo)
    )
;
-- -----------------------------------------------------
CREATE TABLE TipoServicio (
  idTipoServicio INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idTipoServicio))
;
CREATE TABLE Servicio (
  idServicio INT NOT NULL,
  nombre VARCHAR(45) NULL,
  idTipoServicio INT NOT NULL,
  PRIMARY KEY (idServicio),
  CONSTRAINT fk_Servicio_TipoServicio1
    FOREIGN KEY (idTipoServicio)
    REFERENCES TipoServicio (idTipoServicio)
    )
;
CREATE TABLE Metricas (
  idMetrica INT NOT NULL,
  Descripcion INT NOT NULL,
  PRIMARY KEY (idMetrica))
;
CREATE TABLE Proveedor (
  idProveedor INT NOT NULL,
  nombre VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  tipoProveedor VARCHAR(1) NULL,
  correoElectronico VARCHAR(45) NULL,
  PRIMARY KEY (idProveedor))
;
CREATE TABLE Proveedor_has_Servicio (
  idProveedor INT NOT NULL,
  idServicio INT NOT NULL,
  PRIMARY KEY (idProveedor, idServicio),
  CONSTRAINT fk_Proveedor_has_Servicio_Proveedor1
    FOREIGN KEY (idProveedor)
    REFERENCES Proveedor (idProveedor)
    ,
  CONSTRAINT fk_Proveedor_has_Servicio_Servicio1
    FOREIGN KEY (idServicio)
    REFERENCES Servicio (idServicio)
    )
;
CREATE TABLE Servicio_has_Metricas (
  idServicio INT NOT NULL,
  idMetrica INT NOT NULL,
  unidadMedida VARCHAR(45) NULL,
  valor  [decimal](18, 0) NULL,
  PRIMARY KEY (idServicio, idMetrica),
  CONSTRAINT fk_Servicio_has_Metricas_Servicio1
    FOREIGN KEY (idServicio)
    REFERENCES Servicio (idServicio)
    ,
  CONSTRAINT fk_Servicio_has_Metricas_Metricas1
    FOREIGN KEY (idMetrica)
    REFERENCES Metricas (idMetrica)
    )
;
CREATE TABLE Marca (
  idMarca INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idMarca))
;
CREATE TABLE Bien (
  idBien INT NOT NULL,
  nombre VARCHAR(45) NULL,
  precioCosto VARCHAR(45) NULL,
  numSerie VARCHAR(45) NULL,
  idMarca INT NOT NULL,
  estado VARCHAR(1) NULL,
  PRIMARY KEY (idBien),
  CONSTRAINT fk_Bien_Marca1
    FOREIGN KEY (idMarca)
    REFERENCES Marca (idMarca)
    )
;
CREATE TABLE tipoProducto (
  idtipoProducto INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idtipoProducto))
;
CREATE TABLE Producto (
  idProducto INT NOT NULL,
  nombre VARCHAR(45) NULL,
  precioCosto VARCHAR(45) NULL,
  precioVenta VARCHAR(45) NULL,
  idtipoProducto INT NOT NULL,
  fechaElaboracion DATE NULL,
  fechaVencimiento DATE NULL,
  PRIMARY KEY (idProducto),
  CONSTRAINT fk_Producto_tipoProducto1
    FOREIGN KEY (idtipoProducto)
    REFERENCES tipoProducto (idtipoProducto)
    )
;
CREATE TABLE Paquete (
  idPaquete INT NOT NULL,
  nombre VARCHAR(45) NULL,
  precio  [decimal](18, 0) NULL,
  fechaInicio DATE NULL,
  fechaFin DATE NULL,
  estado VARCHAR(1) NULL,
  PRIMARY KEY (idPaquete))
;
CREATE TABLE Proveedor_has_Producto (
  idProveedor INT NOT NULL,
  idProducto INT NOT NULL,
  PRIMARY KEY (idProveedor, idProducto),
  CONSTRAINT fk_Proveedor_has_Producto_Proveedor1
    FOREIGN KEY (idProveedor)
    REFERENCES Proveedor (idProveedor)
    ,
  CONSTRAINT fk_Proveedor_has_Producto_Producto1
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto)
    )
;
CREATE TABLE Paquete_has_Servicio (
  idPaquete INT NOT NULL,
  idServicio INT NOT NULL,
  PRIMARY KEY (idPaquete, idServicio),
  CONSTRAINT fk_Paquete_has_Servicio_Paquete1
    FOREIGN KEY (idPaquete)
    REFERENCES Paquete (idPaquete)
    ,
  CONSTRAINT fk_Paquete_has_Servicio_Servicio1
    FOREIGN KEY (idServicio)
    REFERENCES Servicio (idServicio)
    )
;
CREATE TABLE formaPago (
  idformaPago INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idformaPago))
;
CREATE TABLE PagoRealizado (
  idPagoRealizado INT NOT NULL,
  fechaPago DATE NULL,
  mesPagado DATE NULL,
  montoPagado  [decimal](18, 0) NULL,
  multa  [decimal](18, 0) NOT NULL,
  PRIMARY KEY (idPagoRealizado))
;

CREATE TABLE Contrato (
  idContrato INT NOT NULL,
  versionActual INT NULL,
  fechaRegistro DATE NULL,
  codigoInterno VARCHAR(45) NULL,
  PRIMARY KEY (idContrato))
;
CREATE TABLE ContratoVersion (
  idContratoVersion INT NOT NULL,
  fechaActualizacion DATE NULL,
  descripcion VARCHAR(45) NULL,
  contenido TEXT NULL,
  estado VARCHAR(1) NULL,
  fechaAprobacion DATE NULL,
  version INT NULL,
  idContrato INT NOT NULL,
  PRIMARY KEY (idContratoVersion),
  CONSTRAINT fk_ContratoVersion_Contrato1
    FOREIGN KEY (idContrato)
    REFERENCES Contrato (idContrato)
    )
;
CREATE TABLE AdquisicionContrato (
  idAdquisicionContrato INT NOT NULL,
  fechaAdquisicion DATE NULL,
  idCliente INT NOT NULL,
  ContratoVersion_idContratoVersion INT NOT NULL,
  idPaquete INT NULL,
  idServicio INT NULL,
  PRIMARY KEY (idAdquisicionContrato),
  CONSTRAINT fk_AdquisicionContrato_Cliente1
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente)
    ,
  CONSTRAINT fk_AdquisicionContrato_ContratoVersion1
    FOREIGN KEY (ContratoVersion_idContratoVersion)
    REFERENCES ContratoVersion (idContratoVersion)
    ,
  CONSTRAINT fk_AdquisicionContrato_Paquete1
    FOREIGN KEY (idPaquete)
    REFERENCES Paquete (idPaquete)
    ,
  CONSTRAINT fk_AdquisicionContrato_Servicio1
    FOREIGN KEY (idServicio)
    REFERENCES Servicio (idServicio)
    )
;
CREATE TABLE Factura (
  idFactura INT NOT NULL,
  fecha DATE NULL,
  totalFactura  [decimal](18, 0) NULL,
  estado VARCHAR(45) NULL,
  idCliente INT NOT NULL,
  idPagoRealizado INT NULL,
  idAdquisicionContrato INT NULL,
  PRIMARY KEY (idFactura),
  CONSTRAINT fk_Factura_Cliente1
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente)
    ,
  CONSTRAINT fk_Factura_PagosRealizados1
    FOREIGN KEY (idPagoRealizado)
    REFERENCES PagoRealizado (idPagoRealizado)
    ,
  CONSTRAINT fk_Factura_AdquisicionContrato1
    FOREIGN KEY (idAdquisicionContrato)
    REFERENCES AdquisicionContrato (idAdquisicionContrato)
    )
;
CREATE TABLE Producto_has_Paquete (
  idProducto INT NOT NULL,
  idPaquete INT NOT NULL,
  PRIMARY KEY (idProducto, idPaquete),
  CONSTRAINT fk_Producto_has_Paquete_Producto1
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto)
    ,
  CONSTRAINT fk_Producto_has_Paquete_Paquete1
    FOREIGN KEY (idPaquete)
    REFERENCES Paquete (idPaquete)
    )
;
CREATE TABLE pago_has_Factura (
  idFactura INT NOT NULL,
  idformaPago INT NOT NULL,
  montoPagado  [decimal](18, 0) NULL,
  PRIMARY KEY (idFactura, idformaPago),
  CONSTRAINT fk_pago_has_Factura_Factura1
    FOREIGN KEY (idFactura)
    REFERENCES Factura (idFactura)
    ,
  CONSTRAINT fk_pago_has_Factura_formaPago1
    FOREIGN KEY (idformaPago)
    REFERENCES formaPago (idformaPago)
    )
;
CREATE TABLE Jefe_AreaTrabajo (
  AreaTrabajo_idAreaTrabajo INT NOT NULL,
  fechaInicio DATE NULL,
  fechaFin DATE NULL,
  idEmpleado INT NOT NULL,
  PRIMARY KEY (AreaTrabajo_idAreaTrabajo, idEmpleado),
  CONSTRAINT fk_Jefe_has_AreaTrabajo_AreaTrabajo1
    FOREIGN KEY (AreaTrabajo_idAreaTrabajo)
    REFERENCES AreaTrabajo (idAreaTrabajo)
    ,
  CONSTRAINT fk_Jefe_has_AreaTrabajo_Empleado1
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleado (idEmpleado)
    )
;
CREATE TABLE Empleado_has_Bien (
  Empleado_idEmpleado INT NOT NULL,
  Bien_idBien INT NOT NULL,
  fechaAsignacion DATE NULL,
  fechaFin DATE NULL,
  PRIMARY KEY (Empleado_idEmpleado, Bien_idBien),
  CONSTRAINT fk_Empleado_has_Bien_Empleado1
    FOREIGN KEY (Empleado_idEmpleado)
    REFERENCES Empleado (idEmpleado)
    ,
  CONSTRAINT fk_Empleado_has_Bien_Bien1
    FOREIGN KEY (Bien_idBien)
    REFERENCES Bien (idBien)
    )
;
CREATE TABLE ConfiguracionContrato (
  idConfiguracionContrato INT NOT NULL,
  fechaRegistro DATE NULL,
  idPaquete INT NULL,
  idServicio INT NULL,
  idContratoVersion INT NOT NULL,
  PRIMARY KEY (idConfiguracionContrato),
  CONSTRAINT fk_ConfiguracionContrato_Paquete1
    FOREIGN KEY (idPaquete)
    REFERENCES Paquete (idPaquete)
    ,
  CONSTRAINT fk_ConfiguracionContrato_Servicio1
    FOREIGN KEY (idServicio)
    REFERENCES Servicio (idServicio)
    ,
  CONSTRAINT fk_ConfiguracionContrato_ContratoVersion1
    FOREIGN KEY (idContratoVersion)
    REFERENCES ContratoVersion (idContratoVersion)
    )
;
CREATE TABLE FacturaDetalle (
  idFacturaDetalle INT NOT NULL,
  idFactura INT NOT NULL,
  idProducto INT NOT NULL,
  cantidad	[decimal](18, 0) NULL,
  PRIMARY KEY (idFacturaDetalle),
  CONSTRAINT fk_FacturaDetalle_Factura1
    FOREIGN KEY (idFactura)
    REFERENCES Factura (idFactura)
    ,
  CONSTRAINT fk_FacturaDetalle_Producto1
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto)
    )
;


