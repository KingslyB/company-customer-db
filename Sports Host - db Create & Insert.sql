
/*Dropping existing database if it exists*/
DROP DATABASE IF EXISTS dbSportsHost;
GO

/*Creating a new database.*/
CREATE DATABASE dbSportsHost;
GO

/*The rest of this script will use the following database*/
USE dbSportsHost;
GO

/* Drop the existing tables.
DROP TABLE tblCoaches;
DROP TABLE tblCompPlayers;
DROP TABLE tblRecPlayers;
DROP TABLE tblTeamRoster;
DROP TABLE tblTeams;
*/

CREATE TABLE tblRecPlayers (
	PlayerID CHAR(5) NOT NULL UNIQUE,
	PlayerFirst CHAR(30),
	PlayerLast CHAR (30),
	PlayerBirthDate DATE,
	PlayerIsResident BIT,
	FeesPaid NUMERIC(15,2),
	PRIMARY KEY (PlayerID));

INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10001','John','Smith','1991-12-12 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10002','Mary','Smith','1990-01-02 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10003','Andrew','Smith','1986-08-08 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10004','Tim','Brown','1991-12-13 00:00:00',1,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10005','Joanne','Brown','1990-03-01 00:00:00',1,50.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10006','Angela','Ashton','1990-02-02 00:00:00',0,50.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10007','John','Boddeveld Jr.','1990-10-10 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10008','Chris','Taylor','1987-08-08 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10009','Martin','Taylor','1990-09-09 00:00:00',1,0.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10010','Amber','Taylor','1991-04-04 00:00:00',0,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10011','Annie','White','1991-05-05 00:00:00',1,125.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10012','Bobby','White','1989-06-30 00:00:00',1,50.00);
INSERT INTO tblRecPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('10013','Jackie','Lerner','1993-07-01 00:00:00',1,50.00);

	
CREATE TABLE tblCompPlayers (
	PlayerID CHAR(5) NOT NULL UNIQUE,
	PlayerFirst CHAR(30),
	PlayerLast CHAR (30),
	PlayerBirthDate DATE,
	PlayerIsResident BIT,
	FeesPaid NUMERIC(15,2),
	PRIMARY KEY (PlayerID));

INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20001','Tony','Green','1991-12-12 00:00:00',0,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20002','Mary','Green','1990-10-01 00:00:00',0,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20003','Barry','George','1990-11-11 00:00:00',0,0.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20004','Mary','George','1998-04-04 00:00:00',0,0.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20005','Allan','Griff','1990-05-06 00:00:00',1,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20006','Anne','Griff','1992-04-01 00:00:00',1,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20007','Adrianne','Griff','1994-03-03 00:00:00',1,100.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20008','Andy','Huff','1996-05-09 00:00:00',0,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20009','Barbara','Huff','1994-07-09 00:00:00',0,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20010','Andrew','Jackson','1993-01-09 00:00:00',0,100.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20011','Kaylie','Jackson','1991-09-01 00:00:00',1,100.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20012','George','Lerner','1991-03-08 00:00:00',1,300.00);
INSERT INTO tblCompPlayers(PlayerID,PlayerFirst,PlayerLast,PlayerBirthDate,PlayerIsResident,FeesPaid) VALUES ('20013','Jackie','Lerner','1993-07-01 00:00:00',1,300.00);


CREATE TABLE tblTeams (
	TeamID CHAR(3) NOT NULL UNIQUE,
	TeamName CHAR(30),
	TeamCoach CHAR(5),
	TeamIsRec BIT,
	PRIMARY KEY (TeamID));

INSERT INTO tblTeams(TeamID,TeamName,TeamCoach,TeamIsRec) VALUES ('CB1','Canadiens','90001','0');
INSERT INTO tblTeams(TeamID,TeamName,TeamCoach,TeamIsRec) VALUES ('CG1','Avalanche','90003','0');
INSERT INTO tblTeams(TeamID,TeamName,TeamCoach,TeamIsRec) VALUES ('RB1','Rangers','90001','1');
INSERT INTO tblTeams(TeamID,TeamName,TeamCoach,TeamIsRec) VALUES ('RB2','Leafs','90002','1');


CREATE TABLE tblTeamRoster (
	TeamID CHAR(3) NOT NULL,
	PlayerID CHAR(5) NOT NULL,
	PRIMARY KEY (TeamID, PlayerID));

INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20001');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20003');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20005');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20008');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20010');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CB1','20012');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','10006');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20002');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20004');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20006');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20007');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20009');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20011');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('CG1','20013');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','10001');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','10003');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','10005');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','10010');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','10011');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','20001');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB1','20012');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB2','10004');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB2','10007');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB2','10008');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB2','10009');
INSERT INTO tblTeamRoster(TeamID,PlayerID) VALUES ('RB2','10012');


CREATE TABLE tblCoaches (
	CoachID CHAR(5) NOT NULL,
	CoachFirst CHAR(30),
	CoachLast CHAR(30),
	CoachAddress1 CHAR(50),
	CoachAddress2 CHAR(50),
	CoachCity CHAR(30),
	CoachPostal CHAR(6),
	PRIMARY KEY (CoachID));
	
INSERT INTO tblCoaches (CoachID,CoachFirst,CoachLast,CoachAddress1,CoachAddress2,CoachCity,CoachPostal) VALUES ('90001','John','Boddeveld Sr.','1000 Simcoe St. N.','','Bowmanville','L1H2L2');
INSERT INTO tblCoaches (CoachID,CoachFirst,CoachLast,CoachAddress1,CoachAddress2,CoachCity,CoachPostal) VALUES ('90002','Mary','Warner','1200 Queen St. E.','Apt. 101','Whitby','L2J2K2');
INSERT INTO tblCoaches (CoachID,CoachFirst,CoachLast,CoachAddress1,CoachAddress2,CoachCity,CoachPostal) VALUES ('90003','Joanne','Snider','345 King St. W.','','Whitby','L4J2R2');
INSERT INTO tblCoaches (CoachID,CoachFirst,CoachLast,CoachAddress1,CoachAddress2,CoachCity,CoachPostal) VALUES ('90004','Bob','Fletcher','54 Park Rd. N','Apt. 23','Oshawa','L7H2B2');
