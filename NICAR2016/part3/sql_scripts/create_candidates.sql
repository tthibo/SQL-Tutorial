CREATE TABLE "candidates" (
    "id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , 
    "committee_id" VARCHAR, 
    "first_name" VARCHAR, 
    "last_name" VARCHAR, 
    "middle_name" VARCHAR, 
    "party" VARCHAR)
;