CREATE DATABASE SocialConnect ;
use SocialConnect;

CREATE TABLE Customer (
    CustomerID INT,
    FirstName CHAR(15),
    LastName CHAR(15),
    Sex CHAR(1),
    Email VARCHAR(40),
    DOB DATE,
    Address CHAR(50),
    City CHAR(20),
    State CHAR(40),
    ZipCode INT,
    Telephone CHAR(10),
    Preferences CHAR(30),
    Rating INT,
    Password CHAR(20),
    CHECK (Rating > 0 AND Rating < 11),
    PRIMARY KEY (CustomerID)
);
INSERT INTO Customer VALUES (100100101, 'Alice', 'McKeeny', 'F', 'alice@blah.com', '1988-10-10', 'Chapin Apt 2010,Health Drive', 'Stony Brook', 'NY', 11790, 4314649881, 'cars,life insurance', 8,"");

INSERT INTO Customer VALUES (100100102, 'Bob', 'Wonderwall', 'M', 'bob@blah.com', '1988-06-08', '21 MajorApt, Oak St.', 'NewYork', 'NY', 11700, 4314649882, 'cars, clothing', 5,"");

INSERT INTO Customer VALUES (100100103, 'Elisa', 'Roth', 'F', 'elisa@blah.com', '1992-11-10', 'Corvette Apt, Maple St', 'Stony Brook', 'NY', 11790, 4314649883, 'clothing', 5,"");
 
INSERT INTO Customer VALUES (100100104, 'Kelly', 'Mcdonald', 'F', 'kelly@blah.com', '1991-11-11', '54 East Apt, Oak St', 'NewYork', 'NY', 11700, 4314649884, 'clothing,toys', 5,"");
 
INSERT INTO Customer VALUES (100100105, 'Wendy', 'Stanley', 'F', 'wendy@blah.com', '1992-08-08', 'MajorApt, Oak St.', 'Stony Brook', 'NY', 11790, 4314649885, 'life insurance', 2,"");

INSERT INTO Customer VALUES (100100106, 'Dennis', 'Ritchie', 'M', 'den@blah.com', '1992-03-02', '43 Corvette Apt, Maple St.', 'NewYork', 'NY', 11700, 4314649886, 'life insurance', 2,"");

INSERT INTO Customer VALUES (100100107, 'Patrick', 'Norris', 'M', 'patnor@blahblah.com', '1992-08-07', 'Chapin Apt 1001,Health Drive', 'Stony Brook', 'NY', 11790, 4314649887, 'cars,clothing', 2,"");

INSERT INTO Customer VALUES (100100108, 'Chuck', 'Stewart', 'M', 'chuck@blah.com', '1991-02-01', '54 East Apt, Oak St.', 'NewYork', 'NY', 11700, 4314649888, 'clothing,life insurance', 2,"");
 
INSERT INTO Customer VALUES (100100109, 'Brad', 'Norton', 'M', 'brad@blah.com', '1992-09-01', 'Chapin Apt 2010, Health Drive', 'Stony Brook', 'NY', 11790, 4314649889, 'life insurance', 2,"");

INSERT INTO Customer VALUES (100100110, 'Jeniffer', 'Buffet', 'F', 'jennycool123@blah.com', '1989-08-01', 'Chapin Apt 1223, Health Drive', 'NewYork', 'NY', 11700, 4314649890, 'life insurance', 2,"");


CREATE TABLE Account (
    CustomerID INT,
    AccountNumber INT,
    AccountCreationDate DATE,
    CreditCardNum CHAR(16),
    PRIMARY KEY (AccountNumber),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE
);

INSERT INTO Account VALUES(100100101, 90010101, '2011-04-10', 4123132454456550); 
INSERT INTO Account VALUES(100100102, 90010102, '2011-04-10', 1221344356657880); 
INSERT INTO Account VALUES(100100103, 90010103, '2011-04-10', 9889677645543220); 
INSERT INTO Account VALUES(100100104, 90010104, '2011-04-10', 1221655609907660);
INSERT INTO Account VALUES(100100105, 90010105, '2011-05-10', 1221322334434550);
INSERT INTO Account VALUES(100100106, 90010106, '2011-05-10', 9889877867764550); 
INSERT INTO Account VALUES(100100107, 90010107, '2011-06-10', 3443566576678770); 
INSERT INTO Account VALUES(100100108, 90010108, '2011-06-10', 1221122132232330);
INSERT INTO Account VALUES(100100109, 90010109, '2011-06-10', 1234432145544550); 
INSERT INTO Account VALUES(100100110, 90010110, '2011-06-10', 2345543289000980);
INSERT INTO Account VALUES(100100101, 90010111, '2011-07-10', 2345543282424980);
INSERT INTO Account VALUES(100100102, 90010112, '2011-07-10', 2345543289003440);

