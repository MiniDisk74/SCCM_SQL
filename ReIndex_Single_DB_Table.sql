
--Reindex the tables 1 by 1DBCC DBREINDEX ('DepPolicyAssignment','',80)  
DBCC DBREINDEX ('StatusMessageAttributes','',80)  

 
--Update stats on same tables 1 by 1
UPDATE STATISTICS StatusMessageAttributes WITH FULLSCAN
