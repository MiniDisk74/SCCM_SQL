SELECT 
    OBJECT_NAME(ips.object_id) AS table_name,
    i.name AS index_name,
    ips.index_id,
    ips.index_type_desc,
    ips.avg_fragmentation_in_percent,
    ips.fragment_count,
    ips.page_count,
    ROUND(SUM(ps.used_page_count) * 8.0 / 1024, 2) AS index_size_mb -- Calculate index size in MB
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') ips
JOIN sys.indexes i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
JOIN sys.dm_db_partition_stats ps ON ips.object_id = ps.object_id AND ips.index_id = ps.index_id
GROUP BY 
    OBJECT_NAME(ips.object_id), 
    i.name, 
    ips.index_id, 
    ips.index_type_desc, 
    ips.avg_fragmentation_in_percent, 
    ips.fragment_count, 
    ips.page_count
ORDER BY ips.avg_fragmentation_in_percent DESC;