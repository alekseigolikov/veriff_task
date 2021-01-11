CREATE OR REPLACE FUNCTION veriff.distance_get (
    IN i_first_vector_coord float8[],        -- coordinates of first vector
    IN i_second_vector_coord float8[],       -- coordinates of second vector
--    OUT status integer,
--    OUT status_text text,
    OUT distance float8                     -- calculated distance
 ) RETURNS float8 AS
$BODY$
-- ----------------------------------------------------------------------
-- Function: distance_get(2)
--
-- Calculate euclidean distance between vectors
--
-- Parameters:
--
--    i_first_vector_coord              -- coordinates of first vector
--    i_second_vector_coord             -- coordinates of second vector

-- Returns:
--      status
--      status_text
--      distance           -- calculated distance
-- Status codes
--    200 - ok
--    404 - missed input
--    403 - misdimentioned vector passed
--
-- Example:
-- select * from veriff.distance_get(array[0,1,2],array[1,3,3]);
-- ----------------------------------------------------------------------

DECLARE
    _calculus      float8 = 0;
    _array_len     int;

BEGIN

    IF i_first_vector_coord is NULL or i_second_vector_coord is NULL THEN
--        status := 404;
--        status_text := 'Missed input';
        distance := NULL;
        RETURN;
    END IF;

    IF array_length(i_first_vector_coord,1) != array_length(i_second_vector_coord,1) THEN
--        status := 403;
--        status_text := 'Misdimentioned vectors';
        distance := NULL;
        RETURN;
    END IF;

    _array_len := array_length(i_first_vector_coord,1);

    FOR i IN 1.._array_len LOOP
        _calculus := _calculus + (i_first_vector_coord[i] - i_second_vector_coord[i])^2;
    END LOOP;

--    status := 200;
--    status_text := 'OK';
    distance := sqrt(_calculus);
    RETURN;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;
