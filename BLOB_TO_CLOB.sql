CREATE OR REPLACE FUNCTION BLOB_TO_CLOB(p_in blob) RETURN clob IS
  v_clob    clob;
  v_varchar raw(2000);
  v_start   PLS_INTEGER := 1;
  v_buffer  PLS_INTEGER := 2000;
BEGIN
  if p_in is null then
    return null;
  end if;
  dbms_lob.createtemporary(v_clob, TRUE);
  FOR i IN 1 .. CEIL(dbms_lob.getlength(p_in) / v_buffer) LOOP
    v_varchar := dbms_lob.SUBSTR(p_in, v_buffer, v_start);
    dbms_lob.writeappend(v_clob, LENGTH(v_varchar), v_varchar);
    v_start := v_start + v_buffer;
  END LOOP;
  RETURN v_clob;
END;
