CREATE TABLE `sec_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `orderby` int(11) DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `iconopen` varchar(20) DEFAULT NULL,
  `opened` varchar(20) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `open_icon` varchar(255) DEFAULT NULL,
  `data` varchar(25) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1690 DEFAULT CHARSET=utf8;

CREATE TABLE sec_resource (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  source VARCHAR(200) DEFAULT NULL,
  menu BIGINT(20) DEFAULT NULL
);
ALTER TABLE SEC_RESOURCE ADD UNIQUE (NAME);
ALTER TABLE SEC_RESOURCE ADD CONSTRAINT FK_RESOURCE_MENU FOREIGN KEY (MENU) REFERENCES SEC_MENU (ID);

CREATE TABLE sec_authority (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(500) DEFAULT NULL,
  name VARCHAR(200) NOT NULL
);
ALTER TABLE SEC_AUTHORITY ADD UNIQUE (NAME);

CREATE TABLE sec_authority_resource (
  authority_id BIGINT(20) NOT NULL,
  resource_id BIGINT(20) NOT NULL
);
ALTER TABLE SEC_AUTHORITY_RESOURCE ADD CONSTRAINT FK_AUTHORITY_RESOURCE1 FOREIGN KEY (AUTHORITY_ID) REFERENCES SEC_AUTHORITY (ID);
ALTER TABLE SEC_AUTHORITY_RESOURCE ADD CONSTRAINT FK_AUTHORITY_RESOURCE2 FOREIGN KEY (RESOURCE_ID) REFERENCES SEC_RESOURCE (ID);

CREATE TABLE sec_role (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(500) DEFAULT NULL,
  name VARCHAR(200) NOT NULL
);
ALTER TABLE SEC_ROLE ADD UNIQUE (NAME);

CREATE TABLE sec_role_authority (
  role_id BIGINT(20) NOT NULL,
  authority_id BIGINT(20) NOT NULL
);
ALTER TABLE SEC_ROLE_AUTHORITY ADD CONSTRAINT FK_ROLE_AUTHORITY1 FOREIGN KEY (AUTHORITY_ID) REFERENCES SEC_AUTHORITY (ID);
ALTER TABLE SEC_ROLE_AUTHORITY ADD CONSTRAINT FK_ROLE_AUTHORITY2 FOREIGN KEY (ROLE_ID) REFERENCES SEC_ROLE (ID);

CREATE TABLE sec_org (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  active VARCHAR(255) DEFAULT NULL,
  description VARCHAR(500) DEFAULT NULL,
  fullname VARCHAR(200) DEFAULT NULL,
  name VARCHAR(200) NOT NULL,
  type VARCHAR(200) DEFAULT NULL,
  parent_org BIGINT(20) DEFAULT NULL
);
ALTER TABLE SEC_ORG ADD CONSTRAINT FK_ORG_PARENT FOREIGN KEY (PARENT_ORG) REFERENCES SEC_ORG (ID);


CREATE TABLE `sec_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `org` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_USER_ORG` (`org`),
  CONSTRAINT `FK_USER_ORG` FOREIGN KEY (`org`) REFERENCES `sec_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;



ALTER TABLE SEC_USER ADD UNIQUE (USERNAME);
ALTER TABLE SEC_USER ADD CONSTRAINT FK_USER_ORG FOREIGN KEY (ORG) REFERENCES SEC_ORG (ID);

CREATE TABLE sec_role_user (
  user_id BIGINT(20) NOT NULL,
  role_id BIGINT(20) NOT NULL
);
ALTER TABLE SEC_ROLE_USER ADD CONSTRAINT FK_ROLE_USER1 FOREIGN KEY (USER_ID) REFERENCES SEC_USER (ID);
ALTER TABLE SEC_ROLE_USER ADD CONSTRAINT FK_ROLE_USER2 FOREIGN KEY (ROLE_ID) REFERENCES SEC_ROLE (ID);

CREATE TABLE sec_user_authority (
  user_id BIGINT(20) NOT NULL,
  authority_id BIGINT(20) NOT NULL
);
ALTER TABLE SEC_USER_AUTHORITY ADD CONSTRAINT FK_USER_AUTHORITY1 FOREIGN KEY (AUTHORITY_ID) REFERENCES SEC_AUTHORITY (ID);
ALTER TABLE SEC_USER_AUTHORITY ADD CONSTRAINT FK_USER_AUTHORITY2 FOREIGN KEY (USER_ID) REFERENCES SEC_USER (ID);

