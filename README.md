
<div align="center">

![image](https://user-images.githubusercontent.com/111561203/223317186-0630da8c-c88b-4531-bd94-c56953138279.png)

# Sistem Informasi Pemesanan Tiket Hotel

•
[Tentang](#scroll-tentang)
•
[Screenshot](#rice_scene-screenshot)
•
[Demo](#dvd-demo)
•
[Dokumentasi](#blue_book-dokumentasi)


![image](https://user-images.githubusercontent.com/111561203/228001411-9729a033-96ff-4f20-8f13-d3a1bde137ff.png)

</div>

## :bookmark_tabs: Menu

- [Tentang](#scroll-tentang)
- [Screenshot](#rice_scene-screenshot)
- [Demo](#dvd-demo)
- [Dokumentasi](#blue_book-dokumentasi)
- [Requirements](#exclamation-requirements)
- [Skema Database](#floppy_disk-skema-database)
- [ERD](#rotating_light-erd)
- [Deskripsi Data](#heavy_check_mark-deskripsi-data)
- [Struktur Folder](#open_file_folder-struktur-folder)
- [Tim Pengembang](#smiley_cat-tim-pengembang)

## :scroll: Tentang

Reservasi hotel merupakan layanan yang bisa digunakan masyarakat jika ingin memesan kamar hotel untuk waktu tertentu. Biasanya, reservasi hotel dilakukan beberapa hari sebelum kedatangan atau rencana check in yang akan dilakukan.Pemesanan ini dapat dilakukan oleh tamu ataupun agen hotel. Di jaman berkembangnya teknologi seperti sekarang, untuk memesan hotel, tamu tidak harus datang ke hotelnya langsung, tetapi dapat dilakukan di rumah melalui online menggunakan smartphone ataupun PC. Sistem reservasi online memanfaatkan sistem informasi guna mempermudah tamu dalam mencari dan melakukan booking hotel yang sesuai keinginan tanpa harus membuka website hotel satu persatu yang akan memakan waktu dan juga tenaga. Berdasarkan pemaparan tersebut, maka kami akan membuat basis data reservasi hotel untuk memudahkan tamu melakukan booking hotel.

## :rice_scene: Screenshot

Shiny adalah paket R yang membuatnya mudah untuk membangun aplikasi web interaktif langsung dari R. Pengguna dapat meng-host aplikasi mandiri di halaman web atau menanamkannya dalam dokumen R Markdown atau membangun dashboard. 

Pada sistem manajemen database reservasi hotel ini, dibuat dashboard untuk untuk merangkum tampilan /informasi penting dalam satu layar tentang database reservasi hotel.

### 1. Dashboard
Pada dashboard ini menampilkan halaman tim pengembang, grafik pengunjung, dan grafik tagihan.

#### a. Tim Pengembang

![tim pengembang](https://user-images.githubusercontent.com/111561203/227986377-1306d014-645f-4ad1-b6a7-6b0d4b70f9e4.PNG)

#### b. Grafik Pengunjung

![grafik pengunjung](https://user-images.githubusercontent.com/111561203/227986924-b72f8242-e994-446e-a728-0a23f9810ad4.PNG)

#### c. Grafik Tagihan

![grafik tagihan](https://user-images.githubusercontent.com/111561203/227987064-d79651fc-d869-4802-a064-bc248428d2c3.PNG)

### 2. Data Hotel
Pada data hotel ini menampilkan informasi tentang hotel yang tersedia pada database.

![data hotel](https://user-images.githubusercontent.com/111561203/227987208-36b60fc4-147f-4cc2-930f-5ff1067c4d99.PNG)

### 3. Data Guest
Pada data guest ini akan ditampilkan informasi tentang guest yang melakukan reservasi hotel.

![data guest](https://user-images.githubusercontent.com/111561203/227987354-3f56e07a-3407-4a35-8c33-6dbab86e1bc5.PNG)

### 4. Data Kamar
Pada data kamar ini akan ditampilkan informasi tentang kamar di masing-masing hotel yang tersedia pada database.

![data kamar](https://user-images.githubusercontent.com/111561203/227987528-017c876c-4a74-481a-8b64-4990b5934167.PNG)

### 5. Riwayat Pemesanan
Pada riwayat pemesanan ini akan ditampilkan informasi tentang riwayat reservasi oleh guest berdasarkan masing-masing hotel.

![riwayat pemesanan 1](https://user-images.githubusercontent.com/111561203/227990168-3c8e0227-69c5-4c6b-9255-54d2d576f81c.png)


## :dvd: Demo

https://m70mrd-teguh-prasetyo.shinyapps.io/HotelReservationIS/

## :blue_book: Dokumentasi 

Dokumentasi penggunaan aplikasi database.

![tabel booking](https://user-images.githubusercontent.com/111561203/227853687-43535a6a-45f3-49c7-bb76-bc9d33452ac3.PNG)

![tabel guest](https://user-images.githubusercontent.com/111561203/227853625-c2604d42-79e2-4017-a66c-f63e3ad73a14.PNG)

![tabel hotel](https://user-images.githubusercontent.com/111561203/227853874-0e52c44c-17ee-4d89-8bb6-a4537de6c769.PNG)

![tabel room booked](https://user-images.githubusercontent.com/111561203/227854094-689e5309-6429-46a2-a7a8-d3a9f98b947e.PNG)


## :exclamation: Requirements

- Paket R yang digunakan yaitu :

library(shiny)

library(shinydashboard)

library(RPostgreSQL)

library(DBI)

library(DT)

library(plotly)

- RDBMS yang digunakan adalah PostgreSQL

- Front End menggunakan RShiny UI

- Back End menggunakan RShiny Server


## :floppy_disk: Skema Database

![Skema](https://user-images.githubusercontent.com/111561203/227851188-a3546cf5-5234-4cc8-ba27-cccc5a6b24a0.jpeg)


## :rotating_light: ERD

![ERD](https://user-images.githubusercontent.com/111561203/227851269-f3602ec9-10df-499e-963b-332ab7fd8574.jpeg)

## :heavy_check_mark: Deskripsi Data

Database untuk reservasi hotel ini didapatkan dengan menggunakan **teknik web scraping**. Web scraping merupakan sekumpulan teknik untuk mendapatkan informasi dari sebuah website secara otomatis tanpa harus menyalinnya secara manual. Pada database ini, kelompok kami akan menerapkan teknik web scraping pada **tiket.com** untuk mendapatkan data utama dari reservasi hotel, seperti nama hotel, alamat hotel, dan juga harga per kamar per malam. Web scraping pada **linkedin.com** untuk mendapatkan data nama guest. Web scraping pada **olx.com** untuk mendapatkan data alamat guest. Data nomor kamar, gender, nomor telepon, email dibuat secara manual. Web scraping ini digunakan untuk membangun website reservasi hotel.

### Create Database reservasi_hotel

``` sql
CREATE DATABASE reservasi_hotel
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```

### 1. Tabel *guest*

Tabel *guest* digunakan untuk menyimpan data tamu.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| guest_id                | character varying(10) | Id Guest                      |
| firstname               | character varying(15) | First Name                    |
| lastname                | character varying(15) | Last Name                     |
| gender                  | char(9)               | Jenis kelamin                 |
| phonenumber             | character varying(13) | Nomor Telepon                 |
| email                   | character varying(50) | Email                         |
| address                 | character varying(50) | Alamat                        |


### Create Table guest

``` sql
CREATE TABLE public.guest
(
    guest_id character varying(10) NOT NULL,
    firstname character varying(15) NOT NULL,
    lastname character varying(15),
    address character varying(50) NOT NULL,
    gender character(9) NOT NULL,
    phonenumber character varying(13) NOT NULL,
    email character varying(50) NOT NULL,
    PRIMARY KEY (guest_id)
);

ALTER TABLE IF EXISTS public.guest
    OWNER to postgres;
```

### 2. Tabel *reservation_agent*

Tabel *reservation_agent* digunakan untuk menyimpan data agen yang melakukan pemesanan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| reservationagent_id     | character varying(10) | Id Reservation Agent          |
| firstname               | character varying(15) | First Name                    |
| lastname                | character varying(15) | Last Name                     |
| gender                  | char(9)               | Jenis kelamin                 |
| phonenumber             | character varying(13) | Nomor Telepon                 |
| email                   | character varying(50) | Email                         |
| address                 | character varying(50) | Alamat                        |


### Create Table reservation_agent

``` sql
CREATE TABLE public.reservation_agent
(
    reservationagent_id character varying(10) NOT NULL,
    firstname character varying(15) NOT NULL,
    lastname character varying(15),
    address character varying(50) NOT NULL,
    gender character(9) NOT NULL,
    phonenumber character varying(13) NOT NULL,
    email character varying(50) NOT NULL,
    PRIMARY KEY (reservationagent_id)
);

ALTER TABLE IF EXISTS public.reservation_agent
    OWNER to postgres;
```

### 3. Tabel *hotels*

Tabel *hotels* digunakan untuk menyimpan data hotel.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| hotels_id                | character varying(10) | Id Hotel                      |
| name                    | character varying(100)| Nama Hotel                    |
| address                 | character varying(50) | Alamat                        |
| price                   | integer               | Harga                         |


### Create Table hotels

``` sql
CREATE TABLE public.hotels
(
    hotel_id character varying(10) NOT NULL,
    hotelname character varying(100) NOT NULL,
    address character varying(50) NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY (hotel_id)
);

ALTER TABLE IF EXISTS public.hotels
    OWNER to postgres;
```

### 4. Tabel *rooms*

Tabel *rooms* digunakan untuk untuk data penjualan kamar.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| room_id                 | character varying(10) | Id Rooms                      |
| hotel_id                | character varying(10) | Id Hotel                      |
| type                    | character varying(25) | Tipe Kamar                    |
| number                  | integer               | Nomor Kamar                   |
| floor                   | character varying(25) | Lantai                        |
| status                  | character varying(25) | Status Kamar                  |

### Create Table rooms

``` sql
CREATE TABLE public.rooms
(
    room_id character varying(10) NOT NULL,
    hotel_id character varying(10) NOT NULL,
    type character varying(50) NOT NULL,
    number integer NOT NULL,
    floor character varying(10) NOT NULL,
    status character varying(10),
    PRIMARY KEY (room_id),
    CONSTRAINT hotel_id_fkey FOREIGN KEY (hotel_id)
        REFERENCES public.hotels (hotel_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```

### 5. Tabel *booking_status*

Tabel *booking_status* digunakan untuk mengolah status pemesanan hotel.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| bookingstatus_id        | character varying(10) | Id BookingStatus              |
| description             | character varying(100)| Deskripsi                     |
| status                  | character varying(50) | Status Booking                |


### Create Table booking_status

``` sql
CREATE TABLE public.booking_status
(
    bookingstatus_id character varying(10) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    PRIMARY KEY (bookingstatus_id)
);

ALTER TABLE IF EXISTS public.booking_status
    OWNER to postgres;
```

### 6. Tabel *bookings*

Tabel *bookings* digunakan untuk mengolah data pemesanan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| bookings_id             | character varying(10) | Id Bookings                   |
| guest_id                | character varying(10) | Id Guest                      |
| hotel_id                | character varying(10) | Id Hotel                      |
| startdate               | date                  | Tanggal Mulai Booking         |
| enddate                 | date                  | Tanggal Akhir Booking         |
| roomcount               | integer               | Jumlah Kamar                  |
| bookingstatus_id        | character varying(50) | Id BookingStatus              |
| reservationagent_id     | character varying(10) | Id Reservation Agent          |

### Create Table bookings

``` sql
CREATE TABLE public.bookings
(
    booking_id character varying(10) NOT NULL,
    reservationagent_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    hotel_id character varying(10) NOT NULL,
    bookingstatus_id character varying(10) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    roomcount integer NOT NULL,
    PRIMARY KEY (booking_id),
    CONSTRAINT reservationagent_id_fkey FOREIGN KEY (reservationagent_id)
        REFERENCES public.reservation_agent (reservationagent_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT guest_id_fkey FOREIGN KEY (guest_id)
        REFERENCES public.guest (guest_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT hotel_id_fkey FOREIGN KEY (hotel_id)
        REFERENCES public.hotels (hotel_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
     CONSTRAINT bookingstatus_id_fkey FOREIGN KEY (bookingstatus_id)
        REFERENCES public.booking_status (bookingstatus_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```

### 7. Tabel *room_booked*

Tabel *room_booked* digunakan untuk untuk mengolah kamar yang akan dipesan.
Adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute               | Type                  | Description                   |
|:------------------------|:----------------------|:------------------------------|
| roombooked_id           | character varying(10) | Id RoomBooked                 |
| room_id                 | character varying(10) | Id Rooms                      |
| booking_id             | character varying(10) | Id Bookings                   |
| rate                    | character varying(10) | Rating                        |

### Create Table room_booked

``` sql
CREATE TABLE public.room_booked
(
    roombooked_id character varying(10) NOT NULL,
    room_id character varying(10) NOT NULL,
    booking_id character varying(10) NOT NULL,
    rate character varying(10) NOT NULL,
    PRIMARY KEY (roombooked_id),
    CONSTRAINT room_id FOREIGN KEY (room_id)
        REFERENCES public.rooms (room_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT booking_id FOREIGN KEY (booking_id)
        REFERENCES public.bookings (booking_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.room_booked
    OWNER to postgres;
```

## :open_file_folder: Struktur Folder

```
.
├── app           # ShinyApps
│   ├── server.R
│   └── ui.R
├── data 
│   ├── insert sql query
|       └── word insert sql query
|   ├── xlsx
|       └── excel tabel data
│   └── sql
|       └── db.sql
├── src           # Project source code
├── doc           # Doc for the project
├── .gitignore
├── LICENSE
└── README.md
```

## :smiley_cat: Tim Pengembang

- [Kelompok 1 MDS](https://github.com/Kelompok1MDS)

- Data Manager : [Irsyifa Mayzela Afnan](https://github.com/irsyifa) G1501222062

![image](https://user-images.githubusercontent.com/111561203/227850526-85963b40-de8b-442e-b180-11f294bdefff.png)


- Shiny Developer : [Teguh Prasetyo](https://github.com/teguhprasetyo08) G1501220131

![image](https://user-images.githubusercontent.com/111561203/227850496-12801984-80b0-4940-8f54-704a9eb74d2c.png)


- Shiny Developer : [Dini Ramadhani](https://github.com/diniramadhani) G1501220131

![image](https://user-images.githubusercontent.com/111561203/227850560-4046c2ae-76ea-49e9-847d-7ce7a3113407.png)


- Technical Writer : [Adeline Vinda Septiani](https://github.com/Adelievs000) G1501221006

![image](https://user-images.githubusercontent.com/111561203/227850602-2c7eb4c0-0eea-4fe5-80e3-c9793cc7d3b4.png)


- Full-Stack Developer: [Alfa Nugraha](https://github.com/alfanugraha) G1501211013
