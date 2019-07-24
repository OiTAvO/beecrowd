@ECHO OFF    
ghc -O ".\hs_2812.hs" 
ERASE ".\hs_2812.hi" 
ERASE ".\hs_2812.o" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\hs_2812.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
