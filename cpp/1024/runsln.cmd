@ECHO OFF 
g++ -std=c++11 -O2 ".\cpp_1024.cpp" -o ".\cpp_1024.exe" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\cpp_1024.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
