create or replace TABLE TRAVEL_DB.RAW.CUSTOMER_DETAILS (
	CUSTOMER_ID NUMBER(38,0) NOT NULL,
	FIRST_NAME VARCHAR(100),
	LAST_NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	PHONE_NUMBER VARCHAR(15),
	ADDRESS VARCHAR(255),
	COUNTRY_CODE VARCHAR(10),
	SEGMENT_ID NUMBER(38,0),
	primary key (CUSTOMER_ID)
);

INSERT INTO TRAVEL_DB.RAW.customer_details (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, COUNTRY_CODE, SEGMENT_ID)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '123 Maple St', 'US', 1),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '1234567891', '456 Oak St', 'CA', 2),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '1234567892', '789 Pine St', 'FR', 1),
(4, 'David', 'Williams', 'david.williams@example.com', '1234567893', '101 Birch St', 'IN', 3),
(5, 'Eva', 'Miller', 'eva.miller@example.com', '1234567894', '202 Cedar St', 'CA', 2),
(6, 'Frank', 'Taylor', 'frank.taylor@example.com', '1234567895', '303 Walnut St', 'FR', 3),
(7, 'Grace', 'Anderson', 'grace.anderson@example.com', '1234567896', '404 Elm St', 'US', 1),
(8, 'Hannah', 'Martinez', 'hannah.martinez@example.com', '1234567897', '505 Pine St', 'IN', 2),
(9, 'Ivy', 'Thomas', 'ivy.thomas@example.com', '1234567898', '606 Oak St', 'US', 1),
(10, 'Jack', 'Jackson', 'jack.jackson@example.com', '1234567899', '707 Maple St', 'CA', 3),
(11, 'Karen', 'White', 'karen.white@example.com', '1234567800', '808 Birch St', 'FR', 2),
(12, 'Leo', 'Harris', 'leo.harris@example.com', '1234567801', '909 Cedar St', 'IN', 3),
(13, 'Mona', 'Clark', 'mona.clark@example.com', '1234567802', '1010 Elm St', 'US', 1),
(14, 'Nathan', 'Lewis', 'nathan.lewis@example.com', '1234567803', '1111 Walnut St', 'CA', 2),
(15, 'Olivia', 'Walker', 'olivia.walker@example.com', '1234567804', '1212 Pine St', 'FR', 1),
(16, 'Paul', 'Young', 'paul.young@example.com', '1234567805', '1313 Oak St', 'IN', 3),
(17, 'Quinn', 'King', 'quinn.king@example.com', '1234567806', '1414 Cedar St', 'US', 2),
(18, 'Rita', 'Scott', 'rita.scott@example.com', '1234567807', '1515 Maple St', 'CA', 1),
(19, 'Sam', 'Adams', 'sam.adams@example.com', '1234567808', '1616 Birch St', 'FR', 3),
(20, 'Tina', 'Baker', 'tina.baker@example.com', '1234567809', '1717 Pine St', 'IN', 2),
(21, 'Ursula', 'Gonzalez', 'ursula.gonzalez@example.com', '1234567810', '1818 Oak St', 'US', 1),
(22, 'Vera', 'Nelson', 'vera.nelson@example.com', '1234567811', '1919 Cedar St', 'CA', 3),
(23, 'Wendy', 'Carter', 'wendy.carter@example.com', '1234567812', '2020 Maple St', 'FR', 2),
(24, 'Xander', 'Mitchell', 'xander.mitchell@example.com', '1234567813', '2121 Birch St', 'IN', 1),
(25, 'Yara', 'Perez', 'yara.perez@example.com', '1234567814', '2222 Pine St', 'US', 3),
(26, 'Zane', 'Roberts', 'zane.roberts@example.com', '1234567815', '2323 Oak St', 'CA', 2),
(27, 'Amy', 'Evans', 'amy.evans@example.com', '1234567816', '2424 Cedar St', 'FR', 1),
(28, 'Ben', 'Green', 'ben.green@example.com', '1234567817', '2525 Maple St', 'IN', 2),
(29, 'Clara', 'Hernandez', 'clara.hernandez@example.com', '1234567818', '2626 Birch St', 'US', 1),
(30, 'Dean', 'Collins', 'dean.collins@example.com', '1234567819', '2727 Pine St', 'CA', 3);



