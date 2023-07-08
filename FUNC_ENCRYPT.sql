create or replace function FUNC_ENCRYPT(paramToEncrypt  in VARCHAR2,
                                        encrypt8BYTEKey in RAW) return RAW is

  encryptedReturnValue RAW(4000);
  encryptionMode       number := DBMS_CRYPTO.ENCRYPT_AES128 +
                                 DBMS_CRYPTO.CHAIN_CBC +
                                 DBMS_CRYPTO.PAD_PKCS5;

begin
  encryptedReturnValue := dbms_crypto.encrypt(UTL_I18N.STRING_TO_RAW(paramToEncrypt,
                                                                     'AL32UTF8'),
                                              encryptionMode,
                                              encrypt8BYTEKey);
  return encryptedReturnValue;
end;
