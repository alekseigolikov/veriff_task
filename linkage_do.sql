CREATE OR REPLACE FUNCTION veriff.linkage_do (
    IN i_vectors_for_linage text[],        -- list of vectors for linkage
    IN i_pass int,                          -- pass
    OUT status integer,
    OUT status_text text
 ) RETURNS record AS
$BODY$
-- ----------------------------------------------------------------------
-- Function: linkage_do(2)
--
-- Function intended to group vectors into group and recalculate distance matrix using Single method
--
-- Parameters:
--
--    i_vectors_for_linage              -- array of vectors that should be linked
--    i_pass                            -- curent iteration number

-- Returns:
--      status
--      status_text
--
-- Status codes
--    200 - linkage successfully done ok
--    201 - no more clusters to link
--    404 - vectors not found
--    403 - invalid input
--
-- Example:
-- select * from veriff.linkage_do(array['0','1'], 1)
-- ----------------------------------------------------------------------

DECLARE
    _count         int = 0;

BEGIN

    IF i_vectors_for_linage is NULL or i_pass is NULL THEN
        status := 403;
        status_text := 'Missed input';
        RETURN;
    END IF;

    PERFORM distance from veriff.distance_matrix where vector_a = any(i_vectors_for_linage::text[]);
    IF NOT FOUND THEN
        status := 404;
        status_text := 'Clusters not found';
        RETURN;
    END IF;

    SELECT count(*) from veriff.distance_matrix where pass = (i_pass - 1) INTO _count;
    IF _count < 2 THEN
        status := 201;
        status_text := 'No more clusters to link';
        RETURN;
    END IF;

    INSERT INTO veriff.distance_matrix
        SELECT array_to_string(i_vectors_for_linage::text[],','),
               array_to_string(i_vectors_for_linage::text[],','),
               0,
               i_pass;
    -- reinsert distances not having relation with linking clusters
    INSERT INTO veriff.distance_matrix
        SELECT
            vector_a,
            vector_b,
            distance,
            i_pass
        FROM veriff.distance_matrix
        WHERE
            pass = i_pass - 1
            and not (vector_a = any(i_vectors_for_linage::text[])
            or vector_b = any(i_vectors_for_linage::text[]));

    -- link clusters
    INSERT INTO veriff.distance_matrix
        SELECT
            (CASE WHEN vector_a = any(i_vectors_for_linage::text[]) THEN array_to_string(i_vectors_for_linage::text[],',') ELSE vector_a END) AS vector_a,
            (CASE WHEN vector_b = any(i_vectors_for_linage::text[]) THEN array_to_string(i_vectors_for_linage::text[],',') ELSE vector_b END) AS vector_b,
            min(distance),
            i_pass
        FROM veriff.distance_matrix
        WHERE
            pass = i_pass - 1
            and (vector_a = any(i_vectors_for_linage::text[]) OR vector_b = any(i_vectors_for_linage::text[]))
            and not (vector_a = any(i_vectors_for_linage::text[]) AND vector_b = any(i_vectors_for_linage::text[]))
        GROUP BY 1,2;

    status := 200;
    status_text := 'OK';
    RETURN;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;
