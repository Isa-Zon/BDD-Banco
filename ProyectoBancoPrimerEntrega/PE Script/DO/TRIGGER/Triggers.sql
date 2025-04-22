
--Trigger para Actualizar el Estado del Prestamo
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_ESTADO_PRESTAMO
AFTER INSERT ON PagoPrestamo
FOR EACH ROW
DECLARE
    v_total_pagos NUMBER(10, 2);
    v_monto_prestamo NUMBER(10, 2);
BEGIN
    -- Calcular el total de pagos realizados para el prestamo
    SELECT NVL(SUM(monto), 0) INTO v_total_pagos
    FROM PagoPrestamo
    WHERE idPrestamo = :NEW.idPrestamo;

    -- Obtener el monto del prestamo
    SELECT monto INTO v_monto_prestamo
    FROM Prestamo
    WHERE id = :NEW.idPrestamo;

    -- Actualizar el estado del prestamo segun los pagos realizados
    IF v_total_pagos >= v_monto_prestamo THEN
        -- Aqui podrias manejar algun otro estado o logica adicional
        NULL; -- No hay columna de estado para actualizar
    ELSE
        -- Aqui podrias manejar otro tipo de logica si es necesario
        NULL; -- No hay columna de estado para actualizar
    END IF;
END;
/





--Trigger para Verificar el Estado del Prestamo
CREATE OR REPLACE TRIGGER TRG_VERIFICAR_ESTADO_PRESTAMO
AFTER DELETE ON PagoPrestamo
FOR EACH ROW
DECLARE
    v_total_pagos NUMBER(10, 2);
    v_monto_prestamo NUMBER(10, 2);
BEGIN
    -- Calcular el total de pagos restantes para el prestamo
    SELECT NVL(SUM(monto), 0) INTO v_total_pagos
    FROM PagoPrestamo
    WHERE idPrestamo = :OLD.idPrestamo;

    -- Obtener el monto del prestamo
    SELECT monto INTO v_monto_prestamo
    FROM Prestamo
    WHERE id = :OLD.idPrestamo;

    -- Aqui podrias manejar otro tipo de logica si es necesario
    IF v_total_pagos < v_monto_prestamo THEN
        -- Aqui podrias manejar algun otro estado o logica adicional
        NULL; -- No hay columna de estado para actualizar
    END IF;
END;
/

