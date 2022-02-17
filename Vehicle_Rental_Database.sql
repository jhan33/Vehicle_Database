CREATE TABLE Customer (
	Customer_ID char(5) NOT NULL,
	Payment_ID char(5) NOT NUll,
	F_name varchar(30),
	L_name varchar(30),
	Email varchar(15),
	Home_phone varchar(15),
	Pass_word varchar(20),
	PRIMARY KEY (Customer_ID),
);

CREATE TABLE Supplier (
	Supplier_ID char(5) NOT NULL,
	Supplier_Name varchar(20),
	Supplier_Rating decimal(3,2),
	PRIMARY KEY (Supplier_ID)
);

CREATE TABLE Vehicle (
	Vehicle_ID char(5) NOT NULL,
	Supplier_Id char(5) NOT NULL,
	Make varchar(2),
	Model varchar(20),
	Daily_Rate varchar(20),
	Seats_Qty varchar(20),
	Large_Bar_Qty varchar(2),
	Small_Bag_Qty varchar(2),
	Size varchar(20),
	PRIMARY KEY (Vehicle_ID),
	FOREIGN KEY (Supplier_ID) references Supplier
		on delete cascade
		on update cascade
);


CREATE TABLE Location (
	Location_ID char(5) NOT NULL,
	Address varchar(20),
	City varchar(20),
	Country varchar(20),
	PRIMARY KEY (Location_ID)
);

CREATE TABLE Rental_Car_Inventory (
	Location_ID char(5) NOT NULL,
	Vehicle_ID char(5) NOT NULL,
	Rental_Date date,
	Available bit
);

CREATE TABLE Reservation (
	Reservation_ID char(5) NOT NULL,
	Customer_ID char(5) NOT NULL,
	Pickup_ID char(5) NOT NULL,
	Dropoff_ID char(5) NOT NULL,
	Vehicle_ID char(5) NOT NULL,

	Pickup_time time,
	Dropoff_time time,
	First_Rental_Day date,
	Last_Rental_Day date,

	CC_Address varchar(30),
	CC_City varchar(30),
	CC_State varchar(30),
	CC_Zip char(6),
	Pay_Method varchar(30),
	Card_Num varchar(30),
	Exp_Date date,
	CCV char(3),

	PRIMARY KEY (Reservation_ID),
	FOREIGN KEY (Customer_ID) references Customer,
	FOREIGN KEY (Pickup_ID) references Location,
	FOREIGN KEY (Dropoff_ID) references Location,
	FOREIGN KEY (Vehicle_ID) references Vehicle
);

