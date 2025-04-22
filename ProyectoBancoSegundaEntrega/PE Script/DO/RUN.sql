--------------------------------------------------------------------------------------
-- Autor           	: Isabel Zuniga
-- Descripcion      : Archivo maestro que ejecuta los scripts en la secuencia requerida
-- Servidor       	: ip del servidor
-- Fecha          	: 23Febrero2025
-- -----------------------------------------------------------------------------------

-- Activar spool para guardar salida de ejecucion
SPOOL RUN_BDD_OUTPUT.log

-- Configuracion de entorno
SET SERVEROUTPUT ON SIZE UNLIMITED
SET ECHO ON
SET FEEDBACK ON

-- Mostrar informacion de entorno
PROMPT *** Iniciando ejecucion del script maestro ***
SELECT banner FROM v$version;
SELECT 'Usuario: ' || USER || ' | Fecha: ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') FROM DUAL;


-- a. CREACION DE TABLAS E INSERTS
PROMPT *** EJECUTANDO: CREACION DE TABLAS ***
@DDL/Tablas.sql

PROMPT *** EJECUTANDO: INSERTS DE DATOS ***
@DML/Inserts.sql


-- b. USUARIOS Y ROLES
PROMPT *** EJECUTANDO: USUARIOS Y ROLES ***
@DML/UsuariosRoles.sql


-- c. CREACION DE SECUENCIAS
PROMPT *** EJECUTANDO: CREACION DE SECUENCIAS ***
@DDL/Secuencias.sql


-- d. CREACION DE VISTAS
PROMPT *** EJECUTANDO: CREACION DE VISTAS ***
@VIEW/Vistas.sql


-- e. CREACION DE PAQUETE
PROMPT *** EJECUTANDO: CREACION DE PAQUETE ***
@PACKAGE/Paquete.sql


-- f. CREACION DE TRIGGER
PROMPT *** EJECUTANDO: CREACION DE OTROS OBJETOS ***
@TRIGGER/Triggers.sql

-- Confirmar cambios
COMMIT;

-- Finalizar spool
PROMPT *** EJECUCION COMPLETA DEL SCRIPT MAESTRO ***
SPOOL OFF
