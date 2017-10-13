/*
SQLyog v10.2 
MySQL - 5.5.25 : Database - ps
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ps` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ps`;

/*Table structure for table `atemp` */

DROP TABLE IF EXISTS `atemp`;

CREATE TABLE `atemp` (
  `c` varchar(50) DEFAULT NULL,
  `s` varchar(50) DEFAULT NULL,
  `n` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dp_regrade` */

DROP TABLE IF EXISTS `dp_regrade`;

CREATE TABLE `dp_regrade` (
  `activity_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `lms_course` */

DROP TABLE IF EXISTS `lms_course`;

CREATE TABLE `lms_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_isbn` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Table structure for table `lms_student` */

DROP TABLE IF EXISTS `lms_student`;

CREATE TABLE `lms_student` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `lms_user` */

DROP TABLE IF EXISTS `lms_user`;

CREATE TABLE `lms_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_guid` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2426 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity` */

DROP TABLE IF EXISTS `ps_activity`;

CREATE TABLE `ps_activity` (
  `Activity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_Activity_ID` int(11) NOT NULL,
  `MR_Activity_ID` varchar(128) DEFAULT NULL,
  `Course_ID` varchar(128) NOT NULL DEFAULT '0',
  `Ref_Course_ID` varchar(128) NOT NULL DEFAULT '0',
  `Policy_ID` varchar(128) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `User_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Grade` int(11) NOT NULL,
  `Max_Grade` int(11) NOT NULL,
  `Timezone` varchar(64) DEFAULT NULL,
  `Coursetz` int(11) NOT NULL DEFAULT '0',
  `Available_From` datetime DEFAULT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Is_Due_Date` int(11) NOT NULL,
  `Enforce_Due_Date` int(11) DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Time_Unit` int(11) NOT NULL DEFAULT '2',
  `Description` varchar(256) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `Has_Time_Limit` smallint(6) NOT NULL DEFAULT '0',
  `IN_REPLACING` int(11) NOT NULL DEFAULT '0',
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Activity_Template_ID` int(11) DEFAULT NULL,
  `Activity_Identity` varchar(128) DEFAULT NULL,
  `random_Question` int(11) NOT NULL DEFAULT '0',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Shuffle_Question_Order` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Calc_Score_Mode` tinyint(1) NOT NULL DEFAULT '0',
  `Display_Ebook` int(11) NOT NULL DEFAULT '1',
  `Published` int(11) DEFAULT '0',
  `published_date` datetime DEFAULT NULL,
  `Assignment_Type` int(10) NOT NULL DEFAULT '0',
  `Assignment_Url` varchar(256) DEFAULT NULL,
  `Product_Code` varchar(32) DEFAULT NULL,
  `For_Premade_Preview` int(11) DEFAULT '0',
  `Late_Work` int(11) NOT NULL DEFAULT '0',
  `Late_Work_Days` int(11) NOT NULL DEFAULT '0',
  `Late_Work_Penalty_Percent` int(11) NOT NULL DEFAULT '-1',
  `Display_Periodic` int(11) NOT NULL DEFAULT '0',
  `Has_Late_Penalty_Cleared` int(11) NOT NULL DEFAULT '0',
  `Extra_Credit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否附加题 0-否 1-是',
  PRIMARY KEY (`Activity_ID`),
  UNIQUE KEY `Ref_Activity_ID` (`Ref_Activity_ID`,`Course_ID`),
  KEY `MR_Activity_ID` (`MR_Activity_ID`),
  KEY `Course_ID` (`Course_ID`),
  KEY `Status` (`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_grade` */

DROP TABLE IF EXISTS `ps_activity_grade`;

CREATE TABLE `ps_activity_grade` (
  `Activity_Grade_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Student_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Student_Name_Order` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) NOT NULL,
  `Activity_Grade` decimal(10,4) NOT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Timezone` varchar(64) DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT '0',
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Is_Un_Enroll` int(11) DEFAULT '0',
  `Is_Instr_Preview` int(11) DEFAULT '0',
  `Time_Taken` int(11) DEFAULT NULL,
  `Published` int(11) DEFAULT '0',
  `Allow_Practice` int(11) DEFAULT '0',
  `Modified` int(11) DEFAULT '0',
  `Adaptive_Timer` int(11) DEFAULT NULL,
  `Adaptive_Remain_Timer` int(11) DEFAULT NULL,
  `Adaptive_Start_Time` datetime DEFAULT NULL,
  `Adaptive_End_Time` datetime DEFAULT NULL,
  `Adaptive_Time_Taken` int(11) DEFAULT NULL,
  `Adaptive_Question_Start_Time` datetime DEFAULT NULL,
  `Adaptive_Attempt` int(11) DEFAULT NULL,
  `Has_Assign_Goal` int(11) DEFAULT NULL,
  `Adaptive_Question_Grade` decimal(10,4) DEFAULT NULL,
  `Adaptive_Question_ID` int(11) DEFAULT NULL,
  `Adaptive_Question_Status` int(11) NOT NULL DEFAULT '0',
  `Last_Launched_Question_Type` int(2) DEFAULT '0',
  `Late_Work_Days` int(11) NOT NULL DEFAULT '0',
  `Late_Work_Penalty_Percent` int(11) NOT NULL DEFAULT '-1',
  `Has_Late_Penalty_Worked` int(11) NOT NULL DEFAULT '0',
  `Has_Late_Penalty_Cleared` int(11) NOT NULL DEFAULT '0',
  `Init_Role` int(11) NOT NULL DEFAULT '0',
  `Activity_Grade_With_LatePenalty` decimal(10,4) NOT NULL,
  `Has_Submit` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Activity_Grade_ID`),
  UNIQUE KEY `uk_Activity_Grade` (`Student_ID`,`Activity_ID`,`Attempt_Num`),
  KEY `FK_Activity_Grade_Activity_Activity_ID` (`Activity_ID`),
  KEY `Activity_Status` (`Activity_Status`),
  KEY `Attempt_Num` (`Attempt_Num`),
  KEY `Due_Date` (`Due_Date`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Due_Date_2` (`Due_Date`),
  KEY `Activity_Status_2` (`Activity_Status`),
  KEY `Is_Un_Enroll` (`Is_Un_Enroll`),
  CONSTRAINT `FK_Activity_Grade_Activity_Activity_ID` FOREIGN KEY (`Activity_ID`) REFERENCES `ps_activity` (`Activity_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2279 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_grade_20150417` */

DROP TABLE IF EXISTS `ps_activity_grade_20150417`;

CREATE TABLE `ps_activity_grade_20150417` (
  `Activity_Grade_ID` int(11) NOT NULL DEFAULT '0',
  `Student_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) NOT NULL,
  `Activity_Grade` decimal(10,4) NOT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT '0',
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_grade_copy` */

DROP TABLE IF EXISTS `ps_activity_grade_copy`;

CREATE TABLE `ps_activity_grade_copy` (
  `Activity_Grade_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Student_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) NOT NULL,
  `Activity_Grade` decimal(10,4) NOT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT '0',
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Activity_Grade_ID`),
  UNIQUE KEY `uk_Activity_Grade` (`Student_ID`,`Activity_ID`,`Attempt_Num`),
  KEY `FK_Activity_Grade_Activity_Activity_ID` (`Activity_ID`),
  KEY `Activity_Status` (`Activity_Status`),
  KEY `Attempt_Num` (`Attempt_Num`),
  KEY `Due_Date` (`Due_Date`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Due_Date_2` (`Due_Date`),
  KEY `Activity_Status_2` (`Activity_Status`),
  KEY `Activity_Status_3` (`Activity_Status`),
  KEY `Attempt_Num_2` (`Attempt_Num`),
  KEY `Due_Date_3` (`Due_Date`),
  KEY `Student_ID_2` (`Student_ID`),
  KEY `Due_Date_4` (`Due_Date`),
  KEY `Activity_Status_4` (`Activity_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=12552 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_grade_reset` */

DROP TABLE IF EXISTS `ps_activity_grade_reset`;

CREATE TABLE `ps_activity_grade_reset` (
  `Activity_Grade_ID` int(11) NOT NULL,
  `Student_ID` varchar(128) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Student_Name_Order` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) DEFAULT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) DEFAULT NULL,
  `Activity_Grade` decimal(10,4) DEFAULT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) DEFAULT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` date DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT NULL,
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_grade_unenrolled` */

DROP TABLE IF EXISTS `ps_activity_grade_unenrolled`;

CREATE TABLE `ps_activity_grade_unenrolled` (
  `Activity_Grade_ID` int(11) NOT NULL,
  `Student_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Student_Name_Order` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) NOT NULL,
  `Activity_Grade` decimal(10,4) NOT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT '0',
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` datetime DEFAULT NULL,
  KEY `Activity_Grade_ID` (`Activity_Grade_ID`),
  KEY `FK_Activity_Grade_Activity_Activity_ID` (`Activity_ID`),
  KEY `Activity_Status` (`Activity_Status`),
  KEY `Attempt_Num` (`Attempt_Num`),
  KEY `Due_Date` (`Due_Date`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Due_Date_2` (`Due_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_group` */

DROP TABLE IF EXISTS `ps_activity_group`;

CREATE TABLE `ps_activity_group` (
  `Activity_Group_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) NOT NULL,
  `Group_ID` varchar(64) NOT NULL,
  `Group_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Activity_Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_part` */

DROP TABLE IF EXISTS `ps_activity_part`;

CREATE TABLE `ps_activity_part` (
  `Activity_Part_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Question_ID` int(11) NOT NULL,
  `Part_ID` int(11) NOT NULL,
  `Activity_Part_Grade` decimal(10,4) DEFAULT NULL,
  `Activity_Part_Grade_Modified` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`Activity_Part_ID`),
  KEY `FK_Activity_Part_Activity_Question_Activity_Question_ID` (`Activity_Question_ID`),
  KEY `Part_ID` (`Part_ID`),
  KEY `Part_ID_2` (`Part_ID`),
  KEY `Part_ID_3` (`Part_ID`),
  CONSTRAINT `FK_Activity_Part_Activity_Question_Activity_Question_ID` FOREIGN KEY (`Activity_Question_ID`) REFERENCES `ps_activity_question` (`Activity_Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12708 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_policy` */

DROP TABLE IF EXISTS `ps_activity_policy`;

CREATE TABLE `ps_activity_policy` (
  `Policy_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Policy_Mode_ID` int(11) NOT NULL,
  `Policy_Mode_Name` varchar(64) NOT NULL,
  `Policy_Name` varchar(64) NOT NULL,
  `Teacher` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Show_Hint` varchar(64) NOT NULL,
  `Show_Feedback_During_Attempt` varchar(64) NOT NULL,
  `Show_Marks_During_Attempt` varchar(64) NOT NULL,
  `Show_Work_Solution_During_Attempt` varchar(64) NOT NULL,
  `Allow_Give_up` varchar(64) NOT NULL,
  `Shuffle_Question_Order` varchar(64) NOT NULL,
  `Show_Feedback_After_Submit` varchar(64) NOT NULL,
  `Show_Marks_After_Submit` varchar(64) NOT NULL,
  `Show_Answer_Solution_After_Submit` varchar(64) NOT NULL,
  `Show_Feedback_Pass_Due_Date` varchar(64) NOT NULL,
  `Show_Marks_Pass_Due_Date` varchar(64) NOT NULL,
  `Show_Answer_Solution_Pass_Due_Date` varchar(64) NOT NULL,
  `Penalties` varchar(64) NOT NULL,
  `Penalty_for_Dropdown` varchar(64) NOT NULL,
  `Penalty_for_Multiple_Choice` varchar(64) NOT NULL,
  `Penalize_Attempts_Per_Question` varchar(64) NOT NULL,
  `Activity_Retakes` varchar(64) NOT NULL,
  `Retakes_Grading_Method` varchar(64) NOT NULL,
  `Graded_Retakes_Count` varchar(64) NOT NULL DEFAULT '0',
  `Create_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Policy_ID`),
  UNIQUE KEY `Inedx_Teacher_Policy_Name` (`Teacher`,`Policy_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_question` */

DROP TABLE IF EXISTS `ps_activity_question`;

CREATE TABLE `ps_activity_question` (
  `Activity_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) NOT NULL,
  `Ref_ID` int(11) NOT NULL,
  `Ref_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Activity_Question_Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Order_Index` int(11) DEFAULT NULL,
  `Series` varchar(128) NOT NULL DEFAULT '0',
  `Attempt_Num` int(11) NOT NULL DEFAULT '0',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Is_Penalties` int(11) DEFAULT '0',
  `Penalties_Percent` decimal(10,2) DEFAULT '0.00',
  `Grading_Method` int(11) DEFAULT NULL,
  `Module_Type` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Avg_National_Time` int(11) DEFAULT NULL,
  `Is_Hidden` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Question_Scope` int(11) DEFAULT '0',
  `Question_Snippet` text,
  `Tutorial_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Has_Algo` tinyint(1) NOT NULL DEFAULT '0',
  `Guess_Penalty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Activity_Question_ID`),
  KEY `ind_activity_question_index` (`Order_Index`),
  KEY `Ref_ID` (`Ref_ID`),
  KEY `Version_Status` (`Version_Status`),
  KEY `Ref_ID_2` (`Ref_ID`),
  KEY `Version_Status_2` (`Version_Status`),
  KEY `FK_Activity_Question_Activity_Activity_ID` (`Activity_ID`),
  CONSTRAINT `FK_Activity_Question_Activity_Activity_ID` FOREIGN KEY (`Activity_ID`) REFERENCES `ps_activity` (`Activity_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10855 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_question919` */

DROP TABLE IF EXISTS `ps_activity_question919`;

CREATE TABLE `ps_activity_question919` (
  `Activity_Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Ref_ID` int(11) NOT NULL,
  `Ref_Type` tinyint(4) NOT NULL DEFAULT '1',
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_question920` */

DROP TABLE IF EXISTS `ps_activity_question920`;

CREATE TABLE `ps_activity_question920` (
  `Activity_Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Ref_ID` int(11) NOT NULL,
  `Ref_Type` tinyint(4) NOT NULL DEFAULT '1',
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_question921` */

DROP TABLE IF EXISTS `ps_activity_question921`;

CREATE TABLE `ps_activity_question921` (
  `Activity_Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Ref_ID` int(11) NOT NULL,
  `Ref_Type` tinyint(4) NOT NULL DEFAULT '1',
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_question_medium` */

DROP TABLE IF EXISTS `ps_activity_question_medium`;

CREATE TABLE `ps_activity_question_medium` (
  `Activity_Question_Medium_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) NOT NULL,
  `Ref_ID` int(11) NOT NULL,
  `Ref_Type` tinyint(4) NOT NULL DEFAULT '1',
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Activity_Question_Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Order_Index` int(11) DEFAULT NULL,
  `Series` varchar(128) NOT NULL DEFAULT '0',
  `Attempt_Num` int(11) NOT NULL DEFAULT '0',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Is_Penalties` int(11) DEFAULT '0',
  `Penalties_Percent` decimal(10,2) DEFAULT '0.00',
  `Grading_Method` int(11) DEFAULT NULL,
  `Module_Type` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Avg_National_Time` int(11) DEFAULT NULL,
  `Is_Hidden` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Question_Scope` int(11) DEFAULT '0',
  `Question_Snippet` text,
  `Tutorial_Type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Activity_Question_Medium_ID`),
  KEY `ind_activity_question_index` (`Order_Index`),
  KEY `Ref_ID` (`Ref_ID`),
  KEY `Version_Status` (`Version_Status`),
  KEY `FK_Activity_Question_Medium_Activity_Activity_ID` (`Activity_ID`),
  CONSTRAINT `FK_Activity_Question_Medium_Activity_Activity_ID` FOREIGN KEY (`Activity_ID`) REFERENCES `ps_activity` (`Activity_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7536 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_template` */

DROP TABLE IF EXISTS `ps_activity_template`;

CREATE TABLE `ps_activity_template` (
  `Activity_Template_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Template_Title` varchar(128) NOT NULL,
  `Creator_ID` varchar(128) NOT NULL DEFAULT '0',
  `Creator_Name` varchar(128) NOT NULL DEFAULT '0',
  `Book_ID` int(11) NOT NULL DEFAULT '0',
  `Points` int(11) NOT NULL DEFAULT '0',
  `Grade` int(11) NOT NULL DEFAULT '0',
  `Time_Limit` int(11) DEFAULT NULL,
  `Time_Unit` int(11) NOT NULL DEFAULT '2',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `Random_Question` int(11) NOT NULL DEFAULT '0',
  `Shuffle_Question_Order` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last_Modifier` varchar(128) NOT NULL,
  `Template_Scope` int(11) DEFAULT '1',
  `For_Demo` int(2) NOT NULL DEFAULT '0',
  `assignment_type` int(11) NOT NULL,
  `adaptive_on` int(11) NOT NULL DEFAULT '0',
  `adaptive_info` varchar(128) DEFAULT NULL,
  `Display_Periodic` int(11) DEFAULT NULL,
  `Display_Ebook` int(11) DEFAULT NULL,
  PRIMARY KEY (`Activity_Template_ID`),
  KEY `idx_tScope` (`Template_Scope`),
  KEY `idx_forDemo` (`For_Demo`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_activity_template_question` */

DROP TABLE IF EXISTS `ps_activity_template_question`;

CREATE TABLE `ps_activity_template_question` (
  `Activity_Template_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Template_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Version_Status` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  PRIMARY KEY (`Activity_Template_Question_ID`),
  UNIQUE KEY `uk_activity_question` (`Activity_Template_ID`,`Question_ID`),
  KEY `ind_activity_question_index` (`Order_Index`),
  CONSTRAINT `FK_Activity_Question_Activity_Template_ID` FOREIGN KEY (`Activity_Template_ID`) REFERENCES `ps_activity_template` (`Activity_Template_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_article` */

DROP TABLE IF EXISTS `ps_article`;

CREATE TABLE `ps_article` (
  `Article_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Chapter_ID` int(11) NOT NULL,
  `Title` varchar(2048) NOT NULL,
  `Author` varchar(2048) NOT NULL,
  `Source` varchar(2048) NOT NULL,
  `Publication_Date` datetime NOT NULL,
  `Credit_Line` varchar(2048) NOT NULL,
  `Article_Content` mediumtext,
  `Last_Operator` varchar(128) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Article_ID`),
  KEY `FK_Chapter_Article_Chapter_ID` (`Chapter_ID`),
  KEY `FK_Book_Article_Book_ID` (`Book_ID`),
  CONSTRAINT `FK_Book_Article_Book_ID` FOREIGN KEY (`Book_ID`) REFERENCES `ps_book` (`Book_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Chapter_Article_Chapter_ID` FOREIGN KEY (`Chapter_ID`) REFERENCES `ps_chapter` (`Chapter_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book` */

DROP TABLE IF EXISTS `ps_book`;

CREATE TABLE `ps_book` (
  `Book_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_Name` varchar(128) NOT NULL,
  `Master_Book_Number` varchar(64) NOT NULL,
  `Code` varchar(128) NOT NULL,
  `VBID` varchar(64) DEFAULT NULL,
  `Significant_Figures` int(11) NOT NULL DEFAULT '1',
  `Display_Periodic` int(11) NOT NULL DEFAULT '0',
  `Graph_ID` varchar(128) DEFAULT NULL,
  `Comma_Separate` tinyint(4) NOT NULL DEFAULT '0',
  `enabled_los` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `UK_Master_Book_Number` (`Master_Book_Number`),
  KEY `Book_Name` (`Book_Name`),
  KEY `VBID` (`VBID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_author` */

DROP TABLE IF EXISTS `ps_book_author`;

CREATE TABLE `ps_book_author` (
  `Book_Author_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Author_ID` varchar(64) NOT NULL,
  `Assigner` varchar(64) NOT NULL,
  PRIMARY KEY (`Book_Author_ID`),
  UNIQUE KEY `uk_book_author` (`Book_ID`,`Author_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_bkup_20130930` */

DROP TABLE IF EXISTS `ps_book_bkup_20130930`;

CREATE TABLE `ps_book_bkup_20130930` (
  `Book_ID` int(11) NOT NULL DEFAULT '0',
  `Book_Name` varchar(128) NOT NULL,
  `Master_Book_Number` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_copyeditor` */

DROP TABLE IF EXISTS `ps_book_copyeditor`;

CREATE TABLE `ps_book_copyeditor` (
  `Book_CopyEditor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `CopyEditor` varchar(64) NOT NULL,
  PRIMARY KEY (`Book_CopyEditor_ID`),
  UNIQUE KEY `uk_book_copyeditor` (`Book_ID`,`CopyEditor`),
  KEY `CopyEditor` (`CopyEditor`),
  CONSTRAINT `FK_Book_CopyEditor_User_User_ID` FOREIGN KEY (`CopyEditor`) REFERENCES `ps_user` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_editor` */

DROP TABLE IF EXISTS `ps_book_editor`;

CREATE TABLE `ps_book_editor` (
  `Book_Editor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Editor` varchar(64) NOT NULL,
  PRIMARY KEY (`Book_Editor_ID`),
  UNIQUE KEY `uk_book_editor` (`Book_ID`,`Editor`),
  KEY `Editor` (`Editor`),
  CONSTRAINT `FK_Book_Editor_User_User_ID` FOREIGN KEY (`Editor`) REFERENCES `ps_user` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1245 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_qatester` */

DROP TABLE IF EXISTS `ps_book_qatester`;

CREATE TABLE `ps_book_qatester` (
  `Book_QATester_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `QATester` varchar(64) NOT NULL,
  PRIMARY KEY (`Book_QATester_ID`),
  UNIQUE KEY `uk_book_qatester` (`Book_ID`,`QATester`),
  KEY `CopyEditor` (`QATester`),
  CONSTRAINT `FK_Book_QATester_User_User_ID` FOREIGN KEY (`QATester`) REFERENCES `ps_user` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_book_series` */

DROP TABLE IF EXISTS `ps_book_series`;

CREATE TABLE `ps_book_series` (
  `Book_Series_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Series` varchar(255) DEFAULT NULL,
  `Descriptive_Name` varchar(255) DEFAULT NULL,
  `Is_Apply_Series_Filter` int(11) DEFAULT '0',
  PRIMARY KEY (`Book_Series_ID`),
  KEY `Book_ID` (`Book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_chapter` */

DROP TABLE IF EXISTS `ps_chapter`;

CREATE TABLE `ps_chapter` (
  `Chapter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Chapter_Name` varchar(128) NOT NULL,
  `Order_Index` int(11) NOT NULL,
  `Question_Number_Prefix` varchar(64) DEFAULT NULL,
  `Resource_ID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Chapter_ID`),
  KEY `FK_Chapter_Book_Book_ID` (`Book_ID`),
  KEY `Order_Index` (`Order_Index`),
  KEY `Resource_ID` (`Resource_ID`(255)),
  CONSTRAINT `FK_Chapter_Book_Book_ID` FOREIGN KEY (`Book_ID`) REFERENCES `ps_book` (`Book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=926 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_chapter_bak` */

DROP TABLE IF EXISTS `ps_chapter_bak`;

CREATE TABLE `ps_chapter_bak` (
  `Chapter_ID` int(11) NOT NULL DEFAULT '0',
  `Book_ID` int(11) NOT NULL,
  `Chapter_Name` varchar(128) NOT NULL,
  `Order_Index` int(11) NOT NULL,
  `Question_Number_Prefix` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ps_chapter_bkup_20130930` */

DROP TABLE IF EXISTS `ps_chapter_bkup_20130930`;

CREATE TABLE `ps_chapter_bkup_20130930` (
  `Chapter_ID` int(11) NOT NULL DEFAULT '0',
  `Book_ID` int(11) NOT NULL,
  `Chapter_Name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_components` */

DROP TABLE IF EXISTS `ps_components`;

CREATE TABLE `ps_components` (
  `Component_ID` varchar(255) NOT NULL,
  `Part_ID` int(11) NOT NULL,
  `Component_Type` int(11) DEFAULT NULL,
  `Component_Design` text,
  `Component_Data` mediumtext NOT NULL,
  `Answer_Key` varchar(1024) NOT NULL,
  `Component_Level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Component_ID`),
  KEY `FK_Components_Part_Part_ID` (`Part_ID`),
  CONSTRAINT `FK_Components_Part_Part_ID` FOREIGN KEY (`Part_ID`) REFERENCES `ps_part` (`Part_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_d` */

DROP TABLE IF EXISTS `ps_d`;

CREATE TABLE `ps_d` (
  `stu_id` varchar(64) NOT NULL,
  `stu_first_name` varchar(64) DEFAULT NULL,
  `stu_last_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_email_entity` */

DROP TABLE IF EXISTS `ps_email_entity`;

CREATE TABLE `ps_email_entity` (
  `Email_Entity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Receiver_Email` varchar(64) NOT NULL,
  `Edit_Note` mediumtext,
  `Edit_Action` varchar(64) DEFAULT NULL,
  `Email_Content` mediumtext NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Last_Send_Date` datetime DEFAULT NULL,
  `Fail_Time` int(2) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Email_Entity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_grade_entity` */

DROP TABLE IF EXISTS `ps_grade_entity`;

CREATE TABLE `ps_grade_entity` (
  `Grade_Entity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Last_Send_Date` datetime DEFAULT NULL,
  `Consumer_Key` varchar(64) DEFAULT NULL,
  `Source_ID` varchar(255) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Record_Grade` decimal(10,4) NOT NULL,
  `Is_Client_TimeLimit` int(2) DEFAULT NULL,
  `Course_ID` varchar(64) NOT NULL,
  `Operator_ID` varchar(64) NOT NULL,
  `Ref_Activity_ID` int(11) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `NCIA_Activity_ID` varchar(128) DEFAULT NULL,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Activity_Name` varchar(128) NOT NULL,
  `Studet_ID` varchar(64) NOT NULL,
  `Product_Code` varchar(64) DEFAULT NULL,
  `Instructor_Email` varchar(64) NOT NULL,
  `Student_Email` varchar(64) NOT NULL,
  `GAU` datetime DEFAULT NULL,
  `Record_Type` int(2) DEFAULT NULL,
  `Result_Type` varchar(64) DEFAULT NULL,
  `Fail_Time` int(2) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Submission_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Grade_Entity_ID`),
  UNIQUE KEY `FK_Activity_Grade_ID` (`Activity_Grade_ID`),
  CONSTRAINT `FK_Activity_Grade_ID` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_graph` */

DROP TABLE IF EXISTS `ps_graph`;

CREATE TABLE `ps_graph` (
  `Graph_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) DEFAULT NULL,
  `Graph_Img_ID` varchar(255) DEFAULT NULL,
  `Graph_Name` varchar(128) NOT NULL,
  `Author` varchar(128) NOT NULL,
  `Graph_Data` mediumtext,
  `ImageData` mediumtext,
  PRIMARY KEY (`Graph_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_graph_feedback` */

DROP TABLE IF EXISTS `ps_graph_feedback`;

CREATE TABLE `ps_graph_feedback` (
  `Feedback_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Graph_ID` int(11) NOT NULL,
  `Feedback_Type` int(1) NOT NULL,
  `Design` mediumtext NOT NULL,
  `Feedback_Content` mediumtext,
  PRIMARY KEY (`Feedback_ID`),
  KEY `FK_Graph_Feedback_SVG_Graph_Graph_ID` (`Graph_ID`),
  CONSTRAINT `FK_Graph_Feedback_SVG_Graph_Graph_ID` FOREIGN KEY (`Graph_ID`) REFERENCES `ps_svg_graph` (`Graph_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_group` */

DROP TABLE IF EXISTS `ps_group`;

CREATE TABLE `ps_group` (
  `Group_ID` int(11) NOT NULL,
  `Course_ID` varchar(128) NOT NULL,
  `Group_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_group_detail` */

DROP TABLE IF EXISTS `ps_group_detail`;

CREATE TABLE `ps_group_detail` (
  `Group_Detail_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Group_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  PRIMARY KEY (`Group_Detail_ID`),
  KEY `ind_Group_detail_index` (`Order_Index`),
  KEY `FK_Group_Detail_Question_Question_ID` (`Question_ID`),
  KEY `FK_Group_Detail_Question_Group_Group_ID` (`Group_ID`),
  CONSTRAINT `FK_Group_Detail_Question_Group_Group_ID` FOREIGN KEY (`Group_ID`) REFERENCES `ps_question_group` (`Group_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Group_Detail_Question_Question_ID` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_guid_cutover` */

DROP TABLE IF EXISTS `ps_guid_cutover`;

CREATE TABLE `ps_guid_cutover` (
  `username` varchar(255) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_account` */

DROP TABLE IF EXISTS `ps_knewton_account`;

CREATE TABLE `ps_knewton_account` (
  `Account_Key_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Account_ID` varchar(128) DEFAULT NULL,
  `User_ID` varchar(128) DEFAULT NULL,
  `Email_Verified` tinyint(1) DEFAULT NULL,
  `Access_Token` varchar(128) DEFAULT NULL,
  `Refresh_Token` varchar(128) DEFAULT NULL,
  `Expires_In` int(11) DEFAULT NULL,
  `Expires_At` datetime DEFAULT NULL,
  `Is_System_User` int(11) DEFAULT '0',
  PRIMARY KEY (`Account_Key_ID`),
  UNIQUE KEY `Account_ID` (`Account_ID`),
  UNIQUE KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_adaptive_setting` */

DROP TABLE IF EXISTS `ps_knewton_adaptive_setting`;

CREATE TABLE `ps_knewton_adaptive_setting` (
  `Knewton_Adaptive_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) DEFAULT NULL,
  `Mastery` float DEFAULT NULL,
  `Is_Full_Adaptive` int(11) DEFAULT NULL,
  `Adaptive_Type` int(11) DEFAULT NULL,
  `Points` int(11) DEFAULT NULL,
  `Is_Adaptive_On` int(11) NOT NULL DEFAULT '0',
  `Lo_Scope` int(11) NOT NULL DEFAULT '1',
  `Full_Credit` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Knewton_Adaptive_ID`),
  UNIQUE KEY `Activity_ID` (`Activity_ID`),
  CONSTRAINT `FK_Knewton_Aaptive_Setting_Activity_ID` FOREIGN KEY (`Activity_ID`) REFERENCES `ps_activity` (`Activity_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=794 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_goal` */

DROP TABLE IF EXISTS `ps_knewton_goal`;

CREATE TABLE `ps_knewton_goal` (
  `Goal_Key_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) DEFAULT NULL,
  `Goal_ID` varchar(128) NOT NULL,
  `Goal_Name` varchar(256) DEFAULT NULL,
  `Learning_Instance_ID` varchar(128) DEFAULT NULL,
  `Targets` text,
  `Timing` text,
  `Scope` text,
  `Config` text,
  `Last_Updated` datetime DEFAULT NULL,
  PRIMARY KEY (`Goal_Key_ID`),
  KEY `FK_Goal_Activity_ID` (`Activity_ID`),
  CONSTRAINT `FK_Goal_Activity_ID` FOREIGN KEY (`Activity_ID`) REFERENCES `ps_activity` (`Activity_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_goals` */

DROP TABLE IF EXISTS `ps_knewton_goals`;

CREATE TABLE `ps_knewton_goals` (
  `Goals_Key_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Goals_ID` varchar(40) CHARACTER SET latin1 NOT NULL,
  `Goals_Name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `Registration_ID` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `Learning_Instance_ID` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `Target_Modules` text CHARACTER SET latin1,
  `Recommendable_Modules_Alt` text CHARACTER SET latin1,
  `Max_Recommendation_Size` int(10) DEFAULT NULL,
  `Start_Date` time DEFAULT NULL,
  `Metrics_Enabled` tinyint(1) DEFAULT NULL,
  `Recommendable_Modules` text CHARACTER SET latin1,
  `Goals_State` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `Time_Zone` varchar(64) DEFAULT NULL,
  `Activity_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Goals_Key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_learning_instances` */

DROP TABLE IF EXISTS `ps_knewton_learning_instances`;

CREATE TABLE `ps_knewton_learning_instances` (
  `Learning_Instance_Key_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Learning_Instance_ID` varchar(128) NOT NULL,
  `Learning_Instance_Name` varchar(256) DEFAULT NULL,
  `Graph_ID` varchar(128) NOT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `StuSet_ID` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Learning_Instance_Key_ID`),
  UNIQUE KEY `Learning_Instance_ID` (`Learning_Instance_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_learning_objective` */

DROP TABLE IF EXISTS `ps_knewton_learning_objective`;

CREATE TABLE `ps_knewton_learning_objective` (
  `Knewton_Activity_LO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) DEFAULT NULL,
  `Knewton_Adaptive_ID` int(11) DEFAULT NULL,
  `Goals_ID` int(11) DEFAULT NULL,
  `Learning_Objective_ID` int(11) DEFAULT NULL,
  `Chapter_ID` int(11) DEFAULT NULL,
  `Chapter_Number` int(11) DEFAULT NULL,
  `Learning_Objective_Text` text,
  PRIMARY KEY (`Knewton_Activity_LO_ID`),
  UNIQUE KEY `Activity_ID_LO_ID` (`Activity_ID`,`Learning_Objective_ID`),
  KEY `FK_Adaptive_Setting_LO_ID` (`Knewton_Adaptive_ID`),
  CONSTRAINT `FK_Adaptive_Setting_LO_ID` FOREIGN KEY (`Knewton_Adaptive_ID`) REFERENCES `ps_knewton_adaptive_setting` (`Knewton_Adaptive_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3024 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_lo_mastery` */

DROP TABLE IF EXISTS `ps_knewton_lo_mastery`;

CREATE TABLE `ps_knewton_lo_mastery` (
  `Knewton_LO_Mastery_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Knewton_Activity_LO_ID` int(11) DEFAULT NULL,
  `Activity_Grade_ID` int(11) DEFAULT NULL,
  `Current_Mastery` float DEFAULT '0',
  `Highest_Mastery` float DEFAULT '0',
  `Highest_Score_Record_Date` datetime DEFAULT NULL,
  `Lo_Score` double unsigned DEFAULT '0',
  `Time_Spent` int(11) DEFAULT '0',
  `Lo_State` int(11) DEFAULT '0',
  PRIMARY KEY (`Knewton_LO_Mastery_ID`),
  KEY `idx_Knewton_Activity_LO_ID` (`Knewton_Activity_LO_ID`),
  KEY `FK_Activity_Grade_LO_Mastery_ID` (`Activity_Grade_ID`),
  CONSTRAINT `FK_Activity_Grade_LO_Mastery_ID` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1526 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_lo_record` */

DROP TABLE IF EXISTS `ps_knewton_lo_record`;

CREATE TABLE `ps_knewton_lo_record` (
  `knewton_lo_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `knewton_lo_mastery_id` int(11) NOT NULL COMMENT 'Primary Key of ps_knewton_lo_mastery',
  `mastery_increment` double(10,8) unsigned NOT NULL COMMENT 'Increment of mastery value',
  `record_date` datetime DEFAULT NULL COMMENT 'Record Date',
  PRIMARY KEY (`knewton_lo_record_id`),
  KEY `idx_knewton_lo_record_klmid` (`knewton_lo_mastery_id`),
  CONSTRAINT `fk_knewton_lo_record_klmid` FOREIGN KEY (`knewton_lo_mastery_id`) REFERENCES `ps_knewton_lo_mastery` (`Knewton_LO_Mastery_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_question` */

DROP TABLE IF EXISTS `ps_knewton_question`;

CREATE TABLE `ps_knewton_question` (
  `Knewton_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_ID` int(11) NOT NULL,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Question_Type_Name` varchar(255) DEFAULT NULL,
  `Question_Title` varchar(128) DEFAULT NULL,
  `Question_Snippet` text,
  `Question_Index` int(2) DEFAULT NULL,
  `Learning_Objective_ID` int(11) NOT NULL,
  `Learning_Objective_Text` varchar(255) DEFAULT NULL,
  `Is_Correct` int(2) DEFAULT '0',
  `Is_Practice` int(2) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Instruction_Material_ID` varchar(128) DEFAULT NULL,
  `Instru_Mate_Url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Knewton_Question_ID`),
  UNIQUE KEY `uk_kq_agid_qindex` (`Activity_Grade_ID`,`Question_Index`),
  KEY `uk_kq_qid` (`Question_ID`),
  CONSTRAINT `ps_knewton_question_fk_agid` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_question_grade` */

DROP TABLE IF EXISTS `ps_knewton_question_grade`;

CREATE TABLE `ps_knewton_question_grade` (
  `Knewton_Question_Grade_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Knewton_Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Attempt_Num` int(11) DEFAULT NULL,
  `Question_Value` longtext,
  `Question_Result` longtext,
  `Time_Taken` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `Submission_Date` datetime DEFAULT NULL,
  `Is_Correct` int(2) DEFAULT NULL,
  `Has_Late_Penalty_Worked` tinyint(2) NOT NULL DEFAULT '0',
  `Question_parameter` text,
  `Scramble_Setting` text,
  PRIMARY KEY (`Knewton_Question_Grade_ID`),
  KEY `Knewton_Question_ID` (`Knewton_Question_ID`),
  CONSTRAINT `ps_knewton_question_grade_fk_kqid` FOREIGN KEY (`Knewton_Question_ID`) REFERENCES `ps_knewton_question` (`Knewton_Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_registration` */

DROP TABLE IF EXISTS `ps_knewton_registration`;

CREATE TABLE `ps_knewton_registration` (
  `Registration_Key_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Registration_Id` varchar(128) DEFAULT NULL,
  `Account_Id` varchar(128) DEFAULT NULL,
  `Learning_Instance_Id` varchar(128) DEFAULT NULL,
  `Type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Registration_Key_Id`),
  UNIQUE KEY `Registration_Id` (`Registration_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_knewton_token` */

DROP TABLE IF EXISTS `ps_knewton_token`;

CREATE TABLE `ps_knewton_token` (
  `Token_Key_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Access_Token` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `Refresh_Token` varchar(40) DEFAULT NULL,
  `Token_Type` varchar(10) DEFAULT NULL,
  `Expires_In` varchar(25) DEFAULT NULL,
  `Expires_At` datetime DEFAULT NULL,
  `Account_Id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Token_Key_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_learning_objective` */

DROP TABLE IF EXISTS `ps_learning_objective`;

CREATE TABLE `ps_learning_objective` (
  `Objective_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Chapter_ID` int(11) NOT NULL,
  `Objective_Text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Objective_ID`),
  UNIQUE KEY `uk_chapter_id_text` (`Chapter_ID`,`Objective_Text`),
  KEY `FK_Learning_Objective_Chapter_Chapter_ID` (`Chapter_ID`),
  CONSTRAINT `FK_Learning_Objective_Chapter_Chapter_ID` FOREIGN KEY (`Chapter_ID`) REFERENCES `ps_chapter` (`Chapter_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18322 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_learning_objective_20130930` */

DROP TABLE IF EXISTS `ps_learning_objective_20130930`;

CREATE TABLE `ps_learning_objective_20130930` (
  `Objective_ID` int(11) NOT NULL DEFAULT '0',
  `Chapter_ID` int(11) NOT NULL,
  `Objective_Text` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_learning_outcome` */

DROP TABLE IF EXISTS `ps_learning_outcome`;

CREATE TABLE `ps_learning_outcome` (
  `Learning_Outcome_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Learning_Outcomes_Set_Id` int(11) NOT NULL,
  `Learning_Outcome_Text` varchar(256) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  PRIMARY KEY (`Learning_Outcome_Id`),
  KEY `FK_learningoutcomes` (`Learning_Outcomes_Set_Id`),
  CONSTRAINT `ps_learning_outcome_ibfk_1` FOREIGN KEY (`Learning_Outcomes_Set_Id`) REFERENCES `ps_learning_outcomes_set` (`Learning_Outcomes_Set_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_learning_outcomes_set` */

DROP TABLE IF EXISTS `ps_learning_outcomes_set`;

CREATE TABLE `ps_learning_outcomes_set` (
  `Learning_Outcomes_Set_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Book_Id` int(11) NOT NULL,
  `Learning_Outcomes_Set_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Learning_Outcomes_Set_Id`),
  KEY `FK_learningoutcomes_set` (`Book_Id`),
  CONSTRAINT `ps_learning_outcomes_set_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `ps_book` (`Book_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_log` */

DROP TABLE IF EXISTS `ps_log`;

CREATE TABLE `ps_log` (
  `Log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Log_Operator` varchar(255) NOT NULL,
  `Log_Time` datetime NOT NULL,
  `Log_Content` varchar(1024) NOT NULL,
  `Log_Type` int(11) NOT NULL DEFAULT '0',
  `Log_Level` int(11) NOT NULL DEFAULT '0',
  `Log_Result` int(11) DEFAULT NULL,
  `Create_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Send_Log` int(11) DEFAULT '0',
  `send_failed` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=972128 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_marketer` */

DROP TABLE IF EXISTS `ps_marketer`;

CREATE TABLE `ps_marketer` (
  `Marketer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) NOT NULL,
  `Marketer_Name` varchar(64) NOT NULL,
  `Marketer_Email` varchar(64) NOT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Marketer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_message` */

DROP TABLE IF EXISTS `ps_message`;

CREATE TABLE `ps_message` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Message_Content` varchar(1024) DEFAULT NULL,
  `Message_Status` int(1) DEFAULT NULL,
  `Message_Begin_Time` datetime DEFAULT NULL,
  `Message_End_Time` datetime DEFAULT NULL,
  `Timezone` varchar(50) DEFAULT NULL,
  `Create_Time` datetime NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_national_data_activity` */

DROP TABLE IF EXISTS `ps_national_data_activity`;

CREATE TABLE `ps_national_data_activity` (
  `Record_Date` int(8) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Operation_Type` int(2) NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `idx_recordDate` (`Record_Date`),
  KEY `idx_questionId` (`Question_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_national_data_question` */

DROP TABLE IF EXISTS `ps_national_data_question`;

CREATE TABLE `ps_national_data_question` (
  `National_Data_Question_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Record_Date` int(8) NOT NULL,
  `Activity_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Student_Id` varchar(128) NOT NULL,
  `Show_Hint` int(2) NOT NULL,
  `Is_Correct` int(2) NOT NULL,
  `Attempt_Num` int(6) NOT NULL,
  `Specific_Incorrect` int(6) NOT NULL,
  `Time_Taken` int(11) NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`National_Data_Question_Id`),
  UNIQUE KEY `uk_ndr_question` (`Record_Date`,`Activity_Id`,`Question_Id`,`Student_Id`),
  KEY `idx_activityId` (`Activity_Id`),
  KEY `idx_questionId` (`Question_Id`),
  KEY `idx_studentId` (`Student_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_parameter` */

DROP TABLE IF EXISTS `ps_parameter`;

CREATE TABLE `ps_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Param_ID` varchar(255) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Param_Name` varchar(64) NOT NULL,
  `Param_Type` int(11) NOT NULL,
  `Param_Sub_Type` int(11) NOT NULL,
  `Param_Data` text,
  `Is_Depend_On` int(11) NOT NULL,
  `Depend_On_Param_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_qid` (`Question_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=145947 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_parameter_value` */

DROP TABLE IF EXISTS `ps_parameter_value`;

CREATE TABLE `ps_parameter_value` (
  `Param_Value_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_Grade_ID` int(11) NOT NULL,
  `Param_ID` varchar(255) NOT NULL,
  `Param_Value` varchar(255) DEFAULT NULL,
  `Is_Un_Enroll` int(11) DEFAULT '0',
  PRIMARY KEY (`Param_Value_ID`),
  KEY `FK_Parameter_Value_Question_Grade_Question_Grade_ID` (`Question_Grade_ID`),
  KEY `Is_Un_Enroll` (`Is_Un_Enroll`),
  CONSTRAINT `FK_Parameter_Value_Question_Grade_Question_Grade_ID` FOREIGN KEY (`Question_Grade_ID`) REFERENCES `ps_question_grade` (`Question_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37697 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_parameter_value_unenrolled` */

DROP TABLE IF EXISTS `ps_parameter_value_unenrolled`;

CREATE TABLE `ps_parameter_value_unenrolled` (
  `Param_Value_ID` int(11) NOT NULL,
  `Question_Grade_ID` int(11) NOT NULL,
  `Param_ID` varchar(255) NOT NULL,
  `Param_Value` varchar(255) DEFAULT NULL,
  KEY `Param_Value_ID` (`Param_Value_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_part` */

DROP TABLE IF EXISTS `ps_part`;

CREATE TABLE `ps_part` (
  `Part_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Part_Text` mediumtext,
  `Part_Content` mediumtext,
  `Part_Solution` mediumtext,
  `Part_Index` int(11) DEFAULT NULL,
  `Part_Hint` mediumtext,
  `Part_Grade` decimal(10,4) DEFAULT NULL,
  `Part_Grade_Tip` text,
  `Part_Grade_Tip_Switch` int(2) DEFAULT '0',
  PRIMARY KEY (`Part_ID`),
  KEY `FK_Part_Question_Question_ID` (`Question_ID`),
  CONSTRAINT `FK_Part_Question_Question_ID` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127029 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_plural` */

DROP TABLE IF EXISTS `ps_plural`;

CREATE TABLE `ps_plural` (
  `Plural_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Singular` varchar(128) NOT NULL,
  `Plural` varchar(128) NOT NULL,
  PRIMARY KEY (`Plural_ID`),
  UNIQUE KEY `plural_un_singular` (`Singular`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_policy` */

DROP TABLE IF EXISTS `ps_policy`;

CREATE TABLE `ps_policy` (
  `Policy_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Policy_Name` varchar(128) NOT NULL,
  `Is_Random` tinyint(4) DEFAULT NULL,
  `User_ID` varchar(128) NOT NULL,
  `Show_Feedback` tinyint(4) DEFAULT NULL,
  `Show_Solution` tinyint(4) DEFAULT NULL,
  `Show_Hint` tinyint(4) DEFAULT NULL,
  `Show_Print` tinyint(4) DEFAULT NULL,
  `Show_Book_Ref` tinyint(4) DEFAULT NULL,
  `Is_Get_Answer` tinyint(4) DEFAULT NULL,
  `Question_Grade_Method` tinyint(4) DEFAULT NULL,
  `Submit_Per_Question` tinyint(4) DEFAULT NULL,
  `Attempt_Nums` int(11) NOT NULL,
  `Percent_Deduction` decimal(10,4) NOT NULL,
  `Is_Question_Grading` int(11) DEFAULT '0',
  `Is_Part_Grading` int(11) DEFAULT '0',
  `Type` int(11) NOT NULL,
  `IS_Random_Components` int(11) DEFAULT '0',
  PRIMARY KEY (`Policy_ID`),
  UNIQUE KEY `uk_policy` (`Policy_Name`,`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_policy_mode` */

DROP TABLE IF EXISTS `ps_policy_mode`;

CREATE TABLE `ps_policy_mode` (
  `Policy_Mode_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Policy_Mode_Type` int(11) NOT NULL,
  `Policy_Mode_Name` varchar(64) NOT NULL,
  `Show_Hint` varchar(64) NOT NULL,
  `Show_Feedback_During_Attempt` varchar(64) NOT NULL,
  `Show_Marks_During_Attempt` varchar(64) NOT NULL,
  `Show_Work_Solution_During_Attempt` varchar(64) NOT NULL,
  `Allow_Give_up` varchar(64) NOT NULL,
  `Shuffle_Question_Order` varchar(64) NOT NULL,
  `Show_Feedback_After_Submit` varchar(64) NOT NULL,
  `Show_Marks_After_Submit` varchar(64) NOT NULL,
  `Show_Answer_Solution_After_Submit` varchar(64) NOT NULL,
  `Show_Feedback_Pass_Due_Date` varchar(64) NOT NULL,
  `Show_Marks_Pass_Due_Date` varchar(64) NOT NULL,
  `Show_Answer_Solution_Pass_Due_Date` varchar(64) NOT NULL,
  `Penalties` varchar(64) NOT NULL,
  `Penalty_for_Dropdown` varchar(64) NOT NULL,
  `Penalty_for_Multiple_Choice` varchar(64) NOT NULL,
  `Penalize_Attempts_Per_Question` varchar(64) NOT NULL,
  `Activity_Retakes` varchar(64) NOT NULL,
  `Retakes_Grading_Method` varchar(64) NOT NULL,
  `Graded_Retakes_Count` varchar(64) NOT NULL,
  `Is_Current_Version` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Policy_Mode_ID`),
  UNIQUE KEY `Policy_Mode_Name` (`Policy_Mode_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pool_question` */

DROP TABLE IF EXISTS `ps_pool_question`;

CREATE TABLE `ps_pool_question` (
  `Pool_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pool_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Index` int(11) NOT NULL DEFAULT '0',
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pool_Question_ID`),
  UNIQUE KEY `UK_Pool_Question` (`Pool_ID`,`Question_ID`,`Question_Index`),
  KEY `idx_poolid` (`Pool_ID`),
  KEY `idx_qid` (`Question_ID`),
  CONSTRAINT `FK_Pool_Question` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Pool` FOREIGN KEY (`Pool_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1246 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pool_question_medium` */

DROP TABLE IF EXISTS `ps_pool_question_medium`;

CREATE TABLE `ps_pool_question_medium` (
  `Pool_Question_Medium_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pool_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Index` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Pool_Question_Medium_ID`),
  KEY `FK_Question_Pool_Medium` (`Pool_ID`),
  KEY `FK_Pool_Question_Medium` (`Question_ID`),
  CONSTRAINT `FK_Pool_Question_Medium` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Pool_Medium` FOREIGN KEY (`Pool_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_premade_assignment_link` */

DROP TABLE IF EXISTS `ps_premade_assignment_link`;

CREATE TABLE `ps_premade_assignment_link` (
  `PaLink_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Link_ID` bigint(20) NOT NULL DEFAULT '0',
  `Template_ID` int(11) NOT NULL DEFAULT '0',
  `Book_ID` int(11) NOT NULL,
  `Create_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaLink_ID`),
  UNIQUE KEY `UK_PaLink_Template_ID` (`Template_ID`),
  UNIQUE KEY `UK_Link_Book_ID` (`Link_ID`,`Book_ID`),
  KEY `idx_LinkId` (`Link_ID`),
  KEY `idx_linkBookId` (`Book_ID`),
  CONSTRAINT `FK_Activity_Template_Link` FOREIGN KEY (`Template_ID`) REFERENCES `ps_activity_template` (`Activity_Template_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_q_bak` */

DROP TABLE IF EXISTS `ps_q_bak`;

CREATE TABLE `ps_q_bak` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Item_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Version` int(11) NOT NULL DEFAULT '1',
  `Question_Title` varchar(128) NOT NULL,
  `Comment_Text` varchar(255) DEFAULT NULL,
  `Question_State` int(11) NOT NULL,
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Solution_Text` text,
  `Introduction_Text` text,
  `Question_Author` varchar(128) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `discriminator` varchar(128) DEFAULT NULL,
  `Grade` decimal(10,4) DEFAULT NULL,
  `Latest_Time` datetime DEFAULT NULL,
  `Creator` varchar(128) NOT NULL,
  `Reviewer` varchar(128) NOT NULL,
  `W_Author` int(11) NOT NULL DEFAULT '1',
  `W_Reviewer` int(11) NOT NULL DEFAULT '0',
  `W_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `W_QATester` int(11) NOT NULL DEFAULT '0',
  `W_Editor` int(11) NOT NULL DEFAULT '0',
  `Published` int(11) NOT NULL DEFAULT '0',
  `Demoted` int(11) NOT NULL DEFAULT '0',
  `Last_Operator` int(11) NOT NULL DEFAULT '0',
  `Question_Scope` int(11) NOT NULL DEFAULT '0',
  `Demote_Type` int(11) NOT NULL DEFAULT '0',
  `Question_From` int(11) NOT NULL DEFAULT '0',
  KEY `Item_ID` (`Item_ID`),
  KEY `Question_ID` (`Question_ID`),
  KEY `Question_Version` (`Question_Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question` */

DROP TABLE IF EXISTS `ps_question`;

CREATE TABLE `ps_question` (
  `Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Version` int(11) NOT NULL DEFAULT '1',
  `Question_Title` varchar(128) NOT NULL,
  `Comment_Text` varchar(255) DEFAULT NULL,
  `Question_State` int(11) NOT NULL,
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Description` text,
  `Solution_Text` mediumtext,
  `Introduction_Text` mediumtext,
  `Question_Author` varchar(128) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `discriminator` varchar(128) DEFAULT NULL,
  `Grade` decimal(10,4) DEFAULT NULL,
  `Latest_Time` datetime DEFAULT NULL,
  `Creator` varchar(128) NOT NULL,
  `Reviewer` varchar(128) NOT NULL,
  `W_Author` int(11) NOT NULL DEFAULT '1',
  `W_Reviewer` int(11) NOT NULL DEFAULT '0',
  `W_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `W_QATester` int(11) NOT NULL DEFAULT '0',
  `W_Editor` int(11) NOT NULL DEFAULT '0',
  `Published` int(11) NOT NULL DEFAULT '0',
  `Demoted` int(11) NOT NULL DEFAULT '0',
  `Last_Operator` int(11) NOT NULL DEFAULT '0',
  `Question_Scope` int(11) NOT NULL DEFAULT '0',
  `Demote_Type` int(11) NOT NULL DEFAULT '0',
  `Question_From` int(11) NOT NULL DEFAULT '0',
  `Display_Author` int(11) DEFAULT '0',
  `Question_Misc` varchar(128) DEFAULT NULL,
  `Significant_Figures` int(11) NOT NULL DEFAULT '1',
  `Decimal_Places` int(11) NOT NULL DEFAULT '2',
  `Question_Type` varchar(64) DEFAULT NULL,
  `Question_Type_Name` varchar(255) DEFAULT NULL,
  `Question_Snippet` text,
  `Demote_Note` text,
  `LiveEdit_Note` text,
  `Is_Demo_Question` int(2) NOT NULL DEFAULT '0',
  `Is_Tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  `Has_Algo` int(11) NOT NULL DEFAULT '0',
  `Is_Pool` int(11) NOT NULL DEFAULT '0',
  `Comma_Separate` tinyint(4) NOT NULL DEFAULT '0',
  `Guess_Penalty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Question_ID`),
  KEY `discriminator` (`discriminator`),
  KEY `Question_Author` (`Question_Author`),
  KEY `Question_State` (`Question_State`),
  KEY `Question_Scope` (`Question_Scope`),
  KEY `Item_ID` (`Item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25351 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_bkup_20130930` */

DROP TABLE IF EXISTS `ps_question_bkup_20130930`;

CREATE TABLE `ps_question_bkup_20130930` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_State` int(11) NOT NULL,
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Learning_Objective` int(11) DEFAULT NULL,
  `Section_Reference` int(11) DEFAULT NULL,
  `Difficluty_Rating` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Solution_Text` text,
  `Introduction_Text` text,
  `Question_Author` varchar(128) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Book_ID` int(11) DEFAULT NULL,
  `Chapter_ID` int(11) DEFAULT NULL,
  `discriminator` varchar(128) DEFAULT NULL,
  `Grade` decimal(10,4) DEFAULT NULL,
  `Latest_Time` datetime DEFAULT NULL,
  `Creator` varchar(128) NOT NULL,
  `Reviewer` varchar(128) NOT NULL,
  `W_Author` int(11) NOT NULL DEFAULT '1',
  `W_Reviewer` int(11) NOT NULL DEFAULT '0',
  `W_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `W_QATester` int(11) NOT NULL DEFAULT '0',
  `W_Editor` int(11) NOT NULL DEFAULT '0',
  `Published` int(11) NOT NULL DEFAULT '0',
  `Demoted` int(11) NOT NULL DEFAULT '0',
  `Last_Operator` int(11) NOT NULL DEFAULT '0',
  `Question_Scope` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_book` */

DROP TABLE IF EXISTS `ps_question_book`;

CREATE TABLE `ps_question_book` (
  `Question_Book_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Chapter_ID` int(11) NOT NULL,
  `Section_ID` int(11) NOT NULL,
  `Question_Number` varchar(128) NOT NULL,
  `Difficluty_Rating` int(11) NOT NULL DEFAULT '0',
  `Mapping_Status` int(11) NOT NULL DEFAULT '1',
  `Series` int(11) DEFAULT NULL,
  `Mapping_Origin` int(11) NOT NULL DEFAULT '0',
  `Mapping_Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Question_Book_ID`),
  UNIQUE KEY `Book_ID` (`Book_ID`,`Question_ID`),
  KEY `FK_Question_Book_Question_Question_ID` (`Question_ID`),
  KEY `FK_Question_Book_Book_Book_ID` (`Book_ID`),
  KEY `FK_Question_Book_Chapter_Chapter_ID` (`Chapter_ID`),
  KEY `FK_Question_Book_Section_Section_ID` (`Section_ID`),
  CONSTRAINT `FK_Question_Book_Book_Book_ID` FOREIGN KEY (`Book_ID`) REFERENCES `ps_book` (`Book_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Book_Chapter_Chapter_ID` FOREIGN KEY (`Chapter_ID`) REFERENCES `ps_chapter` (`Chapter_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Book_Question_Question_ID` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Book_Section_Section_ID` FOREIGN KEY (`Section_ID`) REFERENCES `ps_section` (`Section_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39308 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_grade` */

DROP TABLE IF EXISTS `ps_question_grade`;

CREATE TABLE `ps_question_grade` (
  `Question_Grade_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Attempt_Num` int(11) NOT NULL,
  `Graded_Attempt_Num` int(11) DEFAULT '0',
  `Correct_Parts` int(11) NOT NULL DEFAULT '0',
  `Question_Grade` decimal(10,4) NOT NULL,
  `Question_Grade_With_Penalty` decimal(10,4) NOT NULL,
  `Question_Final_Grade` decimal(10,4) DEFAULT NULL,
  `Question_Value` longtext,
  `Question_Result` longtext,
  `Question_Index` int(11) NOT NULL,
  `Is_Viewed_Solution` int(11) DEFAULT NULL,
  `Is_Correct` int(11) DEFAULT '0',
  `Is_Gave_Up` int(11) DEFAULT '0',
  `Is_Reopen` int(11) NOT NULL DEFAULT '0',
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) DEFAULT NULL,
  `Question_Grade_Status` int(11) NOT NULL DEFAULT '0',
  `Temp_ID` int(11) NOT NULL DEFAULT '0',
  `Is_Full_Credit` int(11) DEFAULT '0',
  `Is_Un_Enroll` int(11) DEFAULT '0',
  `Scramble_Setting` text,
  `Submission_Date` datetime DEFAULT NULL,
  `has_Late_penalty_worked` int(11) NOT NULL DEFAULT '0',
  `Question_Grade_With_LatePenalty` decimal(10,4) NOT NULL,
  `Is_Step` tinyint(1) NOT NULL DEFAULT '0',
  `Current_Step` int(11) DEFAULT '1',
  PRIMARY KEY (`Question_Grade_ID`),
  UNIQUE KEY `uk_Question_Grade` (`Activity_Grade_ID`,`Question_ID`,`Attempt_Num`),
  KEY `Activity_ID` (`Activity_ID`),
  KEY `Temp_ID` (`Temp_ID`),
  KEY `Question_ID` (`Question_ID`),
  KEY `Is_Viewed_Solution` (`Is_Viewed_Solution`),
  KEY `Question_ID_2` (`Question_ID`),
  KEY `Question_ID_3` (`Question_ID`),
  KEY `Is_Full_Credit` (`Is_Full_Credit`),
  KEY `Is_Un_Enroll` (`Is_Un_Enroll`),
  CONSTRAINT `FK_Question_Grade_Activity_Grade_Activity_Grade_ID` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29419 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_grade_20150417` */

DROP TABLE IF EXISTS `ps_question_grade_20150417`;

CREATE TABLE `ps_question_grade_20150417` (
  `Question_Grade_ID` int(11) NOT NULL DEFAULT '0',
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Attempt_Num` int(11) NOT NULL,
  `Correct_Parts` int(11) NOT NULL DEFAULT '0',
  `Question_Grade` decimal(10,4) NOT NULL,
  `Question_Grade_With_Penalty` decimal(10,4) NOT NULL,
  `Question_Value` text,
  `Question_Result` text,
  `Question_Index` int(11) NOT NULL,
  `Is_Viewed_Solution` int(11) DEFAULT NULL,
  `Is_Correct` int(11) DEFAULT '0',
  `Is_Gave_Up` int(11) DEFAULT '0',
  `Is_Reopen` int(11) NOT NULL DEFAULT '0',
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) DEFAULT NULL,
  `Question_Grade_Status` int(11) NOT NULL DEFAULT '0',
  `Temp_ID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_grade_reset` */

DROP TABLE IF EXISTS `ps_question_grade_reset`;

CREATE TABLE `ps_question_grade_reset` (
  `Question_Grade_ID` int(11) NOT NULL,
  `Activity_Grade_ID` int(11) DEFAULT NULL,
  `Question_ID` int(11) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Attempt_Num` int(11) DEFAULT NULL,
  `Correct_Parts` int(11) NOT NULL DEFAULT '0',
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Question_Grade_With_Penalty` decimal(10,4) DEFAULT NULL,
  `Question_Value` text,
  `Question_Result` text,
  `Question_Index` int(11) DEFAULT NULL,
  `Is_Viewed_Solution` int(11) DEFAULT NULL,
  `Is_Correct` int(11) DEFAULT '0',
  `Is_Gave_Up` int(11) DEFAULT '0',
  `Is_Reopen` int(11) NOT NULL DEFAULT '0',
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) DEFAULT '0',
  `Question_Grade_Status` int(11) NOT NULL DEFAULT '0',
  KEY `Activity_ID` (`Activity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_grade_summary` */

DROP TABLE IF EXISTS `ps_question_grade_summary`;

CREATE TABLE `ps_question_grade_summary` (
  `QG_Summary_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Attempt_Num` int(11) NOT NULL,
  `Question_Grade` decimal(10,4) NOT NULL,
  `Accepted_Grade` decimal(10,4) NOT NULL,
  `Current_Status` tinyint(1) NOT NULL,
  `Is_Correct` tinyint(2) NOT NULL,
  `Is_Step` tinyint(1) NOT NULL,
  `Current_Step` int(11) NOT NULL,
  `Reserved_1` tinyint(1) DEFAULT NULL,
  `Reserved_2` tinyint(1) DEFAULT NULL,
  `Pool_Question_ID` int(11) NOT NULL DEFAULT '0',
  `Random_Index` int(11) NOT NULL DEFAULT '0',
  `Full_Credit` tinyint(1) NOT NULL DEFAULT '0',
  `Comment_Status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`QG_Summary_ID`),
  UNIQUE KEY `uk_QG_Summary` (`Activity_Grade_ID`,`Question_ID`),
  KEY `idx_qgSummary_acID` (`Activity_ID`),
  KEY `idx_qgSummary_agID` (`Activity_Grade_ID`),
  CONSTRAINT `FK_QG_Summary_AGID` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4997 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_grade_unenrolled` */

DROP TABLE IF EXISTS `ps_question_grade_unenrolled`;

CREATE TABLE `ps_question_grade_unenrolled` (
  `Question_Grade_ID` int(11) NOT NULL,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Attempt_Num` int(11) NOT NULL,
  `Correct_Parts` int(11) NOT NULL DEFAULT '0',
  `Question_Grade` decimal(10,4) NOT NULL,
  `Question_Grade_With_Penalty` decimal(10,4) NOT NULL,
  `Question_Value` text,
  `Question_Result` text,
  `Question_Index` int(11) NOT NULL,
  `Is_Viewed_Solution` int(11) DEFAULT NULL,
  `Is_Correct` int(11) DEFAULT '0',
  `Is_Gave_Up` int(11) DEFAULT '0',
  `Is_Reopen` int(11) NOT NULL DEFAULT '0',
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) DEFAULT NULL,
  `Question_Grade_Status` int(11) NOT NULL DEFAULT '0',
  `Temp_ID` int(11) NOT NULL DEFAULT '0',
  KEY `Question_Grade_ID` (`Question_Grade_ID`),
  KEY `Activity_ID` (`Activity_ID`),
  KEY `Temp_ID` (`Temp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_group` */

DROP TABLE IF EXISTS `ps_question_group`;

CREATE TABLE `ps_question_group` (
  `Group_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Group_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_inuse` */

DROP TABLE IF EXISTS `ps_question_inuse`;

CREATE TABLE `ps_question_inuse` (
  `Question_Inuse_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Course_ID` varchar(128) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Inuse_Status` int(2) NOT NULL DEFAULT '0',
  `Inuse_Data` text,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Question_Inuse_ID`),
  UNIQUE KEY `UK_Question_Inuse` (`Course_ID`,`Question_ID`),
  KEY `idx_courseID` (`Course_ID`),
  KEY `idx_questionID` (`Question_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1990 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_learning_objective` */

DROP TABLE IF EXISTS `ps_question_learning_objective`;

CREATE TABLE `ps_question_learning_objective` (
  `Question_Objective_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_Book_ID` int(11) NOT NULL,
  `Objective_ID` int(11) NOT NULL,
  PRIMARY KEY (`Question_Objective_ID`),
  UNIQUE KEY `Question_Book_ID_2` (`Question_Book_ID`,`Objective_ID`),
  KEY `FK_Question_Objective_Objective_Objective_ID` (`Objective_ID`),
  KEY `Question_Book_ID` (`Question_Book_ID`),
  CONSTRAINT `FK_Objective_Question_Book` FOREIGN KEY (`Question_Book_ID`) REFERENCES `ps_question_book` (`Question_Book_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Question_Objective_Objective_Objective_ID` FOREIGN KEY (`Objective_ID`) REFERENCES `ps_learning_objective` (`Objective_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=234674 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_learning_outcomes` */

DROP TABLE IF EXISTS `ps_question_learning_outcomes`;

CREATE TABLE `ps_question_learning_outcomes` (
  `Question_Outcomes_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Question_Book_Id` int(11) NOT NULL,
  `Learning_Outcome_Id` int(11) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Learning_Outcome_Set_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Question_Outcomes_Id`),
  KEY `Question_Id` (`Question_Id`) USING BTREE,
  CONSTRAINT `ps_question_learning_outcomes_ibfk_1` FOREIGN KEY (`Question_Id`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_national` */

DROP TABLE IF EXISTS `ps_question_national`;

CREATE TABLE `ps_question_national` (
  `Question_ID` int(11) NOT NULL,
  `Summary_Time_Taken` int(11) NOT NULL,
  `Summary_Attemp_Num` int(11) NOT NULL,
  `Avg_Time_Taken` int(11) NOT NULL,
  `Summary_Question_Attemp_Num` bigint(20) NOT NULL,
  `Question_Avg_Time_Taken` bigint(20) NOT NULL,
  `Avg_TimeSpent_Str` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Question_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_review` */

DROP TABLE IF EXISTS `ps_question_review`;

CREATE TABLE `ps_question_review` (
  `Question_Review_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Reviewer_ID` varchar(64) NOT NULL,
  `Enable_Reviewer_Edit` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`Question_Review_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_state_stats` */

DROP TABLE IF EXISTS `ps_question_state_stats`;

CREATE TABLE `ps_question_state_stats` (
  `Stats_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Section_ID` int(11) NOT NULL,
  `Removed` int(11) NOT NULL DEFAULT '0',
  `In_Progress` int(11) NOT NULL DEFAULT '0',
  `Under_Review` int(11) NOT NULL DEFAULT '0',
  `Needs_Revision` int(11) NOT NULL DEFAULT '0',
  `Ready_for_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `With_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `Copyeditor_Rejected` int(11) NOT NULL DEFAULT '0',
  `Copyeditor_Approved` int(11) NOT NULL DEFAULT '0',
  `Ready_for_Publication` int(11) NOT NULL DEFAULT '0',
  `Live` int(11) NOT NULL DEFAULT '0',
  `Demoted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Stats_ID`),
  UNIQUE KEY `uk_section_Id` (`Section_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_statistic` */

DROP TABLE IF EXISTS `ps_question_statistic`;

CREATE TABLE `ps_question_statistic` (
  `Question_Statistic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Index` int(11) NOT NULL DEFAULT '0',
  `Hint_Statistic` int(11) NOT NULL DEFAULT '0',
  `Is_Un_Enroll` int(11) DEFAULT '0',
  `Pool_Question_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Question_Statistic_ID`),
  KEY `Activity_ID` (`Activity_ID`),
  KEY `Statistic_Grade_Question_Index` (`Activity_Grade_ID`,`Question_ID`,`Reset_Last_Attempt_Index`),
  KEY `Is_Un_Enroll` (`Is_Un_Enroll`),
  KEY `idx_qid` (`Question_ID`),
  CONSTRAINT `FK_PS_Activity_Grade` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27008 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_question_statistic_unenrolled` */

DROP TABLE IF EXISTS `ps_question_statistic_unenrolled`;

CREATE TABLE `ps_question_statistic_unenrolled` (
  `Question_Statistic_ID` int(11) NOT NULL,
  `Activity_Grade_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Time_Started` datetime DEFAULT NULL,
  `Time_Recorded` datetime DEFAULT NULL,
  `Current_Enter_Time` datetime DEFAULT NULL,
  `Time_Taken` int(11) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Index` int(11) NOT NULL DEFAULT '0',
  `Hint_Statistic` int(11) NOT NULL DEFAULT '0',
  KEY `Question_Statistic_ID` (`Question_Statistic_ID`),
  KEY `Activity_ID` (`Activity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_review_data` */

DROP TABLE IF EXISTS `ps_review_data`;

CREATE TABLE `ps_review_data` (
  `Review_Data_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Reviewer_ID` varchar(64) NOT NULL,
  `Review_Context` varchar(255) DEFAULT NULL,
  `Review_File_Url` varchar(256) DEFAULT NULL,
  `Review_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Review_Data_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_s` */

DROP TABLE IF EXISTS `ps_s`;

CREATE TABLE `ps_s` (
  `stu_id` varchar(64) NOT NULL,
  `stu_name` varchar(130) DEFAULT NULL,
  `Student_Name_Order` varchar(129) DEFAULT NULL,
  KEY `stu_id` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_section` */

DROP TABLE IF EXISTS `ps_section`;

CREATE TABLE `ps_section` (
  `Section_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Chapter_ID` int(11) NOT NULL,
  `Section_Name` varchar(128) NOT NULL,
  `Order_Index` int(11) NOT NULL,
  `Resource_ID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Section_ID`),
  KEY `FK_Section_Chapter_Chapter_ID` (`Chapter_ID`),
  KEY `Order_Index` (`Order_Index`),
  KEY `Resource_ID` (`Resource_ID`(255)),
  CONSTRAINT `FK_Section_Chapter_Chapter_ID` FOREIGN KEY (`Chapter_ID`) REFERENCES `ps_chapter` (`Chapter_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5215 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_section_author` */

DROP TABLE IF EXISTS `ps_section_author`;

CREATE TABLE `ps_section_author` (
  `Section_Author_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Section_ID` int(11) NOT NULL,
  `Author_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`Section_Author_ID`),
  KEY `FK_Section_Author_Section_Section_ID` (`Section_ID`),
  CONSTRAINT `FK_Section_Author_Section_Section_ID` FOREIGN KEY (`Section_ID`) REFERENCES `ps_section` (`Section_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_section_bkup_20130930` */

DROP TABLE IF EXISTS `ps_section_bkup_20130930`;

CREATE TABLE `ps_section_bkup_20130930` (
  `Section_ID` int(11) NOT NULL DEFAULT '0',
  `Chapter_ID` int(11) NOT NULL,
  `Section_Name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_student` */

DROP TABLE IF EXISTS `ps_student`;

CREATE TABLE `ps_student` (
  `Student_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stu_ID` varchar(64) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Course_ID` varchar(128) NOT NULL,
  `Activity_ID` int(11) DEFAULT NULL,
  `Group_ID` varchar(64) DEFAULT NULL,
  `Stu_First_Name` varchar(64) DEFAULT NULL,
  `Stu_Last_Name` varchar(64) DEFAULT NULL,
  `Stu_Name` varchar(64) DEFAULT NULL,
  `Create_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Is_Un_Enroll` int(11) DEFAULT '0',
  PRIMARY KEY (`Student_ID`),
  KEY `Stu_ID` (`Stu_ID`,`Activity_ID`,`Group_ID`),
  KEY `INDEX_Course_ID` (`Course_ID`),
  KEY `Activity_ID` (`Activity_ID`),
  KEY `Stu_Name` (`Stu_Name`),
  KEY `Is_Un_Enroll` (`Is_Un_Enroll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_student_unenrolled` */

DROP TABLE IF EXISTS `ps_student_unenrolled`;

CREATE TABLE `ps_student_unenrolled` (
  `Student_ID` int(11) NOT NULL,
  `Stu_ID` varchar(64) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Course_ID` varchar(128) NOT NULL,
  `Activity_ID` int(11) DEFAULT NULL,
  `Group_ID` varchar(64) DEFAULT NULL,
  `Stu_First_Name` varchar(64) DEFAULT NULL,
  `Stu_Last_Name` varchar(64) DEFAULT NULL,
  `Stu_Name` varchar(64) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Stu_ID` (`Stu_ID`),
  KEY `INDEX_Course_ID` (`Course_ID`),
  KEY `Activity_ID` (`Activity_ID`),
  KEY `Stu_Name` (`Stu_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_stuset_user` */

DROP TABLE IF EXISTS `ps_stuset_user`;

CREATE TABLE `ps_stuset_user` (
  `StuSet_User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `StuSet_ID` varchar(128) NOT NULL,
  `StuSet_Name` varchar(128) DEFAULT NULL,
  `User_ID` varchar(128) NOT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `First_Name` varchar(128) DEFAULT NULL,
  `Last_Name` varchar(128) DEFAULT NULL,
  `User_Name` varchar(128) DEFAULT NULL,
  `User_Role` int(11) NOT NULL DEFAULT '0',
  `Group_ID` varchar(64) DEFAULT NULL,
  `School_ID_Label` varchar(128) DEFAULT NULL,
  `School_ID` varchar(128) DEFAULT NULL,
  `Is_Un_Enroll` int(11) NOT NULL DEFAULT '0',
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StuSet_User_ID`),
  KEY `StuSet_User_ID` (`StuSet_User_ID`),
  KEY `idx_stuSetID` (`StuSet_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1952512 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_svg_graph` */

DROP TABLE IF EXISTS `ps_svg_graph`;

CREATE TABLE `ps_svg_graph` (
  `Graph_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Queston_ID` int(11) NOT NULL,
  `Graph_Widget_ID` varchar(128) NOT NULL,
  `Design` mediumtext NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Graph_ID`),
  UNIQUE KEY `UK_Graph_Widget_ID` (`Graph_Widget_ID`),
  KEY `FK_SVG_Graph_Question_Question_ID` (`Queston_ID`),
  CONSTRAINT `FK_SVG_Graph_Question_Question_ID` FOREIGN KEY (`Queston_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_taxonomy_filter` */

DROP TABLE IF EXISTS `ps_taxonomy_filter`;

CREATE TABLE `ps_taxonomy_filter` (
  `Filter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Filter_Name` varchar(128) NOT NULL,
  `User_ID` varchar(128) NOT NULL,
  `Book_IDs` varchar(256) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Filter_ID`),
  UNIQUE KEY `UK_TAX_FILTER_NAME_USER_ID` (`Filter_Name`,`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_temp_aginfo` */

DROP TABLE IF EXISTS `ps_temp_aginfo`;

CREATE TABLE `ps_temp_aginfo` (
  `Activity_Grade_ID` int(11) NOT NULL DEFAULT '0',
  `Student_ID` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Student_Name` varchar(128) DEFAULT NULL,
  `Student_Name_Order` varchar(128) DEFAULT NULL,
  `Activity_ID` int(11) NOT NULL,
  `Grade` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Attempt_Num` int(11) NOT NULL,
  `Activity_Grade` decimal(10,4) NOT NULL,
  `Activity_Grade_With_Policy` decimal(10,4) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  `Timezone` varchar(64) DEFAULT NULL,
  `Time_Limit` int(11) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Current_Index` int(11) NOT NULL DEFAULT '1',
  `Prev_Activity_Status` int(11) NOT NULL DEFAULT '0',
  `Activity_Status` int(10) NOT NULL DEFAULT '0',
  `Is_Auto_Submission` int(11) DEFAULT '0',
  `Reset_Last_Attempt_Count` int(10) NOT NULL DEFAULT '0',
  `Reset_Last_Attempt_Action` int(1) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `SourcedId` varchar(200) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Is_Un_Enroll` int(11) DEFAULT '0',
  `Is_Instr_Preview` int(11) DEFAULT '0',
  `Time_Taken` int(11) DEFAULT NULL,
  `Published` int(11) DEFAULT '0',
  `Allow_Practice` int(11) DEFAULT '0',
  `Modified` int(11) DEFAULT '0',
  `Adaptive_Timer` int(11) DEFAULT NULL,
  `Adaptive_Remain_Timer` int(11) DEFAULT NULL,
  `Adaptive_Start_Time` datetime DEFAULT NULL,
  `Adaptive_End_Time` datetime DEFAULT NULL,
  `Adaptive_Time_Taken` int(11) DEFAULT NULL,
  `Adaptive_Question_Start_Time` datetime DEFAULT NULL,
  `Adaptive_Attempt` int(11) DEFAULT NULL,
  `Has_Assign_Goal` int(11) DEFAULT NULL,
  `Adaptive_Question_Grade` decimal(10,4) DEFAULT NULL,
  `Adaptive_Question_ID` int(11) DEFAULT NULL,
  `Adaptive_Question_Status` int(11) NOT NULL DEFAULT '0',
  `Last_Launched_Question_Type` int(2) DEFAULT '0',
  `Late_Work_Days` int(11) NOT NULL DEFAULT '0',
  `Late_Work_Penalty_Percent` int(11) NOT NULL DEFAULT '-1',
  `Has_Late_Penalty_Worked` int(11) NOT NULL DEFAULT '0',
  `Has_Late_Penalty_Cleared` int(11) NOT NULL DEFAULT '0',
  `Init_Role` int(11) NOT NULL DEFAULT '0',
  `Activity_Grade_With_LatePenalty` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_template_learning_objective` */

DROP TABLE IF EXISTS `ps_template_learning_objective`;

CREATE TABLE `ps_template_learning_objective` (
  `Knewton_template_LO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Template_ID` int(11) NOT NULL,
  `Learning_Objective_ID` int(11) NOT NULL,
  `chapter_ID` int(11) DEFAULT NULL,
  `chapter_num` int(11) DEFAULT NULL,
  `learning_objective_text` text,
  PRIMARY KEY (`Knewton_template_LO_ID`),
  UNIQUE KEY `UK_Template_Learning_Objective` (`Activity_Template_ID`,`Learning_Objective_ID`),
  CONSTRAINT `FK_Template_LO` FOREIGN KEY (`Activity_Template_ID`) REFERENCES `ps_activity_template` (`Activity_Template_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_template_question` */

DROP TABLE IF EXISTS `ps_template_question`;

CREATE TABLE `ps_template_question` (
  `Template_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Template_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Series` varchar(128) NOT NULL DEFAULT '0',
  `Attempt_Num` int(11) NOT NULL DEFAULT '0',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Is_Penalties` int(11) DEFAULT '0',
  `Penalties_Percent` decimal(10,2) DEFAULT '0.00',
  `Grading_Method` int(11) DEFAULT NULL,
  `Module_Type` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Avg_National_Time` int(11) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  `Is_Hidden` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Question_Snippet` text,
  `For_Demo` int(2) NOT NULL DEFAULT '0',
  `is_tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Pool_State` int(11) DEFAULT '0',
  `Has_Algo` tinyint(1) NOT NULL DEFAULT '0',
  `Guess_Penalty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Template_Question_ID`),
  KEY `ind_template_question_index` (`Order_Index`),
  KEY `FK_Template_Question_Template_ID` (`Activity_Template_ID`),
  KEY `index_qID` (`Question_ID`),
  CONSTRAINT `FK_Template_Question_Template_ID` FOREIGN KEY (`Activity_Template_ID`) REFERENCES `ps_activity_template` (`Activity_Template_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_template_question_medium` */

DROP TABLE IF EXISTS `ps_template_question_medium`;

CREATE TABLE `ps_template_question_medium` (
  `Template_Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Template_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Template_Question_ID`),
  KEY `FK_TQ_Medium_Template` (`Activity_Template_ID`),
  KEY `UK_Template_Question_Medium` (`Question_ID`,`Activity_Template_ID`,`Order_Index`),
  CONSTRAINT `FK_TQ_Medium_Template` FOREIGN KEY (`Activity_Template_ID`) REFERENCES `ps_activity_template` (`Activity_Template_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_test` */

DROP TABLE IF EXISTS `ps_test`;

CREATE TABLE `ps_test` (
  `Question_Book_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Chapter_ID` int(11) NOT NULL,
  `Section_ID` int(11) NOT NULL,
  `Question_Number` varchar(128) NOT NULL,
  `Difficluty_Rating` int(11) NOT NULL DEFAULT '0',
  `Mapping_Status` int(11) NOT NULL DEFAULT '1',
  `Series` int(11) DEFAULT NULL,
  `Mapping_Origin` int(11) NOT NULL DEFAULT '0',
  `Mapping_Action` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_test1` */

DROP TABLE IF EXISTS `ps_test1`;

CREATE TABLE `ps_test1` (
  `question_book_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_timetaken_entity` */

DROP TABLE IF EXISTS `ps_timetaken_entity`;

CREATE TABLE `ps_timetaken_entity` (
  `TimeTaken_entity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Grade_ID` int(11) NOT NULL,
  `MR_Activity_ID` varchar(128) NOT NULL,
  `Student_ID` varchar(128) NOT NULL,
  `Time_Taken` int(11) DEFAULT NULL,
  `Service_Url` varchar(128) DEFAULT NULL,
  `Consumer_Key` varchar(128) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Submission_Time` datetime DEFAULT NULL,
  `Last_Send_Time` datetime DEFAULT NULL,
  `Fail_Time` int(11) DEFAULT NULL,
  PRIMARY KEY (`TimeTaken_entity_ID`),
  KEY `FK_Time_Activity_Grade_ID` (`Activity_Grade_ID`),
  CONSTRAINT `FK_Time_Activity_Grade_ID` FOREIGN KEY (`Activity_Grade_ID`) REFERENCES `ps_activity_grade` (`Activity_Grade_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_tutorial_question` */

DROP TABLE IF EXISTS `ps_tutorial_question`;

CREATE TABLE `ps_tutorial_question` (
  `Tutorial_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `Step_Question_ID` int(11) NOT NULL,
  `Step_Index` tinyint(1) NOT NULL,
  `Step_Text` text NOT NULL,
  `Create_Time` datetime NOT NULL,
  `Update_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Step_Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`Tutorial_ID`),
  UNIQUE KEY `UK_Tutorial` (`Question_ID`,`Step_Question_ID`,`Step_Index`),
  CONSTRAINT `FK_Tutorial_Question` FOREIGN KEY (`Question_ID`) REFERENCES `ps_question` (`Question_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_user` */

DROP TABLE IF EXISTS `ps_user`;

CREATE TABLE `ps_user` (
  `User_ID` varchar(64) NOT NULL,
  `First_Name` varchar(128) NOT NULL,
  `Last_Name` varchar(128) NOT NULL,
  `User_Name` varchar(128) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL,
  `Creator` varchar(64) NOT NULL,
  `CreateTime` date DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Role` (`Role`),
  KEY `Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_user_assignment_setting` */

DROP TABLE IF EXISTS `ps_user_assignment_setting`;

CREATE TABLE `ps_user_assignment_setting` (
  `user_assignment_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `assignment_type` int(11) NOT NULL DEFAULT '0',
  `assignment_setting_info` varchar(256) DEFAULT NULL,
  `adaptive_setting_info` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `adaptive_switch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_assignment_setting_id`),
  UNIQUE KEY `user_course_assignment` (`user_id`,`course_id`,`assignment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_user_bak` */

DROP TABLE IF EXISTS `ps_user_bak`;

CREATE TABLE `ps_user_bak` (
  `User_ID` varchar(64) NOT NULL,
  `First_Name` varchar(128) NOT NULL,
  `Last_Name` varchar(128) NOT NULL,
  `User_Name` varchar(128) DEFAULT NULL,
  `Password` varchar(32) NOT NULL,
  `Role` int(11) NOT NULL,
  `Creator` varchar(64) NOT NULL,
  `CreateTime` date DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ps_user_permision` */

DROP TABLE IF EXISTS `ps_user_permision`;

CREATE TABLE `ps_user_permision` (
  `Permision_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(64) NOT NULL,
  `Resource` int(11) NOT NULL,
  PRIMARY KEY (`Permision_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `FK_User_Permision_User_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `ps_user` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_widget` */

DROP TABLE IF EXISTS `ps_widget`;

CREATE TABLE `ps_widget` (
  `WidgetId` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionId` int(11) DEFAULT NULL,
  `WidgetDivId` varchar(255) DEFAULT NULL,
  `WidgetName` varchar(128) NOT NULL,
  `Creator` varchar(128) NOT NULL,
  `WidgetData` mediumtext,
  `ImageData` mediumtext,
  `WidgetType` int(11) NOT NULL DEFAULT '0',
  `CreateTime` datetime DEFAULT NULL,
  `LatestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`WidgetId`),
  KEY `idx_qid` (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2219 DEFAULT CHARSET=utf8;

/*Table structure for table `stu_new` */

DROP TABLE IF EXISTS `stu_new`;

CREATE TABLE `stu_new` (
  `stu_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tem_graph` */

DROP TABLE IF EXISTS `tem_graph`;

CREATE TABLE `tem_graph` (
  `key` text,
  `value1` mediumtext,
  `value2` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `temp_enroll` */

DROP TABLE IF EXISTS `temp_enroll`;

CREATE TABLE `temp_enroll` (
  `d` int(11) NOT NULL,
  `c` varchar(50) NOT NULL,
  `s` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `temp_fix_508` */

DROP TABLE IF EXISTS `temp_fix_508`;

CREATE TABLE `temp_fix_508` (
  `create_time` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `course_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `temp_knewton_account_20160808` */

DROP TABLE IF EXISTS `temp_knewton_account_20160808`;

CREATE TABLE `temp_knewton_account_20160808` (
  `Account_Key_ID` int(11) NOT NULL DEFAULT '0',
  `Account_ID` varchar(128) DEFAULT NULL,
  `User_ID` varchar(128) DEFAULT NULL,
  `Email_Verified` tinyint(1) DEFAULT NULL,
  `Access_Token` varchar(128) DEFAULT NULL,
  `Refresh_Token` varchar(128) DEFAULT NULL,
  `Expires_In` int(11) DEFAULT NULL,
  `Expires_At` datetime DEFAULT NULL,
  `Is_System_User` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_question_20160729` */

DROP TABLE IF EXISTS `temp_question_20160729`;

CREATE TABLE `temp_question_20160729` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Item_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Version` int(11) NOT NULL DEFAULT '1',
  `Question_Title` varchar(128) NOT NULL,
  `Comment_Text` varchar(255) DEFAULT NULL,
  `Question_State` int(11) NOT NULL,
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Description` text,
  `Solution_Text` mediumtext,
  `Introduction_Text` mediumtext,
  `Question_Author` varchar(128) NOT NULL,
  `Create_Time` datetime NOT NULL,
  `discriminator` varchar(128) DEFAULT NULL,
  `Grade` decimal(10,4) DEFAULT NULL,
  `Latest_Time` datetime DEFAULT NULL,
  `Creator` varchar(128) NOT NULL,
  `Reviewer` varchar(128) NOT NULL,
  `W_Author` int(11) NOT NULL DEFAULT '1',
  `W_Reviewer` int(11) NOT NULL DEFAULT '0',
  `W_Copyeditor` int(11) NOT NULL DEFAULT '0',
  `W_QATester` int(11) NOT NULL DEFAULT '0',
  `W_Editor` int(11) NOT NULL DEFAULT '0',
  `Published` int(11) NOT NULL DEFAULT '0',
  `Demoted` int(11) NOT NULL DEFAULT '0',
  `Last_Operator` int(11) NOT NULL DEFAULT '0',
  `Question_Scope` int(11) NOT NULL DEFAULT '0',
  `Demote_Type` int(11) NOT NULL DEFAULT '0',
  `Question_From` int(11) NOT NULL DEFAULT '0',
  `Display_Author` int(11) DEFAULT '0',
  `Question_Misc` varchar(128) DEFAULT NULL,
  `Significant_Figures` int(11) NOT NULL DEFAULT '1',
  `Decimal_Places` int(11) NOT NULL DEFAULT '2',
  `Question_Type` varchar(64) DEFAULT NULL,
  `Question_Snippet` text,
  `Demote_Note` text,
  `LiveEdit_Note` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_question_book_20160218` */

DROP TABLE IF EXISTS `temp_question_book_20160218`;

CREATE TABLE `temp_question_book_20160218` (
  `Question_Book_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Chapter_ID` int(11) NOT NULL,
  `Section_ID` int(11) NOT NULL,
  `Question_Number` varchar(128) NOT NULL,
  `Difficluty_Rating` int(11) NOT NULL DEFAULT '0',
  `Mapping_Status` int(11) NOT NULL DEFAULT '1',
  `Series` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_question_comp_type` */

DROP TABLE IF EXISTS `temp_question_comp_type`;

CREATE TABLE `temp_question_comp_type` (
  `question_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `c_type` varchar(64) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_question_type` */

DROP TABLE IF EXISTS `temp_question_type`;

CREATE TABLE `temp_question_type` (
  `question_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `question_type` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_questionlibrary_40_0` */

DROP TABLE IF EXISTS `temp_questionlibrary_40_0`;

CREATE TABLE `temp_questionlibrary_40_0` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Activity_ID` int(4) NOT NULL DEFAULT '0',
  `User_ID` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `User_Role` int(1) NOT NULL DEFAULT '0',
  `Question_Num` varchar(128) NOT NULL,
  `Series` varchar(255) DEFAULT NULL,
  `Question_Title` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(255) DEFAULT NULL,
  `Order_Index` int(11) NOT NULL,
  `Avg_TimeSpend` varchar(20) DEFAULT NULL,
  `Is_Norton` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Algo` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Mixed` int(1) NOT NULL DEFAULT '0',
  `Is_Use` int(1) NOT NULL DEFAULT '0',
  `Order_Question_Title` varchar(128) DEFAULT NULL,
  `Is_Tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  KEY `index_qid` (`Question_ID`),
  KEY `index_acid` (`Activity_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_questionlibrary_40_8` */

DROP TABLE IF EXISTS `temp_questionlibrary_40_8`;

CREATE TABLE `temp_questionlibrary_40_8` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Activity_ID` int(4) NOT NULL DEFAULT '0',
  `User_ID` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `User_Role` int(1) NOT NULL DEFAULT '0',
  `Question_Num` varchar(128) NOT NULL,
  `Series` varchar(255) DEFAULT NULL,
  `Question_Title` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(255) DEFAULT NULL,
  `Order_Index` int(11) NOT NULL,
  `Avg_TimeSpend` varchar(20) DEFAULT NULL,
  `Is_Norton` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Algo` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Mixed` int(1) NOT NULL DEFAULT '0',
  `Is_Use` int(1) NOT NULL DEFAULT '0',
  `Order_Question_Title` varchar(128) DEFAULT NULL,
  `Is_Tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  KEY `index_qid` (`Question_ID`),
  KEY `index_acid` (`Activity_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_questionlibrary_id` */

DROP TABLE IF EXISTS `temp_questionlibrary_id`;

CREATE TABLE `temp_questionlibrary_id` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `User_Id` varchar(128) NOT NULL,
  `User_Role` smallint(5) unsigned NOT NULL,
  `Question_Num` varchar(20) DEFAULT NULL,
  `Series` varchar(20) DEFAULT NULL,
  `Question_Title` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  `Avg_TimeSpend` varchar(20) DEFAULT NULL,
  `Is_Norton` char(2) DEFAULT NULL,
  `Is_Algo` char(2) DEFAULT NULL,
  `Is_Mixed` char(2) DEFAULT NULL,
  `is_use` int(2) DEFAULT '0',
  `order_question_title` varchar(128) DEFAULT NULL,
  `Is_Tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Blooms_type_domain` varchar(20) DEFAULT NULL,
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  KEY `index_qid` (`Question_ID`),
  KEY `index_acid` (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_questionlibrary_undefined_0` */

DROP TABLE IF EXISTS `temp_questionlibrary_undefined_0`;

CREATE TABLE `temp_questionlibrary_undefined_0` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Activity_ID` int(3) NOT NULL DEFAULT '0',
  `User_ID` varchar(9) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `User_Role` int(1) NOT NULL DEFAULT '0',
  `Question_Num` varchar(128) NOT NULL,
  `Series` varchar(255) DEFAULT NULL,
  `Question_Title` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(255) DEFAULT NULL,
  `Order_Index` int(11) NOT NULL,
  `Avg_TimeSpend` varchar(20) DEFAULT NULL,
  `Is_Norton` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Algo` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Is_Mixed` int(1) NOT NULL DEFAULT '0',
  `Is_Use` int(1) NOT NULL DEFAULT '0',
  `Order_Question_Title` varchar(128) DEFAULT NULL,
  `Is_Tutorial` tinyint(1) NOT NULL DEFAULT '0',
  `Blooms_Type_domain` varchar(128) DEFAULT NULL,
  `Pool_State` int(11) NOT NULL DEFAULT '0',
  KEY `index_qid` (`Question_ID`),
  KEY `index_acid` (`Activity_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_section_20160218` */

DROP TABLE IF EXISTS `temp_section_20160218`;

CREATE TABLE `temp_section_20160218` (
  `chp_id1` int(11) NOT NULL,
  `chp_id2` int(11) NOT NULL,
  `sec_id1` int(11) NOT NULL DEFAULT '0',
  `sec_id2` int(11) NOT NULL DEFAULT '0',
  `sec_name1` varchar(128) NOT NULL,
  `sec_name2` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `temp_template_question_20160704` */

DROP TABLE IF EXISTS `temp_template_question_20160704`;

CREATE TABLE `temp_template_question_20160704` (
  `Template_Question_ID` int(11) NOT NULL DEFAULT '0',
  `Activity_Template_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Question_Number` varchar(128) NOT NULL,
  `Question_Title` varchar(128) NOT NULL,
  `Question_Grade` decimal(10,4) DEFAULT NULL,
  `Series` varchar(128) NOT NULL DEFAULT '0',
  `Attempt_Num` int(11) NOT NULL DEFAULT '0',
  `Allow_Practice` int(11) NOT NULL DEFAULT '0',
  `Is_Penalties` int(11) DEFAULT '0',
  `Penalties_Percent` decimal(10,2) DEFAULT '0.00',
  `Grading_Method` int(11) DEFAULT NULL,
  `Module_Type` varchar(128) DEFAULT NULL,
  `Question_Type` varchar(64) DEFAULT NULL,
  `Avg_National_Time` int(11) DEFAULT NULL,
  `Order_Index` int(11) DEFAULT NULL,
  `Is_Hidden` int(11) NOT NULL DEFAULT '0',
  `Show_Hints` int(11) NOT NULL DEFAULT '0',
  `Show_Question_Grade` int(11) NOT NULL DEFAULT '0',
  `Show_Correct_Answer` int(11) NOT NULL DEFAULT '0',
  `Show_Feedback` int(11) NOT NULL DEFAULT '0',
  `Show_Answer_Soution` int(11) NOT NULL DEFAULT '0',
  `Show_Mark` int(11) NOT NULL DEFAULT '1',
  `Question_Snippet` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `test_question_book` */

DROP TABLE IF EXISTS `test_question_book`;

CREATE TABLE `test_question_book` (
  `Question_Book_ID` int(11) NOT NULL DEFAULT '0',
  `Question_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Chapter_ID` int(11) NOT NULL,
  `Section_ID` int(11) NOT NULL,
  `question_number` varchar(255) DEFAULT NULL,
  `Difficluty_Rating` int(11) NOT NULL,
  `Mapping_Status` int(11) NOT NULL DEFAULT '1',
  `Series` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
