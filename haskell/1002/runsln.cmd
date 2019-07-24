@ECHO OFF    
ghc -O ".\hs_1002.hs" 
ERASE ".\hs_1002.hi" 
ERASE ".\hs_1002.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1002.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
