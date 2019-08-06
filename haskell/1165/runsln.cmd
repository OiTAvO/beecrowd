@ECHO OFF    
ghc -O ".\hs_1165.hs" 
ERASE ".\hs_1165.hi" 
ERASE ".\hs_1165.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_1165.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
