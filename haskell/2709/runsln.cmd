@ECHO OFF    
ghc -O ".\hs_2709.hs" 
ERASE ".\hs_2709.hi" 
ERASE ".\hs_2709.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_2709.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