CREATE TABLE HasAccount (
    CustomerID INT,
    AccountNumber INT,
    PRIMARY KEY (AccountNumber),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE,
   FOREIGN KEY (AccountNumber)
        REFERENCES Account (AccountNumber)
);

INSERT INTO HasAccount VALUES(100100101, 90010101); 
INSERT INTO HasAccount VALUES(100100102, 90010102); 
INSERT INTO HasAccount VALUES(100100103, 90010103); 
INSERT INTO HasAccount VALUES(100100104, 90010104);
INSERT INTO HasAccount VALUES(100100105, 90010105);
INSERT INTO HasAccount VALUES(100100106, 90010106); 
INSERT INTO HasAccount VALUES(100100107, 90010107); 
INSERT INTO HasAccount VALUES(100100108, 90010108);
INSERT INTO HasAccount VALUES(100100109, 90010109); 
INSERT INTO HasAccount VALUES(100100110, 90010110);
INSERT INTO HasAccount VALUES(100100101, 90010111);
INSERT INTO HasAccount VALUES(100100102, 90010112);

CREATE TABLE Circle (
    CircleID INT,
    CircleName CHAR(20),
    Type CHAR(20),
    Owner INT,
    PRIMARY KEY (CircleID),
    FOREIGN KEY (Owner) 
        REFERENCES Customer (CustomerID)
);

INSERT INTO Circle VALUES (8001, 'My Friends', 'Friends', 100100101);
INSERT INTO Circle VALUES (8002, 'Best Friends', 'Friends', 100100102);
INSERT INTO Circle VALUES (8003, 'StonyBrookGang', 'Friends', 100100105);
INSERT INTO Circle VALUES (8004, 'CSJunkies', 'Group', 100100107); 
INSERT INTO Circle VALUES (8005, 'Norris Family', 'Family', 100100109);
INSERT INTO Circle VALUES (8006, 'Microsoft Groupies', 'Company', 100100106);

CREATE TABLE HasA (
    CircleID INT,
    PageID INT, 
    PRIMARY KEY (PageID),
    FOREIGN KEY (CircleID)
        REFERENCES Circle (CircleID) ON DELETE CASCADE,
   FOREIGN KEY (PageID)
      REFERENCES Page (PageID)
);

INSERT INTO HasA VALUES (6900, 8001);
INSERT INTO HasA VALUES (6904, 8003); 
INSERT INTO HasA VALUES (6905, 8004); 
INSERT INTO HasA VALUES (6908, 8005); 
INSERT INTO HasA VALUES (6910, 8006);

CREATE TABLE CircleMembership (
    CustomerID INT,
    CircleID INT,
    PRIMARY KEY (CustomerID , CircleID),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (CircleID)
        REFERENCES Circle (CircleID) ON DELETE CASCADE
);
INSERT INTO CircleMembership VALUES (100100101, 8001);
INSERT INTO CircleMembership VALUES (100100102, 8002);
INSERT INTO CircleMembership VALUES (100100105, 8003);
INSERT INTO CircleMembership VALUES (100100107, 8004);
INSERT INTO CircleMembership VALUES (100100109, 8005);
INSERT INTO CircleMembership VALUES (100100106, 8006);
INSERT INTO CircleMembership VALUES (100100102, 8001);
INSERT INTO CircleMembership VALUES (100100103, 8001);
INSERT INTO CircleMembership VALUES (100100104, 8001);
INSERT INTO CircleMembership VALUES (100100101, 8002);
INSERT INTO CircleMembership VALUES (100100110, 8002);
INSERT INTO CircleMembership VALUES (100100106, 8003);
INSERT INTO CircleMembership VALUES (100100103, 8004);
INSERT INTO CircleMembership VALUES (100100104, 8004);
INSERT INTO CircleMembership VALUES (100100108, 8005);
INSERT INTO CircleMembership VALUES (100100110, 8005);
INSERT INTO CircleMembership VALUES (100100105, 8005);
INSERT INTO CircleMembership VALUES (100100107, 8006);
INSERT INTO CircleMembership VALUES (100100108, 8006); 
INSERT INTO CircleMembership VALUES (100100109, 8006);

