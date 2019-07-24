@ECHO OFF    
ghc -O ".\hs_1160.hs" 
ERASE ".\hs_1160.hi" 
ERASE ".\hs_1160.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1160.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
