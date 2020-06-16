/* Indexes for columns that are highly referenced but typically not transactional */
CREATE INDEX trainer_index ON trainer(trainerid);
CREATE INDEX rec_index ON receptionist(recid);
CREATE INDEX cl_index ON cleaner(cleanid);