CREATE TABLE Owns (
    CircleID INT,
    CustomerID INT,
    PRIMARY KEY (CircleID),
    FOREIGN KEY (CircleID)
        REFERENCES Circle (CircleID),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE
);

INSERT INTO Owns VALUES (8001, 100100101);
INSERT INTO Owns VALUES (8002, 100100102);
INSERT INTO Owns VALUES (8003, 100100105);
INSERT INTO Owns VALUES (8004, 100100107);
INSERT INTO Owns VALUES (8005, 100100109);
INSERT INTO Owns VALUES (8006, 100100106);

CREATE TABLE Page (
    PageID INT,
    PostCount INT,
    AssociatedCircleID INT,
    PRIMARY KEY (PageID),
    FOREIGN KEY (AssociatedCircleID)
        REFERENCES Circle (CircleID)
);

INSERT INTO Page VALUES (6900, 2, 8001);
INSERT INTO Page VALUES (6904, 1, 8003); 
INSERT INTO Page VALUES (6905, 1, 8004); 
INSERT INTO Page VALUES (6908, 0, 8005); 
INSERT INTO Page VALUES (6910, 1, 8006);

CREATE TABLE Post (
    PostID INT,
    Date DATE,
    Content CHAR(200),
    CommentCount INT,
    AuthorID INT,
    PageID INT,
    PRIMARY KEY (PostID),
    FOREIGN KEY (AuthorID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (PageID)
        REFERENCES Page (PageID) ON DELETE CASCADE
);

INSERT INTO Post VALUES (20111, '2011-10-10', 'Its Snowing! :D', 2, 100100105, 6904);
INSERT INTO Post VALUES (20112, '2011-11-10', 'GO Seawolves!!!!', 3, 100100106, 6910); 
INSERT INTO Post VALUES (20113, '2011-11-10', 'Arrgh!I hate facebook!', 0, 100100103, 6900); 
INSERT INTO Post VALUES (20114, '2011-12-10', 'MackBook Finally!!!', 1, 100100104, 6900);
INSERT INTO Post VALUES (20115, '2011-12-10', 'ritchie RIP :(', 0, 100100104, 6905);

CREATE TABLE Contains (
    PageID INT,
    PostID INT,
    PRIMARY KEY (PostID),
    FOREIGN KEY (PostID)
        REFERENCES Post (PostID),
    FOREIGN KEY (PageID)
        REFERENCES Page (PageID) ON DELETE CASCADE
);

INSERT INTO Contains VALUES (20111, 6904);
INSERT INTO Contains VALUES (20112, 6910); 
INSERT INTO Contains VALUES (20113, 6900); 
INSERT INTO Contains VALUES (20114, 6900);
INSERT INTO Contains VALUES (20115, 6905);

CREATE TABLE Comment (
    CommentID INT,
    Date DATE,
    Content CHAR(200),
    AuthorID INT,
    PostID INT,
    PRIMARY KEY (CommentID),
    FOREIGN KEY (PostID)
        REFERENCES Post (PostID)
        ON DELETE CASCADE,
    FOREIGN KEY (AuthorID)
        REFERENCES Customer (CustomerID)
        ON DELETE CASCADE
);

INSERT INTO Comment VALUES (900001, '2011-10-10', 'Its beautiful! :)', 100100101, 20111); 
INSERT INTO Comment VALUES (900002, '2011-11-10', 'Natures white blanket :D', 100100107, 20111); 
INSERT INTO Comment VALUES (900003, '2011-11-10', 'GO! GO! GO!', 100100104, 20112); 
INSERT INTO Comment VALUES (900004, '2011-11-10', 'we totally owned them!', 100100103, 20112); 
INSERT INTO Comment VALUES (900005, '2011-12-10', 'we won! We won!', 100100102, 20112); 
INSERT INTO Comment VALUES (900006, '2011-12-10', 'Congrats!', 100100109, 20114);

CREATE TABLE Message (
    MessageID INT,
    Date DATE,
    Subject CHAR(20),
    Content CHAR(200),
    Sender INT,
    Receiver INT,
    PRIMARY KEY (MessageID),
    FOREIGN KEY (Sender)
        REFERENCES Customer (CustomerID),
    FOREIGN KEY (Receiver)
        REFERENCES Customer (CustomerID)
);

INSERT INTO Message VALUES (3001, '2011-10-10', 'hey!', 'Hey! Do u have assignent 1 questions?', 100100101, 100100102); 
INSERT INTO Message VALUES (3002, '2011-10-10', 're: hey!', 'nope? I think patrick has them.', 100100102, 100100101); 
INSERT INTO Message VALUES (3003, '2011-11-11', 'happy bday!', 'hey u there! Have an amazing and super duper bday! Don?t miss me too much :D', 100100103, 100100104); 
INSERT INTO Message VALUES (3004, '2011-11-10', 'will be late', 'Hey! I am sorry I wont make it to tonights appointment.Stuck with some work! :(', 100100105, 100100105);

CREATE TABLE Employee (
    SSN VARCHAR(9),
    EmployeeID INT,
    FirstName CHAR(15),
    LastName CHAR(15),
    Address CHAR(50),
    City CHAR(20),
    State CHAR(2),
    ZipCode INT,
    Telephone CHAR(10),
    StartDate DATE,
    HourlyRate INT,
    Role CHAR(30),
    Password CHAR(20),
    PRIMARY KEY (EmployeeID)
);

INSERT INTO Employee VALUES(111222333, 111221, 'Mike', 'Thomas', '43 Apple Apt,Maple Street', 'Stony Brook', 'NY', 11790, 6314648998, '2011-04-10', 20, 'Customer Representative',""); 
INSERT INTO Employee VALUES(111333222, 111222, 'Jonthan', 'Klaus', '76 PotterApt,Muriel Avenue', 'Stony Brook', 'NY', 11790, 6314651232, '2011-05-05', 20, 'Customer Representative',""); 

CREATE TABLE Manager (
    SSN VARCHAR(9),
    ManagerID INT,
    FirstName CHAR(15),
    LastName CHAR(15),
    Address CHAR(50),
    City CHAR(20),
    State CHAR(2),
    ZipCode INT,
    Telephone CHAR(10),
    StartDate DATE,
    HourlyRate INT,
    Role CHAR(30),
    Password CHAR(20),
    PRIMARY KEY (EmployeeID)
);

INSERT INTO Manager VALUES(111444111, 111220, 'Scott', 'Thomas', '11 Oak St,Mart Avenue', 'Stony Brook', 'NY', 11790, 4312345432, '2011-01-05', 'Manager',"");

CREATE TABLE Supervises (
    ManagerID INT
    EmployeeID INT
    PRIMARY KEY (ManagerID, EmployeeID)
    FOREIGN KEY (ManagerID)
        REFERENCES Manager (ManagerID)
   FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
);

 INSERT INTO Supervises VALUES (999221, 111222333);
 INSERT INTO Supervises VALUES (999221, 111333222);
 INSERT INTO Supervises VALUES (999221, 111444111);

CREATE TABLE Advertisement (
    AdvertisementID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Type CHAR(20),
    Date DATE,
    Company CHAR(30),
    ItemName CHAR(20),
    Content CHAR(200),
    UnitPrice DECIMAL,
    Quantity INT,
    PRIMARY KEY (AdvertisementID),
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID) ON DELETE CASCADE
);

