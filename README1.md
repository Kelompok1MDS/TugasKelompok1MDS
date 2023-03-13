
<div align="center">

![image](https://user-images.githubusercontent.com/111561203/223317186-0630da8c-c88b-4531-bd94-c56953138279.png)

# Judul Projek Database

[Tentang](#scroll-overview)
•
[Screenshot](#rice_scene-screenshot)
•
[Demo](#dvd-demo)
•
[Dokumentasi](#blue_book-documentation)

</div>

## :bookmark_tabs: Menu

- [Tentang](#scroll-overview)
- [Screenshot](#rice_scene-screenshot)
- [Demo](#dvd-demo)
- [Dokumentasi](#blue_book-documentation)
- [Requirements](#exclamation-requirements)
- [Skema Database](#floppy_disk-skema-database)
- [ERD](#rotating_light-erd)
- [Deskripsi Data](#heavy_check_mark-deskripsi-data)
- [Struktur Folder](#open_file_folder-stuktur-folder)
- [Tim Pengembang](#smiley_cat-tim-pengembang)

## :scroll: Tentang

Reservasi hotel merupakan layanan yang bisa digunakan masyarakat jika ingin memesan kamar hotel untuk waktu tertentu. Biasanya, reservasi hotel dilakukan beberapa hari sebelum kedatangan atau rencana check in yang akan dilakukan.Pemesanan ini dapat dilakukan oleh tamu ataupun agen hotel. Di jaman berkembangnya teknologi seperti sekarang, untuk memesan hotel, tamu tidak harus datang ke hotelnya langsung, tetapi dapat dilakukan di rumah melalui online menggunakan smartphone ataupun PC. Sistem reservasi online memanfaatkan sistem informasi guna mempermudah tamu dalam mencari dan melakukan booking hotel yang sesuai keinginan tanpa harus membuka website hotel satu persatu yang akan memakan waktu dan juga tenaga. Berdasarkan pemaparan tersebut, maka kami akan membuat basis data reservasi hotel untuk memudahkan tamu melakukan booking hotel.

## :rice_scene: Screenshot


![Data Hotel](https://user-images.githubusercontent.com/111561203/224636743-d923959a-afb5-47a7-92fb-e8dc2fbb666f.png)

![Data Guest](https://user-images.githubusercontent.com/111561203/224636816-e389fd83-c695-4a25-84d7-4e3eb4ed98fd.PNG)

![Data Reservation Agent](https://user-images.githubusercontent.com/111561203/224636915-6854ffa6-db5f-400d-a5aa-35cd9630c36b.PNG)

![Data Kamar](https://user-images.githubusercontent.com/111561203/224636964-54a7951f-4eb0-4780-8b5c-c4b94ffff2e5.PNG)

## :floppy_disk: Skema Database

![Skema](https://user-images.githubusercontent.com/111561203/223318819-697312ff-99ff-4d7e-822e-34860066556e.jpeg)


## :rotating_light: ERD

![ERD](https://user-images.githubusercontent.com/111561203/223318979-f7cdd098-b937-414d-9dca-c28183c70900.jpeg)

## :heavy_check_mark: Deskripsi Data

Database untuk reservasi hotel ini didapatkan dengan menggunakan **teknik web scraping**. Web scraping merupakan sekumpulan teknik untuk mendapatkan informasi dari sebuah website secara otomatis tanpa harus menyalinnya secara manual. Pada database ini, kelompok kami akan menerapkan teknik web scraping pada **tiket.com** untuk mendapatkan data utama dari reservasi hotel, seperti nama hotel, alamat hotel, dan juga harga per kamar per malam. Web scraping pada **linkedin.com** untuk mendapatkan data nama guest. Web scraping pada **olx.com** untuk mendapatkan data alamat guest. Data nomor kamar, gender, nomor telepon, email dibuat secara manual. Web scraping ini digunakan untuk membangun website reservasi hotel.

### Create Database Reservasi_Hotel

``` sql
CREATE DATABASE Reservasi_Hotel
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```

### 1. Tabel *Guest*

Tabel *Guest* digunakan untuk menyimpan data tamu.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| GuestID                 | character varying(10) | Id Guest                      |
| FirstName               | character varying(15) | First Name                    |
| LastName                | character varying(15) | Last Name                     |
| Gender                  | char(9)               | Jenis kelamin                 |
| PhoneNumber             | character varying(13) | Nomor Telepon                 |
| Email                   | character varying(50) | Email                         |
| Address                 | character varying(50) | Alamat                        |


### Create Table Guest

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

### 2. Tabel *Reservation Agent*

Tabel *Reservation Agent* digunakan untuk menyimpan data agen yang melakukan pemesanan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| ReservationAgentID      | character varying(10) | Id Reservation Agent          |
| FirstName               | character varying(15) | First Name                    |
| LastName                | character varying(15) | Last Name                     |
| Gender                  | char(9)               | Jenis kelamin                 |
| PhoneNumber             | character varying(13) | Nomor Telepon                 |
| Email                   | character varying(50) | Email                         |
| Address                 | character varying(50) | Alamat                        |


### Create Table Reservation Agent

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

### 3. Tabel *Hotels*

Tabel *Hotels* digunakan untuk menyimpan data hotel.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| HotelsID                | character varying(10) | Id Hotel                      |
| Name                    | character varying(100)| Nama Hotel                    |
| Address                 | character varying(50) | Alamat                        |
| Price                   | integer               | Harga                         |


### Create Table Hotels

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

### 4. Tabel *Rooms*

Tabel *Rooms* digunakan untuk untuk data penjualan kamar.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| RoomsID                 | character varying(10) | Id Rooms                      |
| HotelsID                | character varying(10) | Id Hotel                      |
| Type                    | character varying(25) | Tipe Kamar                    |
| Number                  | integer               | Nomor Kamar                   |
| Floor                   | character varying(25) | Lantai                        |
| Status                  | character varying(25) | Status Kamar                  |

### Create Table Rooms

``` sql
CREATE TABLE public."Rooms"
(
    "RoomID" character varying(10) NOT NULL,
    "HotelID" character varying(10) NOT NULL,
    "Type" character varying(50) NOT NULL,
    "Number" integer NOT NULL,
    "Floor" character varying(10) NOT NULL,
    "Status" character varying(10),
    PRIMARY KEY ("RoomID"),
    CONSTRAINT "HotelID_fkey" FOREIGN KEY ("HotelID")
        REFERENCES public."Hotels" ("HotelID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

### 5. Tabel *BookingStatus

Tabel *BookingStatus* digunakan untuk mengolah status pemesanan hotel.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| BookingStatusID         | character varying(10) | Id BookingStatus              |
| Description             | character varying(100)| Deskripsi                     |
| Status                  | character varying(50) | Status Booking                |


### Create Table BookingStatus

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

### 6. Tabel *Bookings*

Tabel *Bookings* digunakan untuk mengolah data pemesanan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| BookingsID              | character varying(10) | Id Bookings                   |
| GuestID                 | character varying(10) | Id Guest                      |
| HotelsID                | character varying(10) | Id Hotel                      |
| StartDate               | date                  | Tanggal Mulai Booking         |
| EndDate                 | date                  | Tanggal Akhir Booking         |
| RoomCount               | integer               | Jumlah Kamar                  |
| BookingStatusID         | character varying(50) | Id BookingStatus              |
| ReservationAgentID      | character varying(10) | Id Reservation Agent          |

### Create Table Bookings

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

### 7. Tabel *RoomBooked*

Tabel *RoomBooked* digunakan untuk untuk mengolah kamar yang akan dipesan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| RoomBookedID            | character varying(10) | Id RoomBooked                 |
| RoomsID                 | character varying(10) | Id Rooms                      |
| BookingsID              | character varying(10) | Id Bookings                   |
| Rate                    | character varying(10) | Rating                        |

### Create Table RoomBooked

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

## :open_file_folder: Struktur Folder

```
.
├── app           # ShinyApps
│   ├── css
│   │   ├── **/*.css
│   ├── server.R
│   └── ui.R
├── data 
│   ├── csv
│   │   ├── **/*.css
│   └── sql
|       └── db.sql
├── src           # Project source code
├── doc           # Doc for the project
├── .gitignore
├── LICENSE
└── README.md
```

## :smiley_cat: Tim Pengembang

- [@walternascimentobarroso](https://walternascimentobarroso.github.io/)
- Full-Stack Developer: [Alfa Nugraha](https://github.com/alfanugraha) G1501211013
