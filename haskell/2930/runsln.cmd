@ECHO OFF    
ghc -O ".\hs_2930.hs" 
ERASE ".\hs_2930.hi" 
ERASE ".\hs_2930.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_2930.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
