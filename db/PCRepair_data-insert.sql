USE PCRepair;
/*

/* CUSTOMERS */

INSERT INTO Customers (FirstName,LastName,EmailAddress,PhoneNumber) VALUES
	('Nariko','Vyse','nvyse0@wufoo.com','247-351-2374'),
	('Georgeanne','Paddefield','gpaddefield1@usgs.gov','852-895-5905'),
	('Zebulen','Skeel','zskeel2@nps.gov','537-665-2927'),
	('Valentin','Glazier','vglazier3@boston.com','727-169-2248'),
	('Agustin','Jevon','ajevon4@angelfire.com','695-658-4807'),
	('Shurlock','Laurens','slaurens5@sciencedaily.com','518-541-5425'),
	('Anthia','Mathon','amathon6@squarespace.com','645-858-1392'),
	('Amos','Lilywhite','alilywhite7@amazon.com','979-534-7573'),
	('Brinn','Penswick','bpenswick8@microsoft.com','138-410-4244'),
	('Moshe','Richemond','mrichemond9@cnet.com','533-467-4629'),
	('Harper','Pesselt','hpesselta@foxnews.com','641-861-5755'),
	('Brad','Itzkin','bitzkinb@wordpress.org','220-717-0400'),
	('Della','Jaqueminet','djaqueminetc@spiegel.de','827-779-0543'),
	('Trudi','Astlet','tastletd@devhub.com','848-332-3884'),
	('Simeon','Berard','sberarde@tiny.cc','599-316-9859'),
	('Errick','Disbury','edisburyf@springer.com','874-176-0149'),
	('Jimmy','Lissett','jlissettg@telegraph.co.uk','746-158-8249'),
	('Gawen','Fennelow','gfennelowh@tinypic.com','853-982-4442'),
	('Evy','Brychan','ebrychani@gizmodo.com','129-140-4171'),
	('Adelice','Ammer','aammerj@hc360.com','159-322-3788'),
	('Jemie','Wildes','jwildesk@free.fr','798-602-2082'),
	('Myrle','Hubery','mhuberyl@joomla.org','318-542-9337'),
	('Adelheid','Farfoot','afarfootm@technorati.com','715-571-7985'),
	('Martica','Aspinwall','maspinwalln@dedecms.com','758-623-7034'),
	('Alexandr','Willson','awillsono@bizjournals.com','685-752-8797'),
	('Olenolin','Catton','ocattonp@constantcontact.com','702-467-1471'),
	('Simon','Folkes','sfolkesq@globo.com','877-204-2168'),
	('Zitella','Spain-Gower','zspaingowerr@usatoday.com','524-428-5770'),
	('Marcile','Gryglewski','mgryglewskis@google.ca','929-166-7086'),
	('Fredi','Eccott','feccottt@about.com','723-897-1671'),
	('Berna','Momford','bmomfordu@wikimedia.org','193-663-8205'),
	('Fletcher','Meconi','fmeconiv@mlb.com','886-631-2752'),
	('Cayla','Beelby','cbeelbyw@joomla.org','816-761-9920'),
	('Shelby','Kryszka','skryszkax@vinaora.com','983-533-2610'),
	('Gaultiero','Deal','gdealy@un.org','197-290-7584'),
	('Marcella','Richford','mrichfordz@barnesandnoble.com','696-895-5495'),
	('Agathe','Philippson','aphilippson10@home.pl','205-627-0923'),
	('Emilia','Shutt','eshutt11@businesswire.com','665-282-2223'),
	('Ezmeralda','Paszek','epaszek12@posterous.com','657-313-5251'),
	('Hillard','Vanyushin','hvanyushin13@nbcnews.com','575-608-7558'),
	('Roxy','Thebe','rthebe14@pen.io','184-668-2116'),
	('Jecho','McIllroy','jmcillroy15@g.co','137-325-3160'),
	('Toma','Filipponi','tfilipponi16@webeden.co.uk','333-260-0947'),
	('Michel','Macguire','mmacguire17@goodreads.com','164-479-1773'),
	('Shana','Aspel','saspel18@sfgate.com','991-293-6250'),
	('Christoffer','Wilkenson','cwilkenson19@phoca.cz','240-537-8285'),
	('Reinald','MacGiffin','rmacgiffin1a@biglobe.ne.jp','532-754-9428'),
	('Rand','Turbayne','rturbayne1b@deviantart.com','309-643-6383'),
	('Fancy','Vidloc','fvidloc1c@barnesandnoble.com','453-883-4848'),
	('Patton','MacFall','pmacfall1d@disqus.com','535-765-8588');

/* EMPLOYEES */

INSERT INTO Employees VALUES
	('Johnath','Wyld','Owner'),
	('Denis','Gobbett','Office Admin'),
	('Karen','Gruszecki','Senior Technician'),
	('Veradis','Keilloh','Technician'),
	('Brunhilde','Willeman','Technician');


/* MANAGERS */

INSERT INTO Managers VALUES
	(1,2),
	(1,3),
	(3,4),
	(3,5);


/* SERVICEORDERS */


INSERT INTO ServiceOrders VALUES
	('2021-09-21',NULL,22,3),
	('2021-08-06','2021-11-12',47,1),
	('2021-07-03',NULL,7,5),
	('2020-09-02','2021-02-06',37,3),
	('2020-07-05','2021-01-14',21,3),
	('2020-12-29','2021-04-02',43,4),
	('2021-05-07','2021-06-20',1,4);

/* BILLING */

INSERT INTO Billing (CustomerID, AmountDue, AmountPaid, Credits) VALUES
	(2,1500,500,1000),
	(1,600,0,0),
	(3,300,0,0),
	(4,500,500,0),
	(5,980,780,200),
	(6,250,250,0),
	(7,150,150,0);

/* PCSERVICES */

INSERT INTO PCServices VALUES
	('PC Support & Diagnostic',2,100),
	('Virus Removal',3,150),
	('Laptop Screen',2,100),
	('Power Supply',1,50),
	('2.5" SATA Hard Drive',1,50),
	('Data Recovery',10,500),
	('Application Installation',1,50);

/* PARTS */

INSERT INTO Parts VALUES
	('Laptop Screen',300,7),
	('Power Supply',50,28),
	('2.5" SATA Hard Drive',90,33);


/* SERVICEDETAIL */

/* Cost column was not implemented in the DDL script. */
ALTER TABLE ServiceDetail
	ADD Cost money NOT NULL CHECK(Cost>=0);

INSERT INTO ServiceDetail (ServiceOrderID,DetailID,ServiceID,PartID,Quantity,Cost,Notes) VALUES
	(1,1,6,NULL,2,200,'Complimentary - Client Issue'),
	(1,2,6,NULL,1,100,NULL),
	(1,3,7,NULL,5,250,'Complimentary - Client Issue'),
	(2,1,1,NULL,1,100,NULL),
	(2,2,6,NULL,1,100,'Use client provided thumb drive'),
	(3,1,3,1,1,400,'Not under warranty'),
	(4,1,6,NULL,1,100,NULL),
	(5,1,3,1,1,400,NULL),
	(5,2,6,NULL,1,100,NULL),
	(5,3,5,1,2,280,NULL),
	(6,1,1,NULL,1,100,NULL),
	(6,2,2,NULL,1,150,NULL),
	(7,1,2,NULL,1,150,NULL);
*/