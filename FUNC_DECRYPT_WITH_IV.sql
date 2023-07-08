create or replace function FUNC_DECRYPT_WITH_IV(paramToDecrypt  in RAW,
                                                encrypt8BYTEKey in RAW,
                                                iv              RAW)
  return VARCHAR2 is

  returnValue       VARCHAR2(4000);
  decryptedRAWValue RAW(4000);
  l_mod             number := dbms_crypto.ENCRYPT_AES128 +
                              dbms_crypto.CHAIN_CBC + dbms_crypto.PAD_ZERO;
begin
  decryptedRAWValue := dbms_crypto.decrypt(paramToDecrypt,
                                           l_mod,
                                           encrypt8BYTEKey,
                                           iv);
  returnValue       := UTL_I18N.raw_to_char(decryptedRAWValue, 'AL32UTF8');
  return returnValue;
end;
