
INSERT INTO manager VALUES (1,'Eric','Duncan','1968-03-21',29,null,'eduncan@thisgym.com'); 
INSERT INTO manager VALUES (2,'Terrance','Jacobs','1979-09-15',26,500,'tjacobs@thisgym.com');
INSERT INTO manager VALUES (3,'May','Lee','1990-01-04',30,null,'mlee@thisgym.com');
INSERT INTO manager VALUES (4,'Laura','Croft','1985-11-21',28,750,'lcroft@thisgym.com');
INSERT INTO manager VALUES (5,'Juggy','Brodelteen','1989-12-24',31,null,'jbrodel@thisgym.com');
INSERT INTO manager VALUES (6,'Skippy','Longstocking','1977-03-09',26,1000,'slongst@thisgym.com');
INSERT INTO manager VALUES (7,'Jake','Schtupert','1991-06-25',24,null,'jschtup@thisgym.com'); 

INSERT INTO receptionist VALUES (1,'Pam','Johns','1996-03-20',14,'851-226-3902','pjohns@thisgym.com',2); 
INSERT INTO receptionist VALUES (2,'Theo','Ferguson','1999-01-01',13,'555-422-6180','tfergus@thisgym.com',7);
INSERT INTO receptionist VALUES (3,'Steve','Rogers','1992-03-11',14,'213-242-9999','srogers@thisgym.com',7);
INSERT INTO receptionist VALUES (4,'Wen','Beber','1995-07-04',13,'846-927-1964','wbeber@thisgym.com',1);
INSERT INTO receptionist VALUES (5,'Sheila','Johns','2000-06-23',12,'229-878-3344','sjohns@thisgym.com',6); 
INSERT INTO receptionist VALUES (6,'Debra','Brown','1989-12-02',13,'999-422-6180','dbrown@thisgym.com',3); 

INSERT INTO manphone VALUES (1,'242-222-3433','Cell');
INSERT INTO manphone VALUES (1,'353-346-7365','Home');
INSERT INTO manphone VALUES (2,'757-839-6288','Office');
INSERT INTO manphone VALUES (2,'243-646-3333','Cell');
INSERT INTO manphone VALUES (3,'757-325-2222','Cell');
INSERT INTO manphone VALUES (4,'757-535-2223','Office');
INSERT INTO manphone VALUES (4,'353-322-8846','Cell');
INSERT INTO manphone VALUES (5,'352-646-3562','Cell');
INSERT INTO manphone VALUES (5,'757-323-5577','Office');
INSERT INTO manphone VALUES (6,'757-926-3566','Office');
INSERT INTO manphone VALUES (7,'214-444-7647','Cell');
INSERT INTO manphone VALUES (7,'214-535-3525','Home');
INSERT INTO manphone VALUES (7,'757-736-4462','Office'); 

INSERT INTO cleaner VALUES(1,'Gertrude','Stephens','1970-02-11',11,'425-222-3535',5);
INSERT INTO cleaner VALUES(2,'Sally','Shoreman','1976-04-29',11,'352-333-5436',4);
INSERT INTO cleaner VALUES(3,'Franky','Mays','1983-09-27',11,'743-223-5252',1);
INSERT INTO cleaner VALUES(4,'Jake','Jacobs','1995-07-30',11,'515-555-1115',4);
INSERT INTO cleaner VALUES(5,'Mavis','Mayfield','1988-12-11',11,'426-437-2734',7); 

INSERT INTO trainer VALUES(1,'Terry','Crawford','1976-08-23',18,'850-265-6485','tcrawfo@thisgym.com',3);
INSERT INTO trainer VALUES(2,'Phoenix','Wright','1992-03-14',19,'525-363-7345','pwright@thisgym.com',2);
INSERT INTO trainer VALUES(3,'Stephanie','Lawson','1999-02-28',18,'621-336-9361','slawso@thisgym.com',1);
INSERT INTO trainer VALUES(4,'Scott','Herman','1988-06-27',19,'325-933-9878','sherman@thisgym.com',5); 

INSERT INTO provider VALUES(1,'SmartFitness','Boston, MA','801-351-3332','sales@smartfitness.org',6);
INSERT INTO provider VALUES(2,'Unearthed Strength','Santa Clara, CA','876-324-2444','mark@unearthedstrength.com',1);
INSERT INTO provider VALUES(3,'Globogym','Panama City, FL','850-194-2678','chad@globogym.org',5);
INSERT INTO provider VALUES(4,'Plates-R-Us','Dubuque, IA','436-622-4879','retail@platesrus.net',2);
INSERT INTO provider VALUES(5,'MaxIron','Fort Mill, SC','299-242-8878','rkeith@maxiron.com',1); 

