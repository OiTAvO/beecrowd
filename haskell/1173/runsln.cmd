@ECHO OFF    
ghc -O ".\hs_1173.hs" 
ERASE ".\hs_1173.hi" 
ERASE ".\hs_1173.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1173.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
