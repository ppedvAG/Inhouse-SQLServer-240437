SQL Statistiken aktualisieren

--bis zu einem bestimmten Grenzwert, der bei ca 20000 Datens�tzen liegt
--gilt die Formel
 (AnzahlDS / 5) + 500
 sonst
 Wurzelaus (AnzahlDS*1000)


 Stichprobe
 je gr��er desto geringer die Stichprobe
#
die gr��e der Stichprobe nimmt dramatisch ab, je mehr Zeilen
--gut: ob 5 Mio oder 10 Mio DS fast gleich lange f�r Update
--negativ: ungenauer

DBCC SHOW_STATISTICS ( 'dbo.KU3' ,[_WA_Sys_00000006_2DE6D218] ) WITH STAT_HEADER ;


 SET STATISTICS TIME ON ;
UPDATE STATISTICS dbo.ku3 [_WA_Sys_00000006_2DE6D218] ;
 SET STATISTICS TIME off 


 SELECT
s.name AS StatsName, sp.*
FROM sys.stats s
CROSS apply sys.dm_db_stats_properties(s.OBJECT_ID, s.stats_id) sp
WHERE s.name = '_WA_Sys_00000006_2DE6D218'