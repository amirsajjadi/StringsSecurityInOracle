select FUNC_DECRYPT_L(CLOB_TO_BLOB(CLOB_TO_CHAR((SELECT rtrim(xmlagg(xmlelement(e, S_TEXT) order by ROW_NUM).extract('//text()').getclobval(),
                                                             ',')
                                                  FROM TMP_SHRINK_LARGE_STRING))),
                      UTL_I18N.STRING_TO_RAW('1112223334445550', 'AL32UTF8')) as col
  from dual;
