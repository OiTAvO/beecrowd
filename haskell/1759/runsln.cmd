@ECHO OFF    
ghc -O ".\hs_1759.hs" 
ERASE ".\hs_1759.hi" 
ERASE ".\hs_1759.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1759.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
