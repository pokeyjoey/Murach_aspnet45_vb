sp_grantlogin 'IIS APPPOOL\ASP.NET v4.0'
go

use Halloween
go

sp_grantlogin 'IIS APPPOOL\ASP.NET v4.0'
go

sp_grantdbaccess 'IIS APPPOOL\ASP.NET v4.0'
go

sp_addrolemember 'db_owner', 'IIS APPPOOL\ASP.NET v4.0'
go

exit