declare
  r raw(4000);
  a varchar(4000);
  b varchar(4000);
  k varchar(16);
begin
  k := '1112223334445550';
  a := func_encrypt('amir sajjadi', UTL_I18N.STRING_TO_RAW(k, 'AL32UTF8'));
  b := func_decrypt(a, UTL_I18N.STRING_TO_RAW(k, 'AL32UTF8'));
  dbms_output.put_line(a);
  dbms_output.put_line(b);
end;
