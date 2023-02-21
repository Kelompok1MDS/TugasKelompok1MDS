# TugasKelompok1MDS
Manajemen Basis Data Reservasi Hotel

1.	Database reservasi_hotel
```sql
CREATE DATABASE reservasi_hotel
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
    "Guest ID" character varying(10) NOT NULL,
    "First Name" character varying(15) NOT NULL,
    "Last Name" character varying(15),
    "Address" character varying(50) NOT NULL,
    "Gender" character(9) NOT NULL,
    "Phone number" character varying(13) NOT NULL,
    "Email" character varying(50) NOT NULL,
    PRIMARY KEY ("Guest ID")
);

ALTER TABLE IF EXISTS public."Guest"
    OWNER to postgres;
```
3.	Reservation Agent
```sql
CREATE TABLE public."Reservasi_Agent"
(
    "Reservation Agent ID" character varying(10) NOT NULL,
    "First Name" character varying(15) NOT NULL,
    "Last Name" character varying(15),
    "Address" character varying(50) NOT NULL,
    "Gender" character(9) NOT NULL,
    "Phone Number" character varying(13) NOT NULL,
    "Email" character varying(50) NOT NULL,
    PRIMARY KEY ("Reservation Agent ID")
);

ALTER TABLE IF EXISTS public."Reservasi_Agent"
    OWNER to postgres;
```
4.	Buat Tabel Hotel
```sql
CREATE TABLE public."Hotel"
(
    "Hotel ID" character varying(10) NOT NULL,
    "Hotel Name" character(50) NOT NULL,
    "Address" character varying(50) NOT NULL,
    "Price" integer NOT NULL,
    PRIMARY KEY ("Hotel ID")
);

ALTER TABLE IF EXISTS public."Hotel"
    OWNER to postgres;
```    
5.	Tabel Room
```sql
CREATE TABLE public."Room"
(
    "Room ID" character varying(10) NOT NULL,
    "Hotel ID" character varying(10) NOT NULL,
    "Status" character(50) NOT NULL,
    "Number" integer NOT NULL,
    "Type" character varying(25) NOT NULL,
    "Floor" character varying(10) NOT NULL,
    PRIMARY KEY ("Room ID"),
    CONSTRAINT "Hotel ID_fkey" FOREIGN KEY ("Hotel ID")
        REFERENCES public."Hotel" ("Hotel ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Room"
    OWNER to postgres;
```    
6.	Tabel Booking Status
```sql
CREATE TABLE public."Booking Status"
(
    "Booking Status ID" character varying(10) NOT NULL,
    "Status" character varying(50) NOT NULL,
    "Description" character varying(100) NOT NULL,
    PRIMARY KEY ("Booking Status ID")
);

ALTER TABLE IF EXISTS public."Booking Status"
    OWNER to postgres;
```    
7.	Tabel Booking
```sql
CREATE TABLE public."Booking"
(
    "Booking ID" character varying(10) NOT NULL,
    "Reservation Agent ID" character varying(10) NOT NULL,
    "Guest ID" character varying(10) NOT NULL,
    "Hotel ID" character varying(10) NOT NULL,
	"Booking Status ID" character varying(10) NOT NULL,
    "Start Date" date NOT NULL,
    "End Date" date NOT NULL,
    "Room Count" integer NOT NULL,
    PRIMARY KEY ("Booking ID"),
    CONSTRAINT "Reservation Agent ID_fkey" FOREIGN KEY ("Reservation Agent ID")
        REFERENCES public."Reservasi_Agent" ("Reservation Agent ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Guest ID_fkey" FOREIGN KEY ("Guest ID")
        REFERENCES public."Guest" ("Guest ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Hotel ID_fkey" FOREIGN KEY ("Hotel ID")
        REFERENCES public."Hotel" ("Hotel ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	 CONSTRAINT "Booking Status ID_fkey" FOREIGN KEY ("Booking Status ID")
        REFERENCES public."Booking Status" ("Booking Status ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```
8.	Tabel Room Booked
```sql
CREATE TABLE public."Room Booked"
(
    "Room Booked ID" character varying(10) NOT NULL,
	"Room ID" character varying(10) NOT NULL,
    "Booking ID" character varying(10) NOT NULL,
    "Rate" character varying(10) NOT NULL,
    PRIMARY KEY ("Room Booked ID"),
    CONSTRAINT "Room ID" FOREIGN KEY ("Room ID")
        REFERENCES public."Room" ("Room ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Booking ID" FOREIGN KEY ("Booking ID")
        REFERENCES public."Booking" ("Booking ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Room Booked"
    OWNER to postgres;
```
