CREATE TABLE "contributions" (
    "id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , 
    "committee_id" VARCHAR, 
    "entity_type" VARCHAR, 
    "last_name" VARCHAR, 
    "first_name" VARCHAR, 
    "middle_name" VARCHAR, 
    "city" VARCHAR, 
    "state" VARCHAR, 
    "zip_code" VARCHAR, 
    "employer" VARCHAR, 
    "occupation" VARCHAR, 
    "date" DATETIME, 
    "amount" INTEGER,
    "candidate_id" INTEGER NOT NULL,
    FOREIGN KEY(candidate_id) REFERENCES candidates(id)
);