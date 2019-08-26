@ECHO OFF    
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    python ".\py_1437.py" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
