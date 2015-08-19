 /**
  * 职位表
  * 
  */
CREATE TABLE `tab_jon` (
  `jid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `join_time` date DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `graduate_time` varchar(255) DEFAULT NULL,
  `salary_month` int(10) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 /*
  * 函数
  * 查找所有子部门ID 
  */
CREATE FUNCTION `getChildLst`(rootId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);  
     SET sTemp = '$';
     SET sTempChd =cast(rootId as CHAR);
  
     WHILE sTempChd is not null DO
       SET sTemp = concat(sTemp,',',sTempChd);
      SELECT group_concat(id) INTO sTempChd FROM sec_org where FIND_IN_SET(parent_org,sTempChd)>0;
      END WHILE;
      RETURN sTemp;
   END