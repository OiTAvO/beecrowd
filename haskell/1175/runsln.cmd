@ECHO OFF    
ghc -O ".\hs_1175.hs" 
ERASE ".\hs_1175.hi" 
ERASE ".\hs_1175.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1175.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
