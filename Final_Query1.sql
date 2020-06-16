CREATE TABLE manager
(	manid		INT			NOT NULL,
	fname		VARCHAR(30)	NOT NULL,
	lname		VARCHAR(30)	NOT NULL,
	dob			DATE		NOT NULL,
	hourlypay	INT			NOT NULL,
	bonus		INT			NULL,
	email		VARCHAR(30)	NOT NULL,
	PRIMARY KEY (manid)	);

CREATE TABLE manphone
(	manid		INT			NOT NULL,
	phonenum	VARCHAR(30) NOT NULL,
	label		VARCHAR(30) NOT NULL,
	PRIMARY KEY (manid, phonenum),
	FOREIGN KEY (manid) REFERENCES manager(manid)	
						ON DELETE CASCADE);

CREATE TABLE cleaner
(	cleanid		INT			NOT NULL,
	fname		VARCHAR(30)	NOT NULL,
	lname		VARCHAR(30)	NOT NULL,
	dob			DATE		NOT NULL,
	hourlypay	INT			NOT NULL,
	phonenum	VARCHAR(30) NOT NULL,
	manid		INT			DEFAULT 1,
	PRIMARY KEY (cleanid),
	FOREIGN KEY (manid) REFERENCES manager(manid)	
						ON DELETE SET DEFAULT
						ON UPDATE CASCADE);

CREATE TABLE receptionist
(	recid		INT			NOT NULL,
	fname		VARCHAR(30)	NOT NULL,
	lname		VARCHAR(30)	NOT NULL,
	dob			DATE		NOT NULL,
	hourlypay	INT			NOT NULL,
	phonenum	VARCHAR(30) NOT NULL,
	email		VARCHAR(30)	NOT NULL,
	manid		INT			DEFAULT 1,
	PRIMARY KEY (recid),
	FOREIGN KEY (manid) REFERENCES manager(manid)
						ON DELETE SET DEFAULT
						ON UPDATE CASCADE);

CREATE TABLE trainer
(	trainerid	INT			NOT NULL,
	fname		VARCHAR(30)	NOT NULL,
	lname		VARCHAR(30)	NOT NULL,
	dob			DATE		NOT NULL,
	hourlypay	INT			NOT NULL,
	phonenum	VARCHAR(30) NOT NULL,
	email		VARCHAR(30)	NOT NULL,
	manid		INT			DEFAULT 1,
	PRIMARY KEY (trainerid),
	FOREIGN KEY (manid) REFERENCES manager(manid)
						ON DELETE SET DEFAULT
						ON UPDATE CASCADE);

CREATE TABLE provider
(	provid		INT			NOT NULL,
	name		VARCHAR(30)	NOT NULL,
	location	VARCHAR(30) NOT NULL,
	phonenum	VARCHAR(30)	NOT NULL,
	email		VARCHAR(30) NOT NULL,
	manid		INT			DEFAULT 1,
	PRIMARY KEY (provid),
	FOREIGN KEY (manid) REFERENCES manager(manid)	
						ON DELETE SET DEFAULT
						ON UPDATE CASCADE);

CREATE TABLE exercisetype
(	typeid		INT			NOT NULL,
	name		VARCHAR(30) NOT NULL,
	PRIMARY KEY (typeid)	);

CREATE TABLE equipment
(	eqid		INT			NOT NULL,
	name		VARCHAR(30) NOT NULL,
	provid		INT			NOT NULL,
	typeid		INT			NOT NULL,
	cleanid		INT			DEFAULT 1,
	weight		INT			NULL,
	PRIMARY KEY (eqid),
	FOREIGN KEY (provid)  REFERENCES provider(provid)
						  ON DELETE CASCADE,
	FOREIGN KEY (typeid)  REFERENCES exercisetype(typeid),
	FOREIGN KEY (cleanid) REFERENCES cleaner(cleanid)	
						  ON DELETE SET DEFAULT
						  ON UPDATE CASCADE);

CREATE TABLE hasspecialty
(	trainerid	INT	NOT NULL,
	typeid		INT NOT NULL,
	PRIMARY KEY (trainerid, typeid),
	FOREIGN KEY (trainerid) REFERENCES trainer(trainerid)
							ON DELETE CASCADE,
	FOREIGN KEY (typeid)	REFERENCES exercisetype(typeid)	);

CREATE TABLE class
(	classid		INT			NOT NULL,
	name		VARCHAR(30)	NOT NULL,
	typeid		INT			NOT NULL,
	daysheld	VARCHAR(10)	NOT NULL,
	timeheld	VARCHAR(30)	NOT NULL,
	location	VARCHAR(30)	NOT NULL,
	trainerid	INT			NOT NULL,
	PRIMARY KEY (classid),
	FOREIGN KEY (typeid)	REFERENCES exercisetype(typeid),
	FOREIGN KEY (trainerid) REFERENCES trainer(trainerid)
							ON DELETE CASCADE);

CREATE TABLE classuses
(	classid		INT	NOT NULL,
	eqid		INT	NOT NULL,
	PRIMARY KEY (classid, eqid),
	FOREIGN KEY (classid) REFERENCES class(classid)
						  ON DELETE CASCADE,
	FOREIGN KEY (eqid)	  REFERENCES equipment(eqid)
						  ON DELETE CASCADE);

CREATE TABLE member
(	memberid		INT			NOT NULL,
	fname			VARCHAR(30)	NOT NULL,
	lname			VARCHAR(30) NOT NULL,
	mbrstartdate	DATE		NOT NULL,
	mbrenddate		DATE		NOT NULL,
	dob				DATE		NOT NULL,
	platenddate		DATE		NULL,
	trainerid		INT			NULL,
	referredby		INT			NULL,
	PRIMARY KEY (memberid),
	FOREIGN KEY (trainerid)  REFERENCES trainer(trainerid)
										ON DELETE SET NULL
										ON UPDATE CASCADE,
	FOREIGN KEY (referredby) REFERENCES member(memberid));

CREATE TABLE checksin
(	memberid	INT			NOT NULL,
	date		DATE		NOT NULL,
	time		VARCHAR(30)	NOT NULL,
	recid		INT			DEFAULT 0,
	PRIMARY KEY (memberid, date, time),
	FOREIGN KEY (memberid)  REFERENCES member(memberid)
							ON DELETE CASCADE,
	FOREIGN KEY (recid)		REFERENCES receptionist(recid)
							ON DELETE SET NULL
							ON UPDATE CASCADE);

CREATE TABLE registeredfor
(	classid		INT	NOT NULL,
	memberid	INT NOT NULL,
	PRIMARY KEY (classid, memberid),
	FOREIGN KEY (classid)  REFERENCES class(classid)
						   ON DELETE CASCADE,
	FOREIGN KEY (memberid) REFERENCES member(memberid)
						   ON DELETE CASCADE);
