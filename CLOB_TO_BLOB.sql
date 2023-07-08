create or replace function CLOB_TO_BLOB(AClob CLOB) return BLOB is
  Result BLOB;
  o1     integer;
  o2     integer;
  c      integer;
  w      integer;
begin
  if AClob is null then
    return null;
  end if;
  o1 := 1;
  o2 := 1;
  c  := 0;
  w  := 0;
  DBMS_LOB.CreateTemporary(Result, true);
  DBMS_LOB.ConvertToBlob(Result, AClob, length(AClob), o1, o2, 0, c, w);
  return(Result);
end CLOB_TO_BLOB;
