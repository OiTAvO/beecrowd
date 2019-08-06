@ECHO OFF    
ghc -O ".\hs_1164.hs" 
ERASE ".\hs_1164.hi" 
ERASE ".\hs_1164.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1164.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
