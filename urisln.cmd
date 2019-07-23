@ECHO OFF
SET /P prob=Digite o numero do problema:
SET /P lang=Digite qual linguagem:
SET ext=cpp

CALL :LowerCase lang
CALL :LangExt %lang% , ext

MKDIR ".\%lang%\%prob%\answer"
MKDIR ".\%lang%\%prob%\in"
MKDIR ".\%lang%\%prob%\out"

IF EXIST (".\%lang%\%prob%\%ext%_%prob%.%ext%") ELSE (echo "" > ".\%lang%\%prob%\%ext%_%prob%.%ext%")
IF EXIST (".\%lang%\%prob%\answer\%ext%_%prob%.ans") ELSE (echo "" > ".\%lang%\%prob%\answer\%ext%_%prob%.ans")
IF EXIST (".\%lang%\%prob%\in\%ext%_%prob%.in") ELSE (echo "" > ".\%lang%\%prob%\in\%ext%_%prob%.in")
IF EXIST (".\%lang%\%prob%\out\%ext%_%prob%.out") ELSE (echo "" > ".\%lang%\%prob%\out\%ext%_%prob%.out")

PAUSE

GOTO:EOF

:LowerCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF

:LangExt
:: Subroutine to get file extension.
if %~1==python (SET %~2%=py)
if %~1==dlang (SET %~2%=d)
if %~1==cpp (SET %~2%=cpp)
if %~1==haskell (SET %~2%=hs)
GOTO:EOF


