@ECHO OFF
SET /P prob=Digite o numero do problema:
SET /P lang=Digite qual linguagem:


CALL :LowerCase lang
SET /P ext = CALL :LangExt lang

rem mkdir ".\%lang%\%prob%\answer"
rem mkdir ".\%lang%\%prob%\in"
rem mkdir ".\%lang%\%prob%\out"

rem copy NUL > 

echo "%ext%_%prob%.%ext%"

GOTO:EOF


:LowerCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF

:LangExt
:: Subroutine to get file extension.
if %~1 == "python" echo "py"
GOTO:EOF