--DROP  SCHEMA IF EXISTS Oblig1-Oppgave4 CASCADE; --Uncomment for å slette og lage alt på nytt.
CREATE SCHEMA Oblig1-Oppgave4;
SET search_path TO Oblig1-Oppgave4;

CREATE TABLE FACULTY(
	fCode varchar(3),
	fName varchar(80),
	fPhoneNr varchar(10),
	fAddress varchar(80),
	CONSTRAINT FacultyPK PRIMARY KEY (fCode)
);

CREATE TABLE COURSE(
	cCode varchar(6),
	cName varchar(80),
	cYear date,
	CONSTRAINT CoursePK PRIMARY KEY (cCode)
);
CREATE TABLE TEACHER(
	TeacherID varchar(6),
	tName varchar(80),
	fCode varchar(3),
	CONSTRAINT TeacherPK PRIMARY KEY (TeacherID),
	CONSTRAINT FacultyFK FOREIGN KEY (fCode) REFERENCES FACULTY(fCode)
);

CREATE TABLE PROGRAM(
	ProgID MEDIUMINT NOT NULL AUTO_INCREMENT,
	progName varchar(80),
	CONSTRAINT ProgramPK PRIMARY KEY (ProgId)
);

CREATE TABLE DEPARTMENT(
	DepID MEDIUMINT NOT NULL AUTO_INCREMENT,
	DepName varchar(80),
	fCode varchar(3),
	CONSTRAINT DepartmentPK PRIMARY KEY (DepID),
	CONSTRAINT FacultyFK FOREIGN KEY (fCode) REFERENCES FACULTY(fCode)
);

CREATE TABLE COURSE_SCEDULE(
	SchedID MEDIUMINT NOT NULL AUTO_INCREMENT,
	cYear date,
	TeacherID varchar(6),
	cCode varchar(6),
	CONSTRAINT Course_SchedulePK PRIMARY KEY (SchedID),
	CONSTRAINT TeacherFK FOREIGN KEY (TeacherID) REFERENCES TEACHER(TeacherID),
	CONSTRAINT CourseFK FOREIGN KEY (cCode) REFERENCES COURSE(cCode)
);

CREATE TABLE STUDENT(
	StudentID varchar(6),
	BirthID varchar(11),
	sName varchar(80),
	curAddress varchar(80),
	sPhoneNr varchar(11),
	homAddress varchar(80),
	bDate DATE,
	Gender varchar(10),
	sYear INTEGER,
	level varchar(10),
	fCode varchar(3),
	ProgID MEDIUMINT,
	DepID MEDIUMINT,
	CONSTRAINT StudentPK PRIMARY KEY (SudentID),
	UNIQUE KEY (BirthID),
	CONSTRAINT FacultyFK FOREIGN KEY (fCode) REFERENCES FACULTY(fCode),
	CONSTRAINT ProgramFK FOREIGN KEY (ProgID) REFERENCES PROGRAM(ProgID),
	CONSTRAINT DepartmentFK FOREIGN KEY (DepID) REFERENCES DEPARTMENT(DepID)
);

CREATE TABLE Grades(
	GradeID MEDIUMINT NOT NULL AUTO_INCREMENT,
	cYear DATE,
	CourseID VARCHAR(6),
	StudentID varchar(6),
	CONSTRAINT GradePK PRIMARY KEY (GradeID),
	CONSTRAINT CourseFK FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID),
	CONSTRAINT StudentFK FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);