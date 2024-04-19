@ECHO OFF
CLS
IF "%1"=="" (SET /P prob=Digite o numero do problema:) ELSE SET prob=%1
IF "%2"=="" (SET /P lang=Digite qual linguagem:) ELSE SET lang=%2
IF "%3"=="" (SET /P qtd=Digite quantidade de testes(ao menos 1^):) ELSE SET qtd=%3
SET ext=cpp

CALL :LowerCase lang
CALL :LangExt %lang% , ext

MKDIR ".\%lang%\%prob%\answer"
MKDIR ".\%lang%\%prob%\in"
MKDIR ".\%lang%\%prob%\out"

IF EXIST ".\%lang%\%prob%\answer\%prob%_1" (ECHO ".\%lang%\%prob%\answer\%prob%_1 ja existe") ELSE (^
   FOR /l %%a IN (1,1,%qtd%) DO (^
       ECHO. > ".\%lang%\%prob%\answer\%prob%_"%%a^
       & ECHO ".\%lang%\%prob%\answer\%prob%_"%%a foi criado.
   )
)
IF EXIST ".\%lang%\%prob%\in\%prob%_1" (ECHO ".\%lang%\%prob%\in\%ext%_%prob%_1 ja existe") ELSE (^
   FOR /l %%a IN (1,1,%qtd%) DO (^
       ECHO. > ".\%lang%\%prob%\in\%prob%_"%%a^
       & ECHO ".\%lang%\%prob%\in\%prob%_"%%a foi criado.
   )
)

IF EXIST ".\%lang%\%prob%\%ext%_%prob%.%ext%" (ECHO "%ext%_%prob%.%ext% ja existe") ELSE (^
   IF %lang%==cpp CALL :CppFile %lang%, %prob% ELSE ()
   IF %lang%==d CALL :DFile %lang%, %prob% ELSE ()
   IF %lang%==python CALL :PyFile %lang%, %prob% ELSE ()
   IF %lang%==haskell CALL :HsFile %lang%, %prob% ELSE ()
   IF %lang%==clojure CALL :CljFile %lang%, %prob% ELSE ()
   ECHO O arquivo ".\%lang%\%prob%\%ext%_%prob%.%ext%" foi criado
)

PAUSE

GOTO:EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::MAIN::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:LowerCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF


:LangExt
:: Subroutine to get file extension.
IF %~1==python (SET %~2%=py)
IF %~1==d (SET %~2%=d)
IF %~1==cpp (SET %~2%=cpp)
IF %~1==haskell (SET %~2%=hs)
IF %~1==clojure (SET %~2%=clj)
GOTO:EOF


:SlnDoc
:: Subroutine to generate Solution doc
   FOR /f %%i IN ('git config user.name') DO SET username=%%i
   ECHO.    author: %username% >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    problem_name:  >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    problem_number: %~2 >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    category:  >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    difficulty_level:  >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    link: https://judge.beecrowd.com/pt/problems/view/%~2 >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
GOTO:EOF


:RunSLn
:: Subroutine to generate runsln.cmd
   ECHO @ECHO OFF > ".\%lang%\%prob%\runsln.cmd"
   IF NOT "%COMMAND%"=="" ECHO %COMMAND% >> ".\%lang%\%prob%\runsln.cmd"
   ECHO FOR /F %%%%i IN ('DIR ".\in" /B') DO (^ >> ".\%lang%\%prob%\runsln.cmd"
   ECHO     %EXEORSCRIPT% ^< ".\in\"%%%%i ^> ".\out\"%%%%i >> ".\%lang%\%prob%\runsln.cmd"
   ECHO     FC /N ".\out\"%%%%i ".\answer\"%%%%i^^ >> ".\%lang%\%prob%\runsln.cmd"
   ECHO     ECHO Proximo...^^ >> ".\%lang%\%prob%\runsln.cmd"
   ECHO     PAUSE^) >> ".\%lang%\%prob%\runsln.cmd"
   ECHO ECHO FIM DOS TESTES. >> ".\%lang%\%prob%\runsln.cmd"
   ECHO PAUSE >> ".\%lang%\%prob%\runsln.cmd"
GOTO:EOF


:CppFile
:: Subroutine to generate init file for cpp
   ECHO /* > ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   CALL :SlnDoc %lang%, %prob%
   ECHO */ >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: main function for cpp
   ECHO #include^<iostream^> >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO using namespace std; >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO int main(^) { >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    cout ^<^< "Ola Mundo\n"; >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    return 0; >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO } >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: generate runsln for cpp
   Set COMMAND=g++ -std=c++11 -O2 ".\%ext%_%prob%.%ext%" -o ".\%ext%_%prob%.exe"
   Set EXEORSCRIPT=.\%ext%_%prob%.exe
   CALL :RunSln %lang%, %prob%, %EXEORSCRIPT%, %COMMAND%
GOTO:EOF


:DFile
:: Subroutine to generate init file for d
   ECHO /* > ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   CALL :SlnDoc %lang%, %prob%
   ECHO */ >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: main function for d
   ECHO import std.stdio; >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO void main(^) >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO { >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO.    writeln("Ola Mundo"^); >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO } >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: generate runsln for d
   Set EXEORSCRIPT=rdmd %ext%_%prob%.%ext%
   CALL :RunSln %lang%, %prob%, %EXEORSCRIPT%
GOTO:EOF


:PyFile
:: Subroutine to generate init file for python
   ECHO ''' > ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   CALL :SlnDoc %lang%, %prob%
   ECHO ''' >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: main python
   ECHO print("Ola Mundo") >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: generate runsln for python
   Set EXEORSCRIPT=python %ext%_%prob%.%ext%
   CALL :RunSln %lang%, %prob%, %EXEORSCRIPT%
GOTO:EOF


:HsFile
:: Subroutine to generate init file for haskell
   ECHO {-- > ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   CALL :SlnDoc %lang%, %prob%
   ECHO --} >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: main function for haskell
   ECHO main = putStrLn "Ola Mundo" >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: generate runsln for haskell
   Set COMMAND=ghc -O -no-keep-hi-files -no-keep-o-files "%ext%_%prob%.%ext%"
   Set EXEORSCRIPT=.\%ext%_%prob%.exe
   CALL :RunSln %lang%, %prob%, %EXEORSCRIPT%, %COMMAND%
GOTO:EOF

:CljFile
:: Subroutine to generate init file for clojure
   ECHO '"' > ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   CALL :SlnDoc %lang%, %prob%
   ECHO '"' >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"
   ECHO. >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: main function for clojure
   ECHO main = (println "Ola Mundo") >> ".\%lang%\%prob%\%ext%_%prob%.%ext%"

   :: generate runsln for clojure
   Set EXEORSCRIPT=clj -M %ext%_%prob%.%ext%
   CALL :RunSln %lang%, %prob%, %EXEORSCRIPT%, %COMMAND%
GOTO:EOF
