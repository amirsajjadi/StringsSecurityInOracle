create or replace function FUNC_DECRYPT_L(paramToDecrypt  in BLOB,
                                          encrypt8BYTEKey in RAW)
  return CLOB is
  returnValue    CLOB;
  encryptionMode number := dbms_crypto.ENCRYPT_AES128 +
                           dbms_crypto.CHAIN_CBC + dbms_crypto.PAD_PKCS5;

begin
  if paramToDecrypt is null then
    return null;
  end if;
  DBMS_LOB.createtemporary(returnValue, true);
  DBMS_CRYPTO.DECRYPT(returnValue,
                      paramToDecrypt,
                      encryptionMode,
                      encrypt8BYTEKey,
                      NULL);
  return returnValue;
end;