INSERT INTO Advertisement VALUES(33331, 111221, 'car', '2011-04-10', 'Ford', '2012-Mustang', 'Ford Mustang! First 10 cutomers get a 10%Discount!', 22000, 30); 
INSERT INTO Advertisement VALUES(33332, 111222, 'clothing', '2011-10-11', 'GAP', 'Superman Shirt', 'Just $5!!!!!!!', 5, 100);

CREATE TABLE Places (
    EmployeeID INT NOT NULL,
    AdvertisementID INT NOT NULL,
     PRIMARY KEY (EmployeeID, AdvertisementID),
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID) ON DELETE CASCADE
   FOREIGN KEY (AdvertisementID)
        REFERENCES Advertisement (AdvertisementID) ON DELETE CASCADE
);

INSERT INTO Places VALUES (111221, 33331);
INSERT INTO Places VALUES (111222, 33332);


CREATE TABLE Sale (
    TransactionID INT,
    DateTime DATETIME,
    AdvertisementID INT,
    Quantity INT,
    AccountNumber INT,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (AdvertisementID)
        REFERENCES Advertisement (AdvertisementID),
    FOREIGN KEY (AccountNumber)
        REFERENCES Account (AccountNumber),
    CHECK (Month > 0 AND Month < 13)
);

INSERT INTO Sale VALUES (200010001, '2011-04-22', 33331, 1, 90010101); 
INSERT INTO Sale VALUES (200010002, '2011-04-22', 33332, 2, 90010101);
INSERT INTO Sale VALUES (200010003, '2011-04-22', 33332, 4, 90010102); 
INSERT INTO Sale VALUES (200010004, '2011-04-22', 33332, 2, 90010103);

