# Tugas Kelompok 1 MDS

## **Nama Anggota dan Pembagian Tugas :**

-   Irsyifa Mayzela Afnan (G1501222062) - **Data Manager**

-   Teguh Prasetyo (G1501220131) - **Shiny Developer**

-   Dini Ramadhani (G1501221006) - **Shiny Developer**

-   Adeline Vinda Septiani (G1501221016) - **Technical Writer**

## Reservasi Hotel

Reservasi hotel merupakan suatu kegiatan dimana seorang tamu datang ke hotel untuk memesan kamar dan menginap di kamar yang telah dipesan. Pemesanan ini dapat dilakukan oleh tamu ataupun agen hotel. Di jaman berkembangnya teknologi seperti sekarang, untuk memesan hotel, tamu tidak harus datang ke hotelnya langsung, tetapi dapat dilakukan di rumah melalui online menggunakan smartphone ataupun PC. Sistem reservasi online memanfaatkan sistem informasi guna mempermudah tamu dalam mencari dan melakukan booking hotel yang sesuai keinginan tanpa harus membuka website hotel satu persatu yang akan memakan waktu dan juga tenaga. Berdasarkan pemaparan tersebut, maka kami akan membuat basis data reservasi hotel untuk memudahkan tamu melakukan booking hotel.

## Database Reservasi Hotel

Database untuk reservasi hotel ini didapatkan dengan menggunakan **teknik web scraping**. Web scraping merupakan sekumpulan teknik untuk mendapatkan informasi dari sebuah website secara otomatis tanpa harus menyalinnya secara manual. Pada database ini, kelompok kami akan menerapkan teknik web scraping pada **tiket.com** untuk membangun website reservasi hotel.

## **Manajemen Basis Data Reservasi Hotel**

### Skema Database Reservasi Hotel

![WhatsApp Image 2023-02-27 at 13 23 29](https://user-images.githubusercontent.com/111561203/221501244-f13a81a2-1ed9-4392-b874-4a0cddf2b997.jpeg)

### ER Diagram Database Reservasi Hotel

![WhatsApp Image 2023-02-20 at 19 17 23](https://user-images.githubusercontent.com/111561203/221465501-78109d49-50c5-4009-a74f-de5e1eaca0bf.jpeg)

## Syntax SQL

1.  Database reservasi_hotel

``` sql
CREATE DATABASE Reservasi_Hotel
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```

2.  Tabel Guest

``` sql
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

3.  Reservation Agent

``` sql
CREATE TABLE public."ReservationAgent"
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

ALTER TABLE IF EXISTS public."ReservationAgent"
    OWNER to postgres;
```

4.  Tabel Hotel

``` sql
CREATE TABLE public."Hotels"
(
    "HotelID" character varying(10) NOT NULL,
    "HotelName" character varying(100) NOT NULL,
    "Address" character varying(50) NOT NULL,
    "Price" integer NOT NULL,
    PRIMARY KEY ("HotelID")
);

ALTER TABLE IF EXISTS public."Hotels"
    OWNER to postgres;
```

5.  Tabel Room

``` sql
CREATE TABLE public."Rooms"
(
    "RoomID" character varying(10) NOT NULL,
    "HotelID" character varying(10) NOT NULL,
    "Type" character varying(50) NOT NULL,
    "Number" integer NOT NULL,
    "Floor" character varying(10) NOT NULL,
    "Status" character(10),
    PRIMARY KEY ("RoomID"),
    CONSTRAINT "HotelID_fkey" FOREIGN KEY ("HotelID")
        REFERENCES public."Hotels" ("HotelID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."Rooms"
    OWNER to postgres;
```

6.  Tabel Booking Status

``` sql
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

7.  Tabel Booking

``` sql
CREATE TABLE public."Bookings"
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
        REFERENCES public."ReservationAgent" ("ReservationAgentID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "GuestID_fkey" FOREIGN KEY ("GuestID")
        REFERENCES public."Guest" ("GuestID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "HotelID_fkey" FOREIGN KEY ("HotelID")
        REFERENCES public."Hotels" ("HotelID") MATCH SIMPLE
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

8.  Tabel Room Booked

``` sql
CREATE TABLE public."RoomBooked"
(
    "RoomBookedID" character varying(10) NOT NULL,
    "RoomID" character varying(10) NOT NULL,
    "BookingID" character varying(10) NOT NULL,
    "Rate" character varying(10) NOT NULL,
    PRIMARY KEY ("RoomBookedID"),
    CONSTRAINT "RoomID" FOREIGN KEY ("RoomID")
        REFERENCES public."Rooms" ("RoomID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "BookingID" FOREIGN KEY ("BookingID")
        REFERENCES public."Bookings" ("BookingID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public."RoomBooked"
    OWNER to postgres;
```
