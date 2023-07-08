create or replace function FUNC_DECRYPT(paramToDecrypt  in RAW,
                                        encrypt8BYTEKey in RAW)
  return VARCHAR2 is
  returnValue       VARCHAR2(4000);
  decryptedRAWValue RAW(4000);
  l_mod             number := dbms_crypto.ENCRYPT_AES128 +
                              dbms_crypto.CHAIN_CBC + dbms_crypto.PAD_PKCS5;
begin
  decryptedRAWValue := dbms_crypto.decrypt(paramToDecrypt,
                                           l_mod,
                                           encrypt8BYTEKey);
  returnValue       := UTL_I18N.raw_to_char(decryptedRAWValue, 'AL32UTF8');
  return returnValue;
end;
