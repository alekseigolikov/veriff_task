CREATE OR REPLACE FUNCTION veriff.clustering_get (
    IN  i_cluster_count integer,
    OUT status integer,
    OUT status_text text,
    OUT clusters text,
    OUT pass integer
 ) RETURNS SETOF record AS
$BODY$
-- ----------------------------------------------------------------------
-- Function: clustering_get(0)
--
-- Function returns requested ammount of clusters
--
-- Parameters:
-- i_cluster_count - amount of clusters
--
-- Returns:
--      clusters - array of clusters with list of vectors assigned
--      pass     - iteration number when cluster number was reached
--      status
--      status_text
--
-- Status codes
--    200 - requested number of clusters found
--    405 - requested ammount of clusters was not found
--    404 - no input data found
--    403 - invalid input
--
-- Example:
-- select * from veriff.clustering_get(3)
-- ----------------------------------------------------------------------

DECLARE
    _count int;
    _pass  int = 0;
BEGIN

    IF i_cluster_count is NULL THEN
        status = 403;
        status_text = 'Invalid input';
        clusters = Null;
        RETURN NEXT;
        RETURN;
    END IF;

    SELECT count(*) from veriff.distance_matrix INTO _count;
    IF NOT FOUND OR _count < 1 THEN
        status := 404;
        status_text := 'No input data found';
        clusters = Null;
        RETURN NEXT;
        RETURN;
    END IF;

    SELECT a.pass FROM veriff.distance_matrix a
    WHERE
        a.vector_a = a.vector_b
    GROUP BY 1
    HAVING count(*) = i_cluster_count INTO _pass;

    IF _pass = 0 THEN
        status = 405;
        status_text = 'requested ammount of clusters was not found';
        clusters = Null;
    end if;

    FOR status, status_text, pass, clusters IN
        SELECT 200, 'OK', a.pass, a.vector_a
          FROM veriff.distance_matrix a
         WHERE a.pass = _pass
            AND a.vector_b = a.vector_a
    LOOP
        RETURN NEXT;
    END LOOP;
    RETURN;

END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;