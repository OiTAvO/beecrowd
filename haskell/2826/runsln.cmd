@ECHO OFF    
ghc -O ".\hs_2826.hs" 
ERASE ".\hs_2826.hi" 
ERASE ".\hs_2826.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_2826.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