INSERT INTO exercisetype VALUES(1,'Cardio');
INSERT INTO exercisetype VALUES(2,'Yoga');
INSERT INTO exercisetype VALUES(3,'General Weight Training');
INSERT INTO exercisetype VALUES(4,'Powerlifting');
INSERT INTO exercisetype VALUES(5,'Olympic Lifting');
INSERT INTO exercisetype VALUES(6,'Sports');
INSERT INTO exercisetype VALUES(7,'Aquatics'); 
INSERT INTO exercisetype VALUES(8,'Physical Therapy'); 

INSERT INTO equipment VALUES(1,'Treadmill',1,1,5,null);
INSERT INTO equipment VALUES(2,'Treadmill',1,1,4,null);
INSERT INTO equipment VALUES(3,'45lbs Plate',4,4,3,45);
INSERT INTO equipment VALUES(4,'45lbs Plate',4,4,3,45);
INSERT INTO equipment VALUES(5,'10lbs Plate',4,4,3,10);
INSERT INTO equipment VALUES(6,'Yoga Mat',3,2,2,null);
INSERT INTO equipment VALUES(7,'Olympic Barbell',5,5,2,45);
INSERT INTO equipment VALUES(8,'Shock Mat',2,5,1,null);
INSERT INTO equipment VALUES(9,'Lat Pulldown Machine',2,3,1,null);
INSERT INTO equipment VALUES(10,'Basketball',3,6,5,null);
INSERT INTO equipment VALUES(11,'Purple Resistance Band',5,8,4,65);
INSERT INTO equipment VALUES(12,'Green Pool Noodle',3,7,2,null); 

INSERT INTO hasspecialty VALUES(1,1);
INSERT INTO hasspecialty VALUES(1,8);
INSERT INTO hasspecialty VALUES(2,3);
INSERT INTO hasspecialty VALUES(2,4);
INSERT INTO hasspecialty VALUES(3,1);
INSERT INTO hasspecialty VALUES(3,7);
INSERT INTO hasspecialty VALUES(4,5); 

INSERT INTO class VALUES(1,'Afternoon Basketball',6,'M, W, F','16:00 - 17:00','Outdoor Intramural Field',3);
INSERT INTO class VALUES(2,'Powerlifting Meet',4,'F','15:30 - 16:30','Powerlifting Area',2);
INSERT INTO class VALUES(3,'Spin Class',1,'Tu, Th','12:00 - 13:00','Spin Room',1);
INSERT INTO class VALUES(4,'Morning Yoga',2,'M, W, F','08:00 - 08:45','Room 204',3);
INSERT INTO class VALUES(5,'Olympic Lift Meet',5,'M','17:30 - 18:15','Powerlifting Area',4); 

INSERT INTO classuses VALUES(1,10);
INSERT INTO classuses VALUES(2,3);
INSERT INTO classuses VALUES(2,4);
INSERT INTO classuses VALUES(2,11);
INSERT INTO classuses VALUES(4,6);
INSERT INTO classuses VALUES(5,7);
INSERT INTO classuses VALUES(5,3);
INSERT INTO classuses VALUES(5,8); 

INSERT INTO member VALUES(1,'Cynthia','Potts','2020-01-02','2021-01-02','1998-06-21',null,null,null);
INSERT INTO member VALUES(2,'Dylan','Santiago','2020-01-14','2020-04-14','1997-12-19',null,null,1);
INSERT INTO member VALUES(3,'Walter','Dobalina','2020-01-14','2021-01-14','1980-07-01','2021-01-14',2,null);
INSERT INTO member VALUES(4,'Oliver','Potts','2020-01-15','2021-01-15','1995-02-14',null,null,1);
INSERT INTO member VALUES(5,'Samuel','Edwards','2020-01-15','2020-02-15','1990-08-19','2020-02-15',3,null);
INSERT INTO member VALUES(6,'Susan','Sanders','2020-01-16','2020-07-16','1976-09-09',null,null,4);
INSERT INTO member VALUES(7,'Kevin','Montagne','2020-01-17','2021-01-17','1987-10-08','2020-04-17',1,5);
INSERT INTO member VALUES(8,'Alejandro','Rodriguez','2020-01-20','2020-07-20','1999-06-06',null,2,2); 
INSERT INTO member VALUES(9,'Andrew','Burns','2020-02-01','2021-02-01','1998-03-17','2021-02-01',4,null);
INSERT INTO member VALUES(10,'Dylan','Burns','2020-02-01','2020-08-01','1998-03-17',null,2,9); 

INSERT INTO registeredfor VALUES(1,2);
INSERT INTO registeredfor VALUES(1,9);
INSERT INTO registeredfor VALUES(1,10);
INSERT INTO registeredfor VALUES(2,8);
INSERT INTO registeredfor VALUES(2,4);
INSERT INTO registeredfor VALUES(3,4);
INSERT INTO registeredfor VALUES(3,6);
INSERT INTO registeredfor VALUES(3,7);
INSERT INTO registeredfor VALUES(4,1);
INSERT INTO registeredfor VALUES(5,1);

INSERT INTO checksin VALUES(1,'2020-01-02','10:57',1); 