create or replace function FUNC_ENCRYPT_L(paramToEncrypt  in CLOB,
                                          encrypt8BYTEKey in RAW)
  return CLOB is
  CRYPTED        BLOB;
  encryptionMode number := DBMS_CRYPTO.ENCRYPT_AES128 +
                           DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5;

begin
  if paramToEncrypt is null then
    return null;
  end if;
  DBMS_LOB.createtemporary(CRYPTED, true);
  DBMS_CRYPTO.ENCRYPT(CRYPTED,
                      paramToEncrypt,
                      encryptionMode,
                      encrypt8BYTEKey,
                      NULL);
  RETURN BLOB_TO_CLOB(CRYPTED);
end;