CREATE TABLE LikesPost (
    PostID INT,
    CustomerID INT,
    PRIMARY KEY (PostID , CustomerID),
    FOREIGN KEY (PostID) REFERENCES Post (PostID)
ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO LikesPost VALUES (20111, 100100101);
INSERT INTO LikesPost VALUES (20111, 100100102);
INSERT INTO LikesPost VALUES (20111, 100100103);
INSERT INTO LikesPost VALUES (20111, 100100104);
INSERT INTO LikesPost VALUES (20112, 100100101);
INSERT INTO LikesPost VALUES (20112, 100100102);
INSERT INTO LikesPost VALUES (20112, 100100103);
INSERT INTO LikesPost VALUES (20112, 100100104);
INSERT INTO LikesPost VALUES (20112, 100100105);
INSERT INTO LikesPost VALUES (20112, 100100107);
INSERT INTO LikesPost VALUES (20112, 100100108);
INSERT INTO LikesPost VALUES (20112, 100100109);
INSERT INTO LikesPost VALUES (20113, 100100105);
INSERT INTO LikesPost VALUES (20114, 100100106);
INSERT INTO LikesPost VALUES (20114, 100100102);

CREATE TABLE Writes (
    PostID INT,
    CustomerID INT,
    PRIMARY KEY (PostID),
    FOREIGN KEY (PostID)
        REFERENCES Post (PostID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE
);


INSERT INTO Writes VALUES (20111, 100100105);
INSERT INTO Writes VALUES (20112, 100100106); 
INSERT INTO Writes VALUES (20113, 100100103); 
INSERT INTO Writes VALUES (20114, 100100104);
INSERT INTO Writes VALUES (20115, 100100104);

CREATE TABLE Makes (
    CommentID INT,
    CustomerID INT,
    PRIMARY KEY (CommentID),
    FOREIGN KEY (CommentID)
        REFERENCES Comment (CommentID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID) ON DELETE CASCADE
);

INSERT INTO Makes VALUES (900001, 100100101); 
INSERT INTO Makes VALUES (900002, 100100107); 
INSERT INTO Makes VALUES (900003, 100100104); 
INSERT INTO Makes VALUES (900004, 100100103); 
INSERT INTO Makes VALUES (900005,100100102); 
INSERT INTO Makes VALUES (900006, 100100109);

CREATE TABLE Gets (
   CommentID INT,
    PostID INT,
    PRIMARY KEY (CommentID),
    FOREIGN KEY (PostID)
        REFERENCES Post (PostID) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (CommentID)
        REFERENCES Comment (CommentID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Gets VALUES (900001, 20111); 
INSERT INTO Gets VALUES (900002, 20111); 
INSERT INTO Gets VALUES (900003, 20112); 
INSERT INTO Gets VALUES (900004, 20112); 
INSERT INTO Gets VALUES (900005, 20112); 
INSERT INTO Gets VALUES (900006, 20114);

CREATE TABLE LikesComment (
    CommentID INT,
    CustomerID INT,
    PRIMARY KEY (CommentID , CustomerID),
    FOREIGN KEY (CommentID)
        REFERENCES Comment (CommentID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

 
INSERT INTO LikesComment VALUES (900002, 100100101);
INSERT INTO LikesComment VALUES (900002, 100100102); 
INSERT INTO LikesComment VALUES (900002, 100100103); 
INSERT INTO LikesComment VALUES (900002, 100100104); 
INSERT INTO LikesComment VALUES (900004, 100100106); 
INSERT INTO LikesComment VALUES (900004, 100100107); 
INSERT INTO LikesComment VALUES (900004, 100100108);
