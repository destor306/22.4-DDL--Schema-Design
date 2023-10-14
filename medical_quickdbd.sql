-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4uQ8jO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Doctors" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    "specialty" TEXT   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    "insurance" TEXT   NOT NULL,
    "birthday" DATE   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visit" (
    "id" INTEGER   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "patient_id" INTEGER   NOT NULL,
    "date" DATE   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" INTEGER   NOT NULL,
    "visit_id" INTGER   NOT NULL,
    "disease_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    "descrption" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visit" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");

