# Oracle Personal Training

## Command Line commands:

1. Connect to Oracle SQL*PLUS threw windows command line type: 
  * sqlplus
  
  
2. Stop and Start Orace database server:
  * net stop OracleServiceXE
  * net start OracleServiceXE

  
3. Unlock HR user account on Oracle CLI:
  * ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

  
## SQL Scripts

1. Describe the object in detail (i.e. Columns data types)
  * DESC COUNTRIES;


2. Show User Indexes
  * SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS FROM USER_INDEXES;

  
3. Show All Indexes
  * SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS FROM ALL_INDEXES;

  
4. Find indexes on a Table, only works on Constraints
  * SELECT * FROM user_cons_columns WHERE table_name = 'JOBS';


## PL/SQL Scripts


## Bash Scripts


## Python Scripts


## Oracle Ports

* Ports: 2483 - 2484


## Sites:

1. [Live SQL Content] (https://livesql.oracle.com/apex/livesql/file/toc.html)
2. [Bash scripting tutorial] (https://bluepenguinlist.com/2016/11/04/bash-scripting-tutorial/?fromTwitterID=nixCraft)
3. [Network commands] (https://blog.pandorafms.org/network-commands/)
4. [Bash for DBAs] (https://amitzil.wordpress.com/2016/09/07/bash-for-dbas-part-1/)
5. [Some Basic Linux Commands I Have Used During My Linux Journey – Part 1] (http://www.unixmen.com/basic-linux-commands-used-linux-journey/)
6. [Genealogy of Relational Database Management Systems] (https://hpi.de/fileadmin/user_upload/fachgebiete/naumann/projekte/RDBMSGenealogy/RDBMS_Genealogy_V4_print.pdf)
7. [Say NO to Venn Diagrams When Explaining JOINs] (https://blog.jooq.org/2016/07/05/say-no-to-venn-diagrams-when-explaining-joins/)
8. [How To Use ps, kill, and nice to Manage Processes in Linux] (https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux?utm_content=bufferd2197&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
9. [Linux file system hierarchy] (https://www.blackmoreops.com/2015/06/18/linux-file-system-hierarchy-v2-0/)
10. [Microsoft Database training for beginners] (https://mva.microsoft.com/en-US/training-courses/database-fundamentals-8243?l=TEBiexJy_5904984382)
11. [Query Tuning 101] (https://blogs.oracle.com/sql/entry/query_tuning_101_comparing_execution?utm_content=buffer88039&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
12. [7 Best Tools for Network Administration] (https://blogs.oracle.com/sql/entry/query_tuning_101_comparing_execution?utm_content=buffer88039&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
13. [HR Schema SQL and PLSQL questions] (http://www.srikanthtechnologies.com/oracle/dec9/hrqueries.html)
14. [Oracle Application Express (Build applications using only your web browser)] (https://apex.oracle.com/en/)

## Books:

1. [Book: The Method R Guide to Mastering Oracle Trace Data, Second Edition] (https://books.google.ie/books?id=f---DAEACAAJ&dq=he+Method+R+Guide+to+MASTERING+ORACLE+TRACE+DATA&hl=en&sa=X&ved=0ahUKEwj60f-qu6jQAhVoIcAKHQYQDAIQ6AEIGjAA)
2. [Book: Oracle Database 12c Backup and Recovery Survival Guide] (https://www.amazon.com/Oracle-Database-Recovery-Survival-ebook/dp/B00FF1PHAW%3FSubscriptionId%3DAKIAJBDF5XQBATGDX4VQ%26tag%3Dspea06-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00FF1PHAW)
3. [SQL Pocket Guide] 	(http://shop.oreilly.com/product/0636920013471.do)
4. [SQL Cookbook] 		(http://shop.oreilly.com/product/9780596009762.do)
5. [Linux cookbook] 	(http://shop.oreilly.com/product/9780596006402.do)
6. [Bash cookbook]		(http://shop.oreilly.com/product/9780596526788.do)
7. [R cookbook]			(http://shop.oreilly.com/product/9780596809164.do)
8. [Python cookbook]	(http://shop.oreilly.com/product/0636920027072.do)
9. [Neo4j cookbook] 	(https://www.amazon.com/gp/product/178328725X/)
10. [Mongodb cookbook]	(https://www.amazon.com/MongoDB-Cookbook-Second-Cyrus-Dasadia/dp/1785289985/ref=sr_1_1?s=books&ie=UTF8&qid=1478778102&sr=1-1&keywords=Mongodb+cookbook)	
11. [Unix for Oracle DBAs Pocket Reference] (https://www.amazon.com/Unix-Oracle-DBAs-Pocket-Reference-ebook/dp/B0026OR2VS/ref=sr_1_3?s=books&ie=UTF8&qid=1478778363&sr=1-3&keywords=Oracle+dba+scripts)
12. [Oracle books]		
13. [Oracle documents]	


## Video:

1. [Tour the Oracle Dev Gym] (https://www.youtube.com/watch?v=FbHP7usHtzA)
2. [Basic Materialized Views] (http://docs.oracle.com/database/121/DWHSG/basicmv.htm#DWHSG008)
3. [Dr. Daniel Soper: Database Lessons 1-8] (https://www.youtube.com/watch?v=Xk3cgUdoieU)
4. [Guy Harrison: Lecture 5 Oracle Database Performance Tuning 1] (https://www.youtube.com/watch?v=Ah1xjCl6Axg&index=9&list=PL070EB064AA22053F)
5. [Oracle DBA Girl: Road to becoming an Oracle DBA] (https://www.youtube.com/watch?v=CfV2BUXPPcw&list=PLa6d4MyZlN5kEDluaHe4kMn0rvem-S3lX)
6. [Oracle Coach] (https://www.youtube.com/user/oraclecoach/playlists)
7. [The Magic of SQL] (https://www.youtube.com/channel/UCWeOtlakw8g01MrR8U4yYtg/playlists)
8. [Oracle DBA Justin] (https://www.youtube.com/watch?v=28E37BUX6o8&index=8&list=PLMNHKeH57OwAxTDi25giHkLxzFlUbeXOE)
9. [Steven Feuerstein: Practically Perfect PL/SQL] (https://www.youtube.com/channel/UCpJpLMRm452kVcie3RpINPw/playlists)
10. [Oracle Learning Streams] (https://www.youtube.com/user/oraclelearningstream/playlists)
11. [Oracle Learning Library] (https://www.youtube.com/user/OracleLearning/playlists)
12. [OTN Database Community] (https://www.youtube.com/user/OTNDatabasechannel/videos)

