@ECHO off

:: batch file for
:: Murach's ASP.NET 4.5 Web Programming with VB 2012
:: company: Mike Murach & Associates, Inc.
:: date:    September 18, 2013
:: 
:: Uses SQLCMD utility to run a SQL script that creates
:: the Halloween database.

ECHO Attempting to create the Halloween database . . . 
sqlcmd -S localhost\SQLExpress -E /i create_database.sql
ECHO.
ECHO If no error message is shown, then the database was created successfully.
ECHO.
PAUSE