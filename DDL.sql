DROP TABLE IF EXISTS [XStreamLee.Listen]
DROP TABLE IF EXISTS [XStreamLee.Own]
DROP TABLE IF EXISTS [XStreamLee.Plan]
DROP TABLE IF EXISTS [XStreamLee.Listener]
DROP TABLE IF EXISTS [XStreamLee.Song]
DROP TABLE IF EXISTS [XStreamLee.Album]
DROP TABLE IF EXISTS [XStreamLee.Artist]
DROP TABLE IF EXISTS [XStreamLee.Genre]


CREATE TABLE [XStreamLee.Genre] (
gnrId CHAR(5) NOT NULL,
gnrName VARCHAR (20) NOT NULL,
CONSTRAINT pk_Genre_gnrId PRIMARY KEY (gnrId))


CREATE TABLE [XStreamLee.Artist] (
artId CHAR(9) NOT NULL,
gnrId CHAR(5),
artName VARCHAR (20) NOT NULL,
artFollowers INTEGER,
artMembers INTEGER,
CONSTRAINT pk_Artist_artId PRIMARY KEY (artId),
CONSTRAINT fk_Artist_gnrId FOREIGN KEY (gnrId)
REFERENCES [XStreamLee.Genre](gnrId)
ON DELETE CASCADE ON UPDATE NO ACTION)


CREATE TABLE [XStreamLee.Album](
albId CHAR(10) NOT NULL,
albName VARCHAR(80),
albDuration TIME,
albRating DECIMAL (2,1),
albProdStudio VARCHAR (50),
artId CHAR (9),
CONSTRAINT pk_Album_albId PRIMARY KEY(albId),
CONSTRAINT fk_Album_artId FOREIGN KEY (artId)
REFERENCES [XStreamLee.Artist](artId)
ON DELETE NO ACTION ON UPDATE NO ACTION)


CREATE TABLE [XStreamLee.Song](
sngId CHAR (10) NOT NULL,
albId CHAR(10),
sngName VARCHAR (80),
sngDuration TIME,
sngYearOfRelease DATE,
sngNoStreams INTEGER,
sngRating DECIMAL (5,2),
sngLanguage VARCHAR (15),
CONSTRAINT pk_Song_sngId PRIMARY KEY (sngId),
CONSTRAINT fk_Song_albId FOREIGN KEY (albId)
REFERENCES [XStreamLee.Album](albId)
ON DELETE NO ACTION ON UPDATE NO ACTION)


CREATE TABLE [XstreamLee.Listener] (
lsnId CHAR (10) NOT NULL,
lsnName VARCHAR (20),
lsnDOB DATE,
lsnGender CHAR(1),
lsnLanguage VARCHAR (10),
CONSTRAINT pk_Listener_lsnId PRIMARY KEY (lsnId))


CREATE TABLE [XstreamLee.Plan](
plnId CHAR(9) NOT NULL,
planType VARCHAR(20),
plnCost DECIMAL(4,2),
CONSTRAINT pk_Account_accId PRIMARY KEY (plnId))


CREATE TABLE [XStreamLee.Own] (
lsnId CHAR(10) NOT NULL,
accId CHAR(10) NOT NULL,
plnId CHAR(9) NOT NULL,
ownPayMethod VARCHAR(12),
CONSTRAINT pk_Own_lsnId_accId PRIMARY KEY (lsnId, accId),
CONSTRAINT fk_Own_lsnId FOREIGN KEY (lsnId)
REFERENCES [XStreamLee.Listener] (lsnId)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Own_plnId FOREIGN KEY (plnId)
REFERENCES [XStreamLee.Plan] (plnId)
ON DELETE CASCADE ON UPDATE CASCADE )


CREATE TABLE [XStreamLee.Listen] (
lsnId CHAR(10) NOT NULL,
sngId CHAR(10) NOT NULL,
gnrId CHAR(5) NOT NULL,
CONSTRAINT pk_Listen_lsnId_sngId_gnrId PRIMARY KEY (lsnId, sngId, gnrId),
CONSTRAINT fk_Listen_lsnId FOREIGN KEY (lsnId)
REFERENCES [XStreamLee.Listener] (lsnId)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Listen_sngId FOREIGN KEY (sngId)
REFERENCES [XStreamLee.Song] (sngId)
ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_Listen_gnrId FOREIGN KEY (gnrId)
REFERENCES [XStreamLee.Genre] (gnrId)
ON DELETE NO ACTION ON UPDATE NO ACTION )


