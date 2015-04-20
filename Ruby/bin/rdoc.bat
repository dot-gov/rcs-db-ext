@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\RCS\rcs-db-ext\Ruby\bin\ruby.exe" "C:/RCS/rcs-db-ext/Ruby/bin/rdoc" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\RCS\rcs-db-ext\Ruby\bin\ruby.exe" "%~dpn0" %*