CREATE TABLE conf_dictionary (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cn_name VARCHAR(200) NOT NULL,
  description VARCHAR(500) DEFAULT NULL,
  name VARCHAR(200) NOT NULL
);
ALTER TABLE CONF_DICTIONARY ADD UNIQUE (NAME);

CREATE TABLE conf_dictitem (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(50) DEFAULT NULL,
  description VARCHAR(500) DEFAULT NULL,
  name VARCHAR(200) NOT NULL,
  orderby INT(11) DEFAULT NULL,
  dictionary BIGINT(20) DEFAULT NULL
);
ALTER TABLE CONF_DICTITEM ADD UNIQUE (NAME);
ALTER TABLE CONF_DICTITEM ADD CONSTRAINT FK_DICTITEM_DICTIONARY FOREIGN KEY (DICTIONARY) REFERENCES CONF_DICTIONARY (ID);

CREATE TABLE df_table (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  display_name VARCHAR(200) DEFAULT NULL,
  creator VARCHAR(50) DEFAULT NULL,
  create_time VARCHAR(50) DEFAULT NULL,
  sub_flag VARCHAR(10) DEFAULT NULL
);
ALTER TABLE DF_TABLE ADD UNIQUE (NAME);

CREATE TABLE df_form (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  display_name VARCHAR(200) DEFAULT NULL,
  type VARCHAR(50) DEFAULT NULL,
  creator VARCHAR(50) DEFAULT NULL,
  create_time VARCHAR(50) DEFAULT NULL,
  html TEXT
);
ALTER TABLE DF_FORM ADD UNIQUE (NAME);

CREATE TABLE df_field (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_digit INT(11) DEFAULT NULL,
  data_format VARCHAR(50) DEFAULT NULL,
  data_length INT(11) DEFAULT NULL,
  default_value VARCHAR(200) DEFAULT NULL,
  display_name VARCHAR(200) DEFAULT NULL,
  name VARCHAR(100) NOT NULL,
  required VARCHAR(10) DEFAULT NULL,
  type VARCHAR(100) DEFAULT NULL,
  db_table BIGINT(20) NOT NULL
);

CREATE TABLE df_form_table (
  form_id BIGINT(20) NOT NULL,
  table_id BIGINT(20) NOT NULL
);

CREATE TABLE `tab_report` (
  `report_id` varchar(20) NOT NULL,
  `report_name` varchar(100) DEFAULT NULL,
  `templet_path` varchar(100) DEFAULT NULL,
  `excute_sql` varchar(1000) DEFAULT NULL,
  `where_sql` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `report_type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tab_user_menu` (
  `user_id` varchar(20) NOT NULL,
  `menu_id` int(20) NOT NULL,
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tab_select` (
  `sel_name` varchar(20) NOT NULL,
  `opt_name` varchar(20) NOT NULL,
  `opt_val` varchar(20) DEFAULT NULL,
  `indx` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tab_employee` (
  `eid` bigint(20) DEFAULT NULL,
  `staff_name` varchar(50) DEFAULT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `join_time` date DEFAULT NULL,
  `college` varchar(20) DEFAULT NULL,
  `graduate_time` varchar(50) DEFAULT NULL,
  `salary_month` int(10) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `user_acoount` varchar(50) DEFAULT NULL,
  `work_history` varchar(255) DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `professional` varchar(50) DEFAULT NULL,
  `work_year` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 
CREATE TABLE `tab_advertise` (
  `eid` bigint(20) NOT NULL,
  `china_name` varchar(50) NOT NULL,
  `age` bigint(3) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `work_history` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  `graduate_time` date DEFAULT NULL,
  `professional` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `adver_way` varchar(50) DEFAULT NULL,
  `interview_person` varchar(50) DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `hope_salary` bigint(4) DEFAULT NULL,
  `fact_salary` bigint(4) DEFAULT NULL,
  `employ_status` varchar(50) DEFAULT NULL,
  `qual_cert` varchar(255) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `come_date` date DEFAULT NULL,
  `interview_evaluate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eid`,`china_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


