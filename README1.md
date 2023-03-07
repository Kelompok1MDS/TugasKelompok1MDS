\<div align="center"\>

![Logo](<https://cdn4.vectorstock.com/i/1000x1000/36/68/online-hotel-booking-laptop-with-holiday-icons-vector-18373668.jpg>[)](https://via.placeholder.com/150x150))

\# Reservasi Hotel

[Tentang](#scroll-overview)

•

[Screenshot](#rice_scene-screenshot)

•

[Demo](#dvd-demo)

•

[Dokumentasi](#blue_book-documentation)

\</div\>

\## :bookmark_tabs: Menu

\- [Tentang](#scroll-overview)

\- [Screenshot](#rice_scene-screenshot)

\- [Demo](#dvd-demo)

\- [Dokumentasi](#blue_book-documentation)

\- [Requirements](#exclamation-requirements)

\- [Skema Database](#floppy_disk-skema-database)

\- [ERD](#rotating_light-erd)

\- [Deskripsi Data](#heavy_check_mark-deskripsi-data)

\- [Struktur Folder](#open_file_folder-stuktur-folder)

\- [Tim Pengembang](#smiley_cat-tim-pengembang)

\## :scroll: Tentang

Reservasi hotel merupakan layanan yang bisa digunakan masyarakat jika ingin memesan kamar hotel untuk waktu tertentu. Biasanya, reservasi hotel dilakukan beberapa hari sebelum kedatangan atau rencana check in yang akan dilakukan.Pemesanan ini dapat dilakukan oleh tamu ataupun agen hotel. Di jaman berkembangnya teknologi seperti sekarang, untuk memesan hotel, tamu tidak harus datang ke hotelnya langsung, tetapi dapat dilakukan di rumah melalui online menggunakan smartphone ataupun PC. Sistem reservasi online memanfaatkan sistem informasi guna mempermudah tamu dalam mencari dan melakukan booking hotel yang sesuai keinginan tanpa harus membuka website hotel satu persatu yang akan memakan waktu dan juga tenaga. Berdasarkan pemaparan tersebut, maka kami akan membuat basis data reservasi hotel untuk memudahkan tamu melakukan booking hotel.

Database untuk reservasi hotel ini didapatkan dengan menggunakan **teknik web scraping**. Web scraping merupakan sekumpulan teknik untuk mendapatkan informasi dari sebuah website secara otomatis tanpa harus menyalinnya secara manual. Pada database ini, kelompok kami akan menerapkan teknik web scraping pada **tiket.com** untuk mendapatkan data utama dari reservasi hotel, seperti nama hotel, alamat hotel, dan juga harga per kamar per malam. Web scraping pada **linkedin.com** untuk mendapatkan data nama guest. Web scraping pada **olx.com** untuk mendapatkan data alamat guest. Data nomor kamar, gender, nomor telepon, email dibuat secara manual. Web scraping ini digunakan untuk membangun website reservasi hotel.

\## :rice_scene: Screenshot

![Logo]([https://via.placeholder.com/750x500)](https://via.placeholder.com/750x500))

\## :dvd: Demo

Lorem ipsum dolor sit amet consectetur, adipisicing elit.

\| url \| login \| password \|

\| \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-- \| \-\-\-\-\-\-\-\-\-\-\-\-\-- \| \-\-\-\-\-\-\-- \|

\| <http://shinyapps.io/hospital> \| admin\@mail.com \| 123 \|

\## :blue_book: Dokumentasi

Dokumentasi penggunaan aplikasi database. Anda dapat juga membuat dokumentasi lives menggunakan readthedocs.org (opsional).

\## :exclamation: Requirements

\- Cantumkan paket R yang digunakan

\- RDBMS yang digunakan

\- [Node]([https://nodejs.org/en/download/)](https://nodejs.org/en/download/))

\- [PHP]([https://php.net/)](https://php.net/))

\## :floppy_disk: Skema Database

\## :rotating_light: ERD

\## :heavy_check_mark: Deskripsi Data

Berisi tentang tabel-tabel yang digunakan berikut dengan sintaks SQL DDL (CREATE).

Contoh:

\### 1. Tabel \*Guest\*

Tabel \*Guest\* digunakan untuk menyimpan data tamu.

\| Attribute \| Type \| Description \|

\|:\-\-\-\-\-\-\-\-\-\-\-\--\|:\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|:\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|

\| GuestID \| character varying(10) \| Id Guest \|

\| FirstName \| character varying(15) \| First Name \|

\| LastName \| character varying(15) \| Last Name \|

\| Gender \| char(9) \| Jenis kelamin \|

\| PhoneNumber \| character varying(13) \| Nomor Telepon \|

\| Email \| character varying(10) \| Email \|

\| Address \| timestamp \| Alamat \|

\### Create Table yo_user

\`\`\`sql

CREATE TABLE IF NOT EXISTS public.yo_user

(

id character varying(10) COLLATE pg_catalog."default" NOT NULL,

uid character varying(8) COLLATE pg_catalog."default" NOT NULL,

username character varying(30) COLLATE pg_catalog."default" NOT NULL,

firstname character varying(15) COLLATE pg_catalog."default" NOT NULL,

lastname character varying(15) COLLATE pg_catalog."default" NOT NULL,

gender smallint DEFAULT '0'::smallint,

province_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,

city_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,

birthdate timestamp without time zone,

linkshare_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT '0'::smallint,

CONSTRAINT yo_user_pkey PRIMARY KEY (id),

CONSTRAINT yo_user_city_id_fkey FOREIGN KEY (city_id)

REFERENCES public.yo_region_city (city_id) MATCH SIMPLE

ON UPDATE NO ACTION

ON DELETE NO ACTION,

CONSTRAINT yo_user_linkshare_id_fkey FOREIGN KEY (linkshare_id)

REFERENCES public.yo_linkshare (id) MATCH SIMPLE

ON UPDATE NO ACTION

ON DELETE NO ACTION,

CONSTRAINT yo_user_province_id_fkey FOREIGN KEY (province_id)

REFERENCES public.yo_region_province (id_province) MATCH SIMPLE

ON UPDATE NO ACTION

ON DELETE NO ACTION

);

\`\`\`

\## :open_file_folder: Struktur Folder

\`\`\`

.

├── app \# ShinyApps

│ ├── css

│ │ ├── \*\*/\*.css

│ ├── server.R

│ └── ui.R

├── data

│ ├── csv

│ │ ├── \*\*/\*.css

│ └── sql

\| └── db.sql

├── src \# Project source code

├── doc \# Doc for the project

├── .gitignore

├── LICENSE

└── README.md

\`\`\`

\## :smiley_cat: Tim Pengembang

\- [\@walternascimentobarroso]([https://walternascimentobarroso.github.io/)](https://walternascimentobarroso.github.io/))

\- Full-Stack Developer: [Alfa Nugraha]([https://github.com/alfanugraha)](https://github.com/alfanugraha)) G1501211013
