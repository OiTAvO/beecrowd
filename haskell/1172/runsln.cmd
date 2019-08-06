@ECHO OFF    
ghc -O ".\hs_1172.hs" 
ERASE ".\hs_1172.hi" 
ERASE ".\hs_1172.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1172.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
