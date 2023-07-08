CREATE OR REPLACE FUNCTION CLOB_TO_CHAR(p_in clob) RETURN clob IS
  v_clob    clob;
  v_varchar VARCHAR2(32767);
  v_start   PLS_INTEGER := 1;
  v_buffer  PLS_INTEGER := 2000;
BEGIN
  dbms_lob.createtemporary(v_clob, TRUE);
  FOR i IN 1 .. CEIL(dbms_lob.getlength(p_in) / v_buffer) LOOP
    v_varchar := utl_raw.cast_to_varchar2(dbms_lob.SUBSTR(p_in,
                                                          v_buffer,
                                                          v_start));
    dbms_lob.writeappend(v_clob, LENGTH(v_varchar), v_varchar);
    v_start := v_start + v_buffer;
  END LOOP;
  RETURN v_clob;
END;