INSERT INTO [XStreamLee.Genre] VALUES
('G0001', 'Rap'),
('G0002', 'Rock'),
('G0003', 'Pop'),
('G0004', 'RnB'),
('G0005', 'EDM'),
('G0006', 'Jazz'),
('G0007', 'Hip-Hop'),
('G0008', 'Disco'),
('G0009', 'K-pop'),
('G0010', 'Bollywood')
SELECT * FROM [XStreamLee.Genre]




INSERT INTO [XStreamLee.Artist] VALUES
('AR0000001', 'G0001', 'Eminem', 59598526, 1),
('AR0000002', 'G0001', 'Divine', 3324652, 1),
('AR0000003', 'G0002', 'AC/DC', 24896320, 5),
('AR0000004', 'G0002', 'Linkin Park', 25555459, 6),
('AR0000005', 'G0003', 'One Direction', 32488906, 5),
('AR0000006', 'G0003', 'Bruno Mars', 51112460, 1),
('AR0000007', 'G0004', 'The Weekend', 79092799, 1),
('AR0000008', 'G0004', 'Jack Harlow', 31645087, 1),
('AR0000009', 'G0005', 'Daft Punk', 17787753, 1),
('AR0000010', 'G0005', 'DVLM', 9211319, 2),
('AR0000011', 'G0006', 'Paul Anka', 3001281, 1),
('AR0000012', 'G0006', 'Frank Sinatra', 18618103, 1),
('AR0000013', 'G0007', 'Kanye West', 49577815, 1),
('AR0000014', 'G0007', 'Luis Fonsi', 18905519, 1),
('AR0000015', 'G0008', 'Rosalia', 32840216, 1),
('AR0000016', 'G0008', 'Emma Hazy Minami', 33395, 1),
('AR0000017', 'G0009', 'BTS', 39670470, 7),
('AR0000018', 'G0009', 'Blackpink', 23619070, 4),
('AR0000019', 'G0010', 'Sunidhi Chauhan', 11529255, 1),
('AR0000020', 'G0010', 'Shreya Ghoshal', 21831842, 1)
SELECT * FROM [XStreamLee.Artist]


