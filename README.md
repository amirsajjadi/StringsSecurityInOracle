# StringsSecurityInOracle
 Security of all strings with large and small lengths in Oracle
 -------------------
 First Create bellow SPs in Oracle database :
 1. BLOB_TO_CLOB.sql
 2. CLOB_TO_BLOB.sql
 3. CLOB_TO_CHAR.sql
 4. CLOB_TO_RAW.sql
-------------------
Create a temporary table to split large strings into small strings in an Oracle database :
1. TMP_SHRINK_LARGE_STRING.sql
-------------------
Create bellow SPs in Oracle database for encrypt and decrypt string data :
1. FUNC_ENCRYPT.sql
2. FUNC_ENCRYPT_L.sql
3. FUNC_ENCRYPT_WITH_IV.sql
4. FUNC_DECRYPT.sql
5. FUNC_DECRYPT_L.sql
6. FUNC_DECRYPT_WITH_IV.sql