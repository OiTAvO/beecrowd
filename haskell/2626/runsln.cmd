@ECHO OFF    
ghc -O ".\hs_2626.hs" 
ERASE ".\hs_2626.hi" 
ERASE ".\hs_2626.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_2626.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
