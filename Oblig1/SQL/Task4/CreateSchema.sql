
DROP TABLE IF EXISTS FACULTY;
CREATE TABLE FACULTY(
	fCode varchar(3), --Valgt Varcha siden coden kan inneholde tekst
	fName varchar(80),
	fPhoneNr varchar(10),
	fAddress varchar(80),
	CONSTRAINT FacultyPK PRIMARY KEY (fCode)
);

DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE(
	cCode varchar(6),
	cName varchar(80),
	cYear date, --year er inkludert i denne datatypen. Dermed ga det mening for meg å sette den til date
	CONSTRAINT CoursePK PRIMARY KEY (cCode)
);

DROP TABLE IF EXISTS TEACHER;
CREATE TABLE TEACHER(
	TeacherID varchar(6),
	tName varchar(80),
	fCode varchar(3),
	CONSTRAINT TeacherPK PRIMARY KEY (TeacherID),
	CONSTRAINT FacultyFK FOREIGN KEY (fCode) REFERENCES FACULTY(fCode)
);
DROP TABLE IF EXISTS PROGRAM;
CREATE TABLE PROGRAM(
	ProgID MEDIUMINT NOT NULL AUTO_INCREMENT,
	progName varchar(80),
	CONSTRAINT ProgramPK PRIMARY KEY (ProgId)
);

DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT(
	DepID MEDIUMINT NOT NULL AUTO_INCREMENT,
	DepName varchar(80),
	fCode varchar(3),
	CONSTRAINT DepartmentPK PRIMARY KEY (DepID),
	CONSTRAINT FacultyFKdep FOREIGN KEY (fCode) REFERENCES FACULTY(fCode)
);

DROP TABLE IF EXISTS COURSE_SCEDULE;
CREATE TABLE COURSE_SCEDULE(
	SchedID MEDIUMINT NOT NULL AUTO_INCREMENT,
	cYear date,
	TeacherID varchar(6),
	cCode varchar(6),
	CONSTRAINT Course_SchedulePK PRIMARY KEY (SchedID),
	CONSTRAINT TeacherFK FOREIGN KEY (TeacherID) REFERENCES TEACHER(TeacherID),
	CONSTRAINT CourseFK FOREIGN KEY (cCode) REFERENCES COURSE(cCode)
);

DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
	StudentID VARCHAR(6),
	BirthID VARCHAR(11),
	sName VARCHAR(80),
	curAddress VARCHAR(80),
	sPhoneNr VARCHAR(11),
	homAddress VARCHAR(80),
	bDate DATE,
	Gender ENUM('male','female','Non','Other'),--Siden 3 og 4 enum verdier tar like mye plass (trenger 2 bits, legger jeg til ekstra)
	sYear INTEGER, --Denne verdien kan tenkes at man f.eks vil legge til på for neste år. 
	level VARCHAR(10),
	fCode VARCHAR(3),
	ProgID MEDIUMINT NOT NULL,
	DepID MEDIUMINT NOT NULL,
	CONSTRAINT StudentPK PRIMARY KEY (StudentID),
	UNIQUE KEY (BirthID),
	CONSTRAINT FacultyFKstud FOREIGN KEY (fCode) REFERENCES FACULTY(fCode),
	CONSTRAINT ProgramFKstud FOREIGN KEY (ProgID) REFERENCES PROGRAM(ProgID),
	CONSTRAINT DepartmentFKstud FOREIGN KEY (DepID) REFERENCES DEPARTMENT(DepID)
);

DROP TABLE IF EXISTS GRADES;
CREATE TABLE GRADES(
	GradeID MEDIUMINT NOT NULL AUTO_INCREMENT,
	cYear DATE, -- Strengt tatt ikke nødvendig siden man kan hente cYear fra Course entititeten
	cCode varchar(6),
	StudentID VARCHAR(6),
	CONSTRAINT GradePK PRIMARY KEY (GradeID),
	CONSTRAINT CourseFKgrade FOREIGN KEY (cCode) REFERENCES COURSE(cCode),
	CONSTRAINT StudentFKgrade FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID)
);
