@ECHO OFF
ECHO ##################################################################
ECHO ### Iniciando o processo de verificação do coverage do projeto ###
ECHO ##################################################################
ECHO .
ECHO .
REM Vai para a pasta raiz
cd ../ 
RMDIR coverage /s /q
ECHO Gerando dados de coverage (lcov.info)
CALL flutter test --verbose --coverage --reporter expanded
ECHO Gerando HTML a partir do lcov.info
CALL perl %GENHTML% -o coverage\html coverage\lcov.info
ECHO Abrindo relatório no navegador
CALL coverage\html\index.html
PAUSE