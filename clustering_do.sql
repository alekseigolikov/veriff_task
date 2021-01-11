CREATE OR REPLACE FUNCTION veriff.clustering_do (
    OUT status integer,
    OUT status_text text
 ) RETURNS record AS
$BODY$
-- ----------------------------------------------------------------------
-- Function: clustering_do(0)
--
-- Function initiating clustering of data provided in input_data table
-- using Hierarchical clustering with single linkage method
--
-- Parameters:
-- no params passed
--
-- Returns:
--      status
--      status_text
--
-- Status codes
--    200 - clustering successfully done ok
--    404 - no input data found
--    403 - invalid input
--
-- Example:
-- select * from veriff.clustering_do ()
-- ----------------------------------------------------------------------

DECLARE
    _max_iterations int;

BEGIN

    select count(*) from veriff.input_data into _max_iterations;
    IF NOT FOUND OR _max_iterations < 1 THEN
        status := 404;
        status_text := 'No input data found';
        RETURN;
    END IF;

    -- Cleanup previous clustering results from distance matrix
    TRUNCATE TABLE veriff.distance_matrix;

    -- Calculate distances for initial data
    INSERT INTO veriff.distance_matrix
        SELECT
           a.vector_id,
           b.vector_id,
           veriff.distance_get(a.coord, b.coord) as distance,
           0 as pass
        FROM veriff.input_data a
        CROSS JOIN veriff.input_data b
        WHERE veriff.distance_get(a.coord, b.coord) IS NOT NULL;

    --initiate recursive clustering procedure
    SELECT a.status, a.status_text
    FROM veriff.clustering_do(1,_max_iterations) a
    INTO status, status_text;

    RETURN;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;

CREATE OR REPLACE FUNCTION veriff.clustering_do (
    IN i_pass integer,                  -- current iteration pass
    IN i_max_iterations integer,        -- max ammount of iterations
    OUT status integer,
    OUT status_text text
 ) RETURNS record AS
$BODY$
-- ----------------------------------------------------------------------
-- Function: clustering_do(1)
--
-- Recursive function doing clustering
--
-- Parameters:
-- pass - current iteration pass
--
-- Returns:
--      status
--      status_text
--
-- Status codes
--    200 - clustering successfully done ok
--    404 - no input data found
--    403 - invalid input
--    500 - max iterations ammount reached
--
-- Example:
-- select * from veriff.clustering_do ()
-- ----------------------------------------------------------------------

DECLARE
    _count         int = 0;
    _min_distance  float8 = 0;
    _vector_array  text[];
    _linkage_code  int = 0;
    _linkage_error  text;

BEGIN

    IF i_pass is NULL THEN
        status := 403;
        status_text := 'Invalid input';
        RETURN;
    end if;

    IF i_pass > i_max_iterations THEN
        status := 500;
        status_text := 'Max iterations number reached';
    end if;

    PERFORM distance from veriff.distance_matrix
    WHERE pass = i_pass - 1
    AND vector_b = vector_a;

    IF NOT FOUND THEN
        status := 404;
        status_text := 'No input data found';
        RETURN;
    END IF;

    SELECT count(*) from veriff.distance_matrix
    WHERE pass = i_pass -1
    AND vector_b != vector_a into _count;

    IF _count < 1 THEN
        status := 200;
        status_text := 'Clustering completed';
        RETURN;
    END IF;

    --find minimal distance
    SELECT min(distance)
    FROM veriff.distance_matrix
    WHERE pass = i_pass - 1
    AND vector_b != vector_a
    INTO _min_distance;

    --get list of arrays matching criteria for linkage
    SELECT array_agg(vector_a::text)
    FROM veriff.distance_matrix
    WHERE pass = i_pass - 1
    AND vector_b != vector_a
    AND distance = _min_distance
    INTO _vector_array;

    SELECT a.status, a.status_text FROM veriff.linkage_do(_vector_array, i_pass) a
    INTO _linkage_code, _linkage_error;

    IF _linkage_code != 200 THEN
        status := _linkage_code;
        status_text := _linkage_error;
        RETURN;
    end if;

    --initiate recursive clustering procedure
    SELECT a.status, a.status_text
    FROM veriff.clustering_do(i_pass + 1, i_max_iterations) a
    INTO status, status_text;
    RETURN;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;


select count(*) from veriff.distance_matrix
