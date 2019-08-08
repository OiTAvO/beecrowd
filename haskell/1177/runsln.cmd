@ECHO OFF    
ghc -O ".\hs_1177.hs" 
ERASE ".\hs_1177.hi" 
ERASE ".\hs_1177.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1177.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