INSERT INTO [XStreamLee.Album] VALUES
('AL00000001', 'Recovery', '01:16:56', 4.8, 'Aftermath Records', 'AR0000001'),
('AL00000002', 'Essential Divine', '01:16:05', 4.3, 'Right Track Records', 'AR0000002'),
('AL00000003', 'Chanting', '09:09', 4, 'IN THE BOX', 'AR0000002'),
('AL00000004', 'Backtracks', '03:47:00', 3.8, 'Australian Music Corporation', 'AR0000003'),
('AL00000005', 'Highway to hell', '00:41:40', 4.5, 'Australian Music Corporation', 'AR0000003'),
('AL00000006', 'Living Things', '17:05:00', 4.6, 'Warner Records Inc.', 'AR0000004'),
('AL00000007', 'Up All Night', '01:03:00', 4.1, 'Sony Music Entertainment UK Limited', 'AR0000005'),
('AL00000008', 'Doo-Woops & Hooligans', '15:24:00', 4.2, 'Atlantic Recording Corporation', 'AR0000006'),
('AL00000009', '24K Magic', '00:33:32', 4.6, 'Atlantic Recording Corporation', 'AR0000006'),
('AL00000010', 'Starboy', '01:08:00', 4.8, 'Republic Records', 'AR0000007'),
('AL00000011', 'Afterhours', '00:56:17', 4.9, 'Republic Records', 'AR0000007'),
('AL00000012', 'Sweet Action', '00:16:13', 4.3, 'Atlantic Recording Corporation', 'AR0000008'),
('AL00000013', 'Discovery', '01:01:00', 4.2, 'Warner Music France', 'AR0000009'),
('AL00000014', 'Homework', '01:14:00', 3.8, 'Warner Music France', 'AR0000009'),
('AL00000015', 'Feelings', '00:40:25', 3.4, 'Capitol Records', 'AR0000011'),
('AL00000016', 'Sessions', '00:48:11', 4.4, 'Green Hill Productions', 'AR0000011'),
('AL00000017', 'A Jolly Christmas', '00:38:19', 3.8, 'Capitol Records', 'AR0000012'),
('AL00000018', 'My Beautiful Dark Twisted Fantasy', '01:08:00', 4.2, 'UMG Recordings', 'AR0000013'),
('AL00000019', 'VIDA', '00:52:33', 4.5, 'UMG Recordings, Inc.', 'AR0000014'),
('AL00000020', 'Lay de Gravedad', '00:46:02', 3.7, 'UMG Recordings, Inc.', 'AR0000014'),
('AL00000021', 'MOTOMAMI', '00:42:52', 4.3, 'Columbia Records', 'AR0000015'),
('AL00000022', 'Map of the Soul:7', '01:14:00', 4.5, 'BIGHIT MUSIC', 'AR0000017'),
('AL00000023', 'THE ALBUM', '00:24:44', 3.8, 'YG Entertainment', 'AR0000018'),
('AL00000024', 'Stay With Me', '00:03:48', 4.4, 'Hazy Studio', 'AR0000016'),
('AL00000025', 'Lae Dooba', '00:03:49', 3.3, 'Motion Picture Capital', 'AR0000019'),
('AL00000026', 'Aashiqui 2', '00:05:14', 3.9, 'T Series', 'AR0000020')
SELECT * FROM [XStreamLee.Album]


