# TugasKelompok1MDS
Manajemen Basis Data Reservasi Hotel

1.	Database reservasi_hotel
```sql
CREATE DATABASE Reservasi_Hotel
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```
2.	Tabel Guest
```sql
CREATE TABLE public."Guest"
(
    "GuestID" character varying(10) NOT NULL,
    "FirstName" character varying(15) NOT NULL,
    "LastName" character varying(15),
    "Address" character varying(50) NOT NULL,
    "Gender" character(9) NOT NULL,
    "PhoneNumber" character varying(13) NOT NULL,
    "Email" character varying(50) NOT NULL,
    PRIMARY KEY ("GuestID")
);

ALTER TABLE IF EXISTS public."Guest"
    OWNER to postgres;
```
3.	Reservation Agent
```sql
CREATE TABLE public."ReservasiAgent"
(
    "ReservationAgentID" character varying(10) NOT NULL,
    "FirstName" character varying(15) NOT NULL,
    "LastName" character varying(15),
    "Address" character varying(50) NOT NULL,
    "Gender" character(9) NOT NULL,
    "PhoneNumber" character varying(13) NOT NULL,
    "Email" character varying(50) NOT NULL,
    PRIMARY KEY ("ReservationAgentID")
);

ALTER TABLE IF EXISTS public."ReservasiAgent"
    OWNER to postgres;
```
4.	Buat Tabel Hotel
```sql
CREATE TABLE public."Hotel"
(
    "HotelID" character varying(10) NOT NULL,
    "HotelName" character(50) NOT NULL,
    "Address" character varying(50) NOT NULL,
    "Price" integer NOT NULL,
    PRIMARY KEY ("HotelID")
);

ALTER TABLE IF EXISTS public."Hotel"
    OWNER to postgres;
```    
5.	Tabel Room
```sql
CREATE TABLE public."Room"
(
    "RoomID" character varying(10) NOT NULL,
    "HotelID" character varying(10) NOT NULL,
    "Status" character(50) NOT NULL,
    "Number" integer NOT NULL,
    "Type" character varying(25) NOT NULL,
    "Floor" character varying(10) NOT NULL,
    PRIMARY KEY ("RoomID"),
    CONSTRAINT "HotelID_fkey" FOREIGN KEY ("HotelID")
        REFERENCES public."Hotel" ("HotelID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Room"
    OWNER to postgres;
```    
6.	Tabel Booking Status
```sql
CREATE TABLE public."BookingStatus"
(
    "BookingStatusID" character varying(10) NOT NULL,
    "Status" character varying(50) NOT NULL,
    "Description" character varying(100) NOT NULL,
    PRIMARY KEY ("BookingStatusID")
);

ALTER TABLE IF EXISTS public."BookingStatus"
    OWNER to postgres;
```    
7.	Tabel Booking
```sql
CREATE TABLE public."Booking"
(
    "BookingID" character varying(10) NOT NULL,
    "ReservationAgentID" character varying(10) NOT NULL,
    "GuestID" character varying(10) NOT NULL,
    "HotelID" character varying(10) NOT NULL,
	"BookingStatusID" character varying(10) NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "RoomCount" integer NOT NULL,
    PRIMARY KEY ("BookingID"),
    CONSTRAINT "ReservationAgentID_fkey" FOREIGN KEY ("ReservationAgentID")
        REFERENCES public."ReservasiAgent" ("ReservationAgentID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "GuestID_fkey" FOREIGN KEY ("GuestID")
        REFERENCES public."Guest" ("GuestID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "HotelID_fkey" FOREIGN KEY ("HotelID")
        REFERENCES public."Hotel" ("HotelID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	 CONSTRAINT "BookingStatusID_fkey" FOREIGN KEY ("BookingStatusID")
        REFERENCES public."BookingStatus" ("BookingStatusID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```
8.	Tabel Room Booked
```sql
CREATE TABLE public."RoomBooked"
(
    "RoomBookedID" character varying(10) NOT NULL,
	"RoomID" character varying(10) NOT NULL,
    "BookingID" character varying(10) NOT NULL,
    "Rate" character varying(10) NOT NULL,
    PRIMARY KEY ("RoomBookedID"),
    CONSTRAINT "RoomID" FOREIGN KEY ("RoomID")
        REFERENCES public."Room" ("RoomID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "BookingID" FOREIGN KEY ("BookingID")
        REFERENCES public."Booking" ("BookingID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."RoomBooked"
    OWNER to postgres;
```
