@ECHO OFF 
g++ -std=c++11 -O2 ".\cpp_2422.cpp" -o ".\cpp_2422.exe" 
FOR /F %%i IN ('DIR ".\in" /B') DO ( 
    ".\cpp_2422.exe" < ".\in\"%%i > ".\out\"%%i    
    FC /N ".\out\"%%i ".\answer\"%%i^ 
    ECHO Proximo...^ 
    PAUSE) 
ECHO FIM DOS TESTES. 
PAUSE 
