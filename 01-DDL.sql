
-- 1. DDL: Drop Tables

DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE ProvidedBy CASCADE CONSTRAINTS;
DROP TABLE CosmeticAllergies CASCADE CONSTRAINTS;
DROP TABLE Specialist CASCADE CONSTRAINTS;
DROP TABLE Receptionist CASCADE CONSTRAINTS;
DROP TABLE Service CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;

-- 2. DDL: Create Tables

CREATE TABLE Client (
    ClientID NUMBER(5) PRIMARY KEY,
    Name VARCHAR2(50),
    IdentityNumber VARCHAR2(20) UNIQUE,
    MobileNumber VARCHAR2(15),
    SkinType VARCHAR2(30),
    PreferredLanguage VARCHAR2(30),
    DateOfBirth DATE
);

CREATE TABLE CosmeticAllergies (
    ClientID NUMBER(5),
    CosmeticAllergies VARCHAR2(100),
    CONSTRAINT PK_CosmeticAllergies
        PRIMARY KEY (ClientID, CosmeticAllergies),
    CONSTRAINT FK_CosmeticAllergies
        FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Service (
    ServiceID      NUMBER(5) PRIMARY KEY,
    Category       VARCHAR2(30),
    ServiceName    VARCHAR2(60) NOT NULL,
    Duration       NUMBER(3) CHECK (Duration > 0),
    Price          NUMBER(8,2) CHECK (Price >= 0)
);

CREATE TABLE Receptionist (
    StaffID        NUMBER(5) PRIMARY KEY,
    StaffName      VARCHAR2(60) NOT NULL,
    HireDate       DATE,
    ShiftHours     VARCHAR2(30)
);

CREATE TABLE Specialist (
StaffID NUMBER(5) PRIMARY KEY,
StaffName VARCHAR2(30) NOT NULL,
HireDate DATE,
Specialty VARCHAR2(50),
Certification VARCHAR2(60),
YearsExperience NUMBER(2)
);

CREATE TABLE ProvidedBy (
ServiceID NUMBER(5),
SpecialistID NUMBER(5),

PRIMARY KEY (ServiceID, SpecialistID),
FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
FOREIGN KEY (SpecialistID) REFERENCES Specialist(StaffID)
);

CREATE TABLE Appointment (
  AppointmentID    NUMBER(6)      PRIMARY KEY,
  AppointmentDate  DATE           NOT NULL,
  AppointmentTime  VARCHAR2(5)    NOT NULL,
  BookingReference VARCHAR2(15)   NOT NULL UNIQUE,
  TreatmentNotes   VARCHAR2(200),
  Status           VARCHAR2(15)   NOT NULL,
  BranchName       VARCHAR2(40)   NOT NULL,
  City             VARCHAR2(30)   NOT NULL,
  ClientID         NUMBER(6)      NOT NULL,
  ServiceID        NUMBER(6)      NOT NULL,
  ReceptionistID   NUMBER(6)      NOT NULL,
  SpecialistID     NUMBER(6),
  CONSTRAINT chk_appt_status CHECK (Status IN ('Scheduled','Completed','Cancelled')),
  CONSTRAINT fk_appt_client  FOREIGN KEY (ClientID)       REFERENCES Client(ClientID),
  CONSTRAINT fk_appt_service FOREIGN KEY (ServiceID)      REFERENCES Service(ServiceID),
  CONSTRAINT fk_appt_recep   FOREIGN KEY (ReceptionistID) REFERENCES Receptionist(StaffID),
  CONSTRAINT fk_appt_spec    FOREIGN KEY (SpecialistID)   REFERENCES Specialist(StaffID)
);

CREATE TABLE Payment (
    PaymentID NUMBER(6) CONSTRAINT PK_Payment PRIMARY KEY,
    Amount NUMBER(8,2) NOT NULL
        CONSTRAINT CK_Payment_Amount CHECK (Amount > 0),
    PaymentMethod VARCHAR2(30) NOT NULL,
    PaymentDate DATE NOT NULL,
    AppointmentID NUMBER(6) NOT NULL,
    CONSTRAINT FK_Payment_Appointment
        FOREIGN KEY (AppointmentID)
        REFERENCES Appointment (AppointmentID)
);

