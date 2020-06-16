/* Every check-in, with the names of the member and receptionist in place of their IDs */
SELECT m.fname AS Mem_FName, m.lname AS Mem_LName, ch.date, ch.time, r.fname AS Rec_Fname, r.lname AS Rec_LName
FROM member m, checksin ch, receptionist r
WHERE m.memberid = ch.memberid AND r.recid = ch.recid;

/* Every member, with names of trainers and members that provided a referral, where applicable */
SELECT m.memberid, m.fname AS Mem_FName, m.lname AS Mem_LName, m.mbrstartdate AS Start_Date, m.mbrenddate AS End_Date,
		m.dob AS DOB, m.platenddate AS Plat_EndDate, t.fname AS Trainer_FName, t.lname AS Trainer_LName, mr.fname AS Ref_FName, mr.lname AS Ref_LName
FROM member m LEFT OUTER JOIN trainer t 
ON (m.trainerid = t.trainerid) 
LEFT OUTER JOIN member mr 
ON (m.referredby = mr.memberid);

/* Every manager, with every phone number */
SELECT m.*, mp.phonenum, mp.label
FROM manager m, manphone mp
WHERE m.manid = mp.manid;