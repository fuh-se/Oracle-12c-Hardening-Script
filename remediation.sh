#!/bin/bash
sqlplus -s system/baba1234 << EOF
conn /as sysdba
SPOOL /home/oracle/Desktop/audit_report.txt
/*1.2*/
PASSWORD SYSRAC;                                                                          
PASSWORD ORDSYS;                                                                          
PASSWORD ORDDATA;                                                                         
PASSWORD MDSYS;                                                                           
PASSWORD OLAPSYS;                                                                         
PASSWORD LBACSYS;                                                                         
PASSWORD REMOTE_SCHEDULER_AGENT;                                                          
PASSWORD APPQOSSYS;                                                                       
PASSWORD WMSYS;                                                                           
PASSWORD GSMCATUSER;                                                                      
PASSWORD XDB;
PASSWORD OJVMSYS;                                                                         
PASSWORD SI_INFORMTN_SCHEMA;                                                              
PASSWORD GGSYS;                                                                           
PASSWORD ORDPLUGINS;                                                                      
PASSWORD MDDATA;                                                                          
PASSWORD SPATIAL_CSW_ADMIN_USR;                                                           
PASSWORD SYS$UMF;                                                                         
PASSWORD DBSNMP;                                                                          
PASSWORD DIP;                                                                             
PASSWORD OUTLN;                                                                           
PASSWORD DBSFWUSER;
/*1.3*/
DROP USER SCOTT CASCADE;
/*2.2.1*/
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;
/*2.2.3*/
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;
/*2.2.6*/
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;
/*3.1*/
ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS 5;
/*3.3*/
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME 90;
/*3.9*/
ALTER PROFILE DEFAULT LIMIT SESSIONS_PER_USER 10;
/*4.1.1*/
REVOKE EXECUTE ON DBMS_ADVISOR FROM PUBLIC;
/*4.2.2*/
REVOKE EXECUTE ON DBMS_BACKUP_RESTORE FROM PUBLIC;
/*4.4.4*/
REVOKE DBA FROM GRA
/*5.1.1*/
AUDIT USER;
/*5.1.2*/
AUDIT ALTER USER;
/*5.1.3*/
AUDIT DROP USER;
EOF
.//u01/app/oracle/product/12.2.0/dbhome_1/demo/schema