INSERT INTO [XStreamLee.Song] VALUES
('S000000001', 'AL00000001','On Fire',        '0:03:33'        ,        '2010'        ,700000000        ,        4.6        ,        'English'        ),
(        'S000000002'        ,        'AL00000001'        ,        'Not Afraid'        ,'0:04:08'        ,        '2010'        ,        800000000        ,        4.7        ,'English'),
(        'S000000003'        ,        'AL00000002'        ,        'Divines Theme'        ,        '0:02:14'        ,        '2011'        ,        2000000        ,        4        ,        'Hindi'),
(        'S000000004'        ,        'AL00000002'        ,        'Im so beautiful'        ,        '0:07:10'        ,        '2011'        ,        1500000        ,        3.8        ,        'Hindi'        ),
(        'S000000005'        ,        'AL00000003'        ,        'Chanting'        ,        '0:03:06'        ,        '2022'        ,        2700000        ,        3.9        ,        'Hindi'),
(        'S000000006'        ,        'AL00000004'        ,        'High Voltage'        ,        '0:04:16'        ,        '2009'        ,        65000000        ,        4.4        ,        'English'),
(        'S000000007'        ,        'AL00000004'        ,        'Love Songs'        ,        '0:05:14'        ,        '2009'        ,        75000000        ,        4.3        ,        'English'),
(        'S000000008'        ,        'AL00000005'        ,        'Highway to Hell'        ,        '0:03:28'        ,        '1979'        ,        900000000        ,        4.7        ,        'English'),
(        'S000000009'        ,        'AL00000005'        ,        'Touch Too Much'        ,        '0:04:26'        ,        '1979'        ,        770000000        ,        4.5        ,        'English'),
(        'S000000010'        ,        'AL00000006'        ,        'BURN IT DOWN'        ,        '0:03:50'        ,        '2012'        ,        580000000        ,        4.3        ,        'English'),
(        'S000000011'        ,        'AL00000006'        ,        'CASTLE OF GLASS'        ,        '0:03:25'        ,        '2012'        ,        600000000        ,        4.5        ,        'English'),
(        'S000000012'        ,        'AL00000007'        ,        'What makes you beautiful'        ,        '0:03:19'        ,        '2012'        ,        810000000        ,        4.6        ,        'English'),
(        'S000000013'        ,        'AL00000007'        ,        'Up All Night'        ,        '0:03:14'        ,        '2012'        ,        750000000        ,        4.5        ,        'English'),
(        'S000000014'        ,        'AL00000008'        ,        'Grenade'        ,        '0:03:40'        ,        '2010'        ,        610000000        ,        4.7        ,        'English'),
(        'S000000015'        ,        'AL00000008'        ,        'Just the Way You Are'        ,        '0:03:42'        ,        '2010'        ,        690000000        ,        4.8        ,        'English'),
(        'S000000016'        ,        'AL00000009'        ,        '24K Magic'        ,        '0:03:45'        ,        '2016'        ,        450000000        ,        4.7        ,        'English'        ),
(        'S000000017'        ,        'AL00000009'        ,        'Chunky'        ,        '0:03:06'        ,        '2016'        ,        350000000        ,        4        ,        'English'        ),
(        'S000000018'        ,        'AL00000010'        ,        'Starboy'        ,        '0:03:50'        ,        '2016'        ,        850000000        ,        4.8        ,        'English'        ),
(        'S000000019'        ,        'AL00000010'        ,        'Secrets'        ,        '0:04:25'        ,        '2016'        ,        760000000        ,        4.6        ,        'English'        ),
(        'S000000020'        ,        'AL00000011'        ,        'Alone Again'        ,        '0:04:10'        ,        '2020'        ,        880000000        ,        4.5        ,        'English'        ),
(        'S000000021'        ,        'AL00000011'        ,        'Hardest to Love'        ,        '0:03:31'        ,        '2020'        ,        910000000        ,        3.9        ,        'English'        ),
(        'S000000022'        ,        'AL00000012'        ,        'WHATS POPPIN'        ,        '0:02:19'        ,        '2020'        ,        820000000        ,        3.8        ,        'English'        ),
(        'S000000023'        ,        'AL00000013'        ,        'One More Time'        ,        '0:05:20'        ,        '2001'        ,        730000000        ,        4.3        ,        'English'        ),
(        'S000000024'        ,        'AL00000014'        ,        'Revolution 909'        ,        '0:05:23'        ,        '1997'        ,        570000000        ,        4.6        ,        'English'        ),
(        'S000000025'        ,        'AL00000015'        ,        'Out of My Love'        ,        '0:03:20'        ,        '1975'        ,        620000000        ,        4.4        ,        'English'        ),
(        'S000000026'        ,        'AL00000015'        ,        'Wake Up'        ,        '0:03:17'        ,        '1975'        ,        780000000        ,        4.2        ,        'English'        ),
(        'S000000027'        ,        'AL00000016'        ,        'Love Never Felt so Good'        ,        '0:03:14'        ,        '2022'        ,        230000000        ,        '4.3'        ,        'English'        ),
(        'S000000028'        ,        'AL00000017'        ,        'Silent Nights'        ,        '0:02:26'        ,        '1957'        ,        850000000        ,        4.7        ,        'English'        ),
(        'S000000029'        ,        'AL00000018'        ,        'Dark Fantasy'        ,        '0:04:40'        ,        '2010'        ,        510000000        ,        4.5        ,        'English'        ),
(        'S000000030'        ,        'AL00000018'        ,        'POWER'        ,        '0:04:52'        ,        '2010'        ,        470000000        ,        4.1        ,        'English'        ),
(        'S000000031'        ,        'AL00000019'        ,        'Sola'        ,        '0:03:52'        ,        '2019'        ,        390000000        ,        4.3        ,        'Spanish'        ),
(        'S000000032'        ,        'AL00000020'        ,        'Cada Vez'        ,        '0:03:11'        ,        '2022'        ,        430000000        ,        4.3        ,        'Spanish'        ),
(        'S000000033'        ,        'AL00000021'        ,        'Saoko'        ,        '0:02:17'        ,        '2022'        ,        110000000        ,        4.5        ,        'English'        ),
(        'S000000034'        ,        'AL00000024'        ,        'Stay with me'        ,        '0:03:48'        ,        '2019'        ,        390000000        ,        4        ,        'Japanese'        ),
(        'S000000035'        ,        'AL00000022'        ,        'Stay Gold'        ,        '0:04:03'        ,        '2020'        ,        480000000        ,        4.1        ,        'English'        ),
(        'S000000036'        ,        'AL00000023'        ,        'How you like that'        ,        '0:03:02'        ,        '2020'        ,        360000000        ,        4.4        ,        'English'        ),
(        'S000000037'        ,        'AL00000025'        ,        'Lae Dooba'        ,        '0:03:49'        ,        '2018'        ,        83000000        ,        3.8        ,        'Hindi'        ),
(        'S000000038'        ,        'AL00000026'        ,        'Sun Raha Hai'        ,        '0:05:14'        ,        '2018'        ,        76000000        ,        3.9        ,        'Hindi'        )




