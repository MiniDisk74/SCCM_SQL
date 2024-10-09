---Rebuild all the indexes in a database:
---Runs best if you stop MP services:
 EXEC sp_MSforeachtable 'DBCC DBREINDEX(''?'')'

Go
--Updates statistics for all the tables within the database:
Exec sp_MSForEachTable "UPDATE STATISTICS ? with fullscan"
go
