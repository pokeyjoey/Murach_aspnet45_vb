@ECHO off

:: batch file for
:: Murach's ASP.NET 4.5 Web Programming with VB 2012
:: company: Mike Murach & Associates, Inc.
:: date:    September 18, 2013
:: 
:: Uses SQLCMD utility to run a SQL script that grants
:: ASP.NET access to the Halloween database.

ECHO Attempting to grant ASP.NET access to the Halloween database . . . 
sqlcmd -S localhost\SQLExpress -E /i grant_access.sql
ECHO.
ECHO If no error message is shown, then access has been granted to the database.
ECHO.
PAUSE