INSERT INTO [XstreamLee.Listener] VALUES
('L000000001', 'Aditya Shenoy', '1995/07/26', 'M', 'English'),
('L000000002', 'Hriday Mehta', '1989/10/15', 'M', 'English'),
('L000000003', 'Vaidehi Deshpande', '1998/02/14', 'F', 'Hindi'),
('L000000004', 'Chetana Shinde', '2010/07/26', 'F', 'Korean'),
('L000000005', 'Tania Sinhasan', '2002/09/22', 'F', 'Spanish'),
('L000000006', 'Preksha Jagtap', '2001/08/12', 'F', 'Japanese'),
('L000000007', 'Rituparna Desai', '2005/01/30', 'F', 'Hindi'),
('L000000008', 'Pakshal Shah', '1997/06/28', 'M', 'Korean'),
('L000000009', 'Bhavik Mehta', '2001/09/15', 'M', 'Hindi'),
('L000000010', 'Akshat Mehta', '1990/05/07', 'M', 'Spanish'),
('L000000011', 'Gautam Agarwal', '2002/02/28', 'M', 'English'),
('L000000012', 'Aditya Goel', '2005/05/13', 'M', 'English'),
('L000000013', 'Caroline Susan', '2004/12/25', 'F', 'Spanish'),
('L000000014', 'Divij Mathew', '2001/08/18', 'M', 'Hindi'),
('L000000015', 'Karan Pandya', '1997/07/26', 'M', 'Hindi'),
('L000000016', 'Akash Raman', '1999/05/12', 'M', 'Japanese'),
('L000000017', 'Yana Aman', '2000/02/06', 'M', 'English'),
('L000000018', 'Tanali Raman', '2000/01/11', 'M', 'Spanish'),
('L000000019', 'Allika Tadishetty', '2002/09/28', 'F','Hindi'),
('L000000020', 'Shri Mahadevan', '1999/05/27', 'M','Spanish'),
('L000000021', 'Shefali Sharma', '1999/05/28', 'F','English'),
('L000000022', 'Tanay Shah', '2001/10/29', 'M','English'),
('L000000023', 'Anukrit Jain', '2001/05/30', 'M', 'Hindi'),
('L000000024', 'Siddhi Korad', '2002/11/21', 'F', 'Japanese'),
('L000000025', 'Pooja Chauhan', '1998/06/01', 'F', 'English'),
('L000000026', 'Pakshal Mehta', '1995/06/07', 'M', 'Hindi'),
('L000000027', 'Kareena Reddy ', '1996/03/26', 'F', 'Spanish'),
('L000000028', 'Rohan Shetty', '2000/02/07', 'M', 'English'),
('L000000029', 'Riya Jagtap', '1997/12/20', 'F', 'Hindi'),
('L000000030', 'Selena Swift', '1998/10/23', 'F', 'Spanish')


SELECT * FROM [XstreamLee.Listener]




INSERT INTO [XstreamLee.Plan] VALUES
('P00000001','Basic',0),
('P00000002','Bronze',4.99),
('P00000003','Silver',9.99),
('P00000004','Gold',12.99)




