--------------------------------------------------------------------------------------
-- Autor            : Isabel Zuniga
-- Descripcion      : Archivo maestro que elimina los objetos en la secuencia inversa
-- Servidor         : ip del servidor
-- Fecha            : 23Febrero2025
-- -----------------------------------------------------------------------------------

-- Activar spool para guardar salida de ejecucion
SPOOL RUN_UNDO_BDD_OUTPUT.log

-- Configuracion de entorno
SET SERVEROUTPUT ON SIZE UNLIMITED
SET ECHO ON
SET FEEDBACK ON

-- Mostrar informacion de entorno
PROMPT *** Iniciando eliminacion del script maestro ***
SELECT banner FROM v$version;
SELECT 'Usuario: ' || USER || ' | Fecha: ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') FROM DUAL;


-- a. ELIMINAR VISTAS
PROMPT *** ELIMINANDO: VISTAS ***
@VIEW/Vistas.sql


-- b. ELIMINAR TRIGGERS
PROMPT *** ELIMINANDO: TRIGGERS ***
@TRIGGER/Triggers.sql


-- c. ELIMINAR PAQUETES
PROMPT *** ELIMINANDO: PAQUETES ***
@PACKAGE/Paquete.sql


-- d. ELIMINAR USUARIOS Y ROLES
PROMPT *** ELIMINANDO: USUARIOS Y ROLES ***
@DML/UsuariosRoles.sql


-- e. ELIMINAR SECUENCIAS
PROMPT *** ELIMINANDO: SECUENCIAS ***
@DDL/Secuencias.sql


-- f. ELIMINAR TABLAS
PROMPT *** ELIMINANDO: TABLAS ***
@DDL/Tablas.sql


-- Confirmar eliminaciones
COMMIT;

-- Finalizar spool
PROMPT *** EJECUCION COMPLETA DEL SCRIPT MAESTRO ***
SPOOL OFF
