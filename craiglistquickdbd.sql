-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4uQ8jO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    "password" TEXT   NOT NULL,
    "region" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "title" TEXT   NOT NULL,
    "text" TEXT   NOT NULL,
    "userid" int   NOT NULL,
    "location" TEXT   NOT NULL,
    "region" id   NOT NULL,
    "category_id" INT   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "User" ADD CONSTRAINT "fk_User_region" FOREIGN KEY("region")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_userid" FOREIGN KEY("userid")
REFERENCES "User" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");