INSERT INTO [XStreamLee.Own] VALUES
(        'L000000001'        ,        'AC00000001'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000002'        ,        'AC00000001'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000003'        ,        'AC00000002'        ,         'P00000003'        ,        'Credit Card'        )        ,
(        'L000000004'        ,        'AC00000003'        ,         'P00000004'        ,        'Apple Pay'        )        ,
(        'L000000005'        ,        'AC00000004'        ,         'P00000002'        ,        'Credit Card'        )        ,
(        'L000000006'        ,        'AC00000005'        ,         'P00000003'        ,        'PayPal'        )        ,
(        'L000000007'        ,        'AC00000005'        ,         'P00000003'        ,        'PayPal'        )        ,
(        'L000000008'        ,        'AC00000006'        ,         'P00000004'        ,        'Apple Pay'        )        ,
(        'L000000009'        ,        'AC00000007'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000010'        ,        'AC00000008'        ,         'P00000003'        ,        'Credit Card'        )        ,
(        'L000000011'        ,        'AC00000009'        ,         'P00000003'        ,        'PayPal'        )        ,
(        'L000000012'        ,        'AC00000010'        ,         'P00000002'        ,        'Apple Pay'        )        ,
(        'L000000013'        ,        'AC00000001'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000014'        ,        'AC00000011'        ,         'P00000004'        ,        'Credit Card'        )        ,
(        'L000000015'        ,        'AC00000012'        ,         'P00000003'        ,        'Credit Card'        )        ,
(        'L000000016'        ,        'AC00000013'        ,         'P00000002'        ,        'Apple Pay'        )        ,
(        'L000000017'        ,        'AC00000011'        ,         'P00000004'        ,        'Credit Card'        )        ,
(        'L000000018'        ,        'AC00000014'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000019'        ,        'AC00000011'        ,         'P00000004'        ,        'Credit Card'        )        ,
(        'L000000020'        ,        'AC00000015'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000021'        ,        'AC00000016'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000022'        ,        'AC00000017'        ,         'P00000002'        ,        'Credit Card'        )        ,
(        'L000000023'        ,        'AC00000018'        ,         'P00000003'        ,        'Apple Pay'        )        ,
(        'L000000024'        ,        'AC00000019'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000025'        ,        'AC00000020'        ,         'P00000002'        ,        'Credit Card'        )        ,
(        'L000000026'        ,        'AC00000021'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000027'        ,        'AC00000022'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000028'        ,        'AC00000020'        ,         'P00000002'        ,        'Credit Card'        )        ,
(        'L000000029'        ,        'AC00000023'        ,         'P00000001'        ,        'Free'        )        ,
(        'L000000030'        ,        'AC00000024'        ,         'P00000003'        ,        'Credit Card'        )        ,
(        'L000000009'        ,        'AC00000006'        ,         'P00000004'        ,        'Apple Pay'        )        


INSERT INTO [XStreamLee.Listen] VALUES


(        'L000000001'        ,        'S000000030'        ,        'G0007'        )        ,
(        'L000000001'        ,        'S000000037'        ,        'G0010'        )        ,
(        'L000000001'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000001'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000002'        ,        'S000000019'        ,        'G0004'        )        ,
(        'L000000002'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000002'        ,        'S000000030'        ,        'G0007'        )        ,
(        'L000000002'        ,        'S000000008'        ,        'G0002'        )        ,
(        'L000000002'        ,        'S000000038'        ,        'G0010'        )        ,
(        'L000000002'        ,        'S000000006'        ,        'G0002'        )        ,
(        'L000000002'        ,        'S000000001'        ,        'G0001'        )        ,
(        'L000000002'        ,        'S000000025'        ,        'G0006'        )        ,
(        'L000000002'        ,        'S000000012'        ,        'G0003'        )        ,
(        'L000000002'        ,        'S000000035'        ,        'G0009'        )        ,
(        'L000000003'        ,        'S000000033'        ,        'G0008'        )        ,
(        'L000000003'        ,        'S000000034'        ,        'G0008'        )        ,
(        'L000000003'        ,        'S000000016'        ,        'G0003'        )        ,
(        'L000000004'        ,        'S000000032'        ,        'G0007'        )        ,
(        'L000000004'        ,        'S000000001'        ,        'G0001'        )        ,
(        'L000000004'        ,        'S000000006'        ,        'G0002'        )        ,
(        'L000000004'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000004'        ,        'S000000029'        ,        'G0007'        )        ,
(        'L000000004'        ,        'S000000012'        ,        'G0003'        )        ,
(        'L000000004'        ,        'S000000003'        ,        'G0001'        )        ,
(        'L000000005'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000005'        ,        'S000000010'        ,        'G0002'        )        ,
(        'L000000006'        ,        'S000000019'        ,        'G0004'        )        ,
(        'L000000006'        ,        'S000000038'        ,        'G0010'        )        ,
(        'L000000006'        ,        'S000000011'        ,        'G0002'        )        ,
(        'L000000006'        ,        'S000000008'        ,        'G0002'        )        ,
(        'L000000006'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000007'        ,        'S000000014'        ,        'G0003'        )        ,
(        'L000000007'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000007'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000007'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000007'        ,        'S000000005'        ,        'G0001'        )        ,
(        'L000000007'        ,        'S000000034'        ,        'G0008'        )        ,
(        'L000000008'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000008'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000008'        ,        'S000000024'        ,        'G0005'        )        ,
(        'L000000008'        ,        'S000000017'        ,        'G0003'        )        ,
(        'L000000008'        ,        'S000000004'        ,        'G0001'        )        ,
(        'L000000009'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000009'        ,        'S000000020'        ,        'G0004'        )        ,
(        'L000000009'        ,        'S000000013'        ,        'G0003'        )        ,
(        'L000000009'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000009'        ,        'S000000007'        ,        'G0002'        )        ,
(        'L000000009'        ,        'S000000014'        ,        'G0003'        )        ,
(        'L000000010'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000010'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000010'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000010'        ,        'S000000012'        ,        'G0003'        )        ,
(        'L000000011'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000011'        ,        'S000000003'        ,        'G0001'        )        ,
(        'L000000011'        ,        'S000000014'        ,        'G0003'        )        ,
(        'L000000011'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000011'        ,        'S000000019'        ,        'G0004'        )        ,
(        'L000000011'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000012'        ,        'S000000018'        ,        'G0004'        )        ,
(        'L000000012'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000012'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000012'        ,        'S000000005'        ,        'G0001'        )        ,
(        'L000000012'        ,        'S000000010'        ,        'G0002'        )        ,
(        'L000000013'        ,        'S000000013'        ,        'G0003'        )        ,
(        'L000000013'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000013'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000013'        ,        'S000000020'        ,        'G0004'        )        ,
(        'L000000014'        ,        'S000000013'        ,        'G0003'        )        ,
(        'L000000014'        ,        'S000000016'        ,        'G0003'        )        ,
(        'L000000014'        ,        'S000000030'        ,        'G0007'        )        ,
(        'L000000014'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000014'        ,        'S000000010'        ,        'G0002'        )        ,
(        'L000000014'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000014'        ,        'S000000031'        ,        'G0007'        )        ,
(        'L000000014'        ,        'S000000028'        ,        'G0006'        )        ,
(        'L000000015'        ,        'S000000025'        ,        'G0006'        )        ,
(        'L000000015'        ,        'S000000017'        ,        'G0003'        )        ,
(        'L000000015'        ,        'S000000027'        ,        'G0006'        )        ,
(        'L000000016'        ,        'S000000019'        ,        'G0004'        )        ,
(        'L000000016'        ,        'S000000010'        ,        'G0002'        )        ,
(        'L000000016'        ,        'S000000032'        ,        'G0007'        )        ,
(        'L000000016'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000016'        ,        'S000000022'        ,        'G0004'        )        ,
(        'L000000017'        ,        'S000000029'        ,        'G0007'        )        ,
(        'L000000017'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000017'        ,        'S000000030'        ,        'G0007'        )        ,
(        'L000000017'        ,        'S000000035'        ,        'G0009'        )        ,
(        'L000000018'        ,        'S000000035'        ,        'G0009'        )        ,
(        'L000000018'        ,        'S000000026'        ,        'G0006'        )        ,
(        'L000000018'        ,        'S000000029'        ,        'G0007'        )        ,
(        'L000000018'        ,        'S000000012'        ,        'G0003'        )        ,
(        'L000000018'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000019'        ,        'S000000004'        ,        'G0001'        )        ,
(        'L000000019'        ,        'S000000027'        ,        'G0006'        )        ,
(        'L000000019'        ,        'S000000020'        ,        'G0004'        )        ,
(        'L000000019'        ,        'S000000024'        ,        'G0005'        )        ,
(        'L000000019'        ,        'S000000025'        ,        'G0006'        )        ,
(        'L000000021'        ,        'S000000027'        ,        'G0006'        )        ,
(        'L000000021'        ,        'S000000017'        ,        'G0003'        )        ,
(        'L000000021'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000021'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000021'        ,        'S000000005'        ,        'G0001'        )        ,
(        'L000000021'        ,        'S000000006'        ,        'G0002'        )        ,
(        'L000000022'        ,        'S000000001'        ,        'G0001'        )        ,
(        'L000000022'        ,        'S000000016'        ,        'G0003'        )        ,
(        'L000000022'        ,        'S000000008'        ,        'G0002'        )        ,
(        'L000000022'        ,        'S000000017'        ,        'G0003'        )        ,
(        'L000000023'        ,        'S000000032'        ,        'G0007'        )        ,
(        'L000000023'        ,        'S000000022'        ,        'G0004'        )        ,
(        'L000000023'        ,        'S000000019'        ,        'G0004'        )        ,
(        'L000000023'        ,        'S000000017'        ,        'G0003'        )        ,
(        'L000000024'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000024'        ,        'S000000010'        ,        'G0002'        )        ,
(        'L000000024'        ,        'S000000012'        ,        'G0003'        )        ,
(        'L000000024'        ,        'S000000004'        ,        'G0001'        )        ,
(        'L000000024'        ,        'S000000005'        ,        'G0001'        )        ,
(        'L000000024'        ,        'S000000025'        ,        'G0006'        )        ,
(        'L000000024'        ,        'S000000028'        ,        'G0006'        )        ,
(        'L000000024'        ,        'S000000036'        ,        'G0009'        )        ,
(        'L000000025'        ,        'S000000033'        ,        'G0008'        )        ,
(        'L000000025'        ,        'S000000032'        ,        'G0007'        )        ,
(        'L000000025'        ,        'S000000028'        ,        'G0006'        )        ,
(        'L000000026'        ,        'S000000033'        ,        'G0008'        )        ,
(        'L000000026'        ,        'S000000023'        ,        'G0005'        )        ,
(        'L000000026'        ,        'S000000003'        ,        'G0001'        )        ,
(        'L000000026'        ,        'S000000006'        ,        'G0002'        )        ,
(        'L000000026'        ,        'S000000005'        ,        'G0001'        )        ,
(        'L000000026'        ,        'S000000001'        ,        'G0001'        )        ,
(        'L000000027'        ,        'S000000027'        ,        'G0006'        )        ,
(        'L000000027'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000028'        ,        'S000000006'        ,        'G0002'        )        ,
(        'L000000028'        ,        'S000000033'        ,        'G0008'        )        ,
(        'L000000028'        ,        'S000000028'        ,        'G0006'        )        ,
(        'L000000028'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000028'        ,        'S000000002'        ,        'G0001'        )        ,
(        'L000000029'        ,        'S000000021'        ,        'G0004'        )        ,
(        'L000000029'        ,        'S000000038'        ,        'G0010'        )        ,
(        'L000000029'        ,        'S000000008'        ,        'G0002'        )        ,
(        'L000000030'        ,        'S000000015'        ,        'G0003'        )        ,
(        'L000000030'        ,        'S000000007'        ,        'G0002'        )        ,
(        'L000000030'        ,        'S000000009'        ,        'G0002'        )        ,
(        'L000000030'        ,        'S000000033'        ,        'G0008'        )        ,
(        'L000000030'        ,        'S000000001'        ,        'G0001'        )        ,
(        'L000000030'        ,        'S000000038'        ,        'G0010'        )        ,
(        'L000000030'        ,        'S000000027'        ,        'G0006'        )