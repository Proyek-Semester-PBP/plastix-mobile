[![Github Release](https://github.com/Proyek-Semester-PBP/plastix-mobile/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/Proyek-Semester-PBP/plastix-mobile/actions/workflows/release.yml)

# Proyek Akhir Semester

## Anggota 
Proyek ini dibuat anggota sebagai berikut.
- [Alvaro Luqman Widyadharma](https://github.com/AlvaroLuqmanW) (2106750616)
- [Devina Hana](https://github.com/devinahana) (2106751032)
- [Feru Pratama Kartajaya](https://github.com/ferupk) (2106750351)
- [Syarief Ahmad Al-Muhaji](https://github.com/SyariefAhmadM) (2106653445)
- [Syifa Cahya Kamila](https://github.com/kamilassyf) (2106653230)

## Deskripsi Aplikasi
PlasTIX adalah sebuah aplikasi yang bertujuan untuk memfasilitasi masyarakat untuk mengubah sampah plastik sulit terurai yang dapat merusak lingkungan menjadi sesuatu yang bernilai dan bermanfaat. Sampah plastik yang terkumpul akan didaur ulang menjadi bahan yang memiliki standar kualitas tinggi sehingga dapat digunakan untuk membuat produk yang bermanfaat. PlasTIX memberikan solusi terhadap prioritas sustainable energy transition (transisi energi berkelanjutan) Presidensi G20 Indonesia tahun 2022. Aplikasi ini memfasilitasi masyarakat untuk menukarkan sampah plastiknya menjadi sesuatu yang bernilai dan bermanfaat dengan mudah. Pengguna dapat melakukan penukaran dari mana saja seperti rumah atau kantor (jika dalam jangkauan) karena kami menyediakan fitur delivery yang dapat menjemput sampah dengan cepat. Pengguna juga dapat menukarkannya secara langsung dengan mengunjungi beberapa tempat yang sudah terintegrasi dengan aplikasi kami. Pengguna yang menukarkan sampah plastik akan memperoleh poin yang dapat digunakan dalam kehidupan sehari-hari seperti voucher belanja dan pulsa internet.  Hasil dari daur ulang berupa eco-friendly fiber dan kain daur ulang yang memiliki standar kualitas tinggi sehingga dapat dipergunakan sebagai bahan baku beragam industri.

Target pengguna dari website yang kami buat ini adalah untuk seluruh masyarakat indonesia yang bertujuan agar dapat meningkatkan kepedulian masyarakat terhadap penanggulangan sampah plastik dan karton/kardus. Terdapat dua tipe pengguna aplikasi berbeda yang dapat mengakses website PlasTIX. Tipe pengguna pertama adalah pengguna yang melakukan registrasi / login, dan tipe pengguna kedua adalah pengguna yang mengakses website tanpa melakukan registrasi. Pengguna yang telah melakukan registrasi dapat mengakses website kami secara keseluruhan, yaitu dapat langsung menukarkan sampah bahan plastik yang sudah tidak terpakai dan pengguna akan mendapatkan poin dari website kami. Poin tersebut dapat kita tukar dengan beberapa jenis layanan seperti go-pay, shopee-pay, pulsa, dll, yang nantinya dapat kita gunakan untuk membeli beberapa produk dari hasil daur ulang plastik. Berbeda dengan pengguna yang belum memiliki akun / melakukan registrasi. Pengguna tersebut hanya dapat mengakses fitur-fitur biasa, seperti deskripsi tentang web kami, konten-konten mengenai produk dari hasil daur ulang plastik, informasi terkini terkait beberapa orang yang sudah melakukan daur ulang plastik dengan website kami dan infografis lainnya secara umum.

## Daftar Implementasi Modul
Landing Page
> Halaman ini merupakan halaman utama yang menampilkan penjelasan mengenai tujuan dari aplikasi ini serta seluruh fitur yang dimiliki oleh aplikasi disertai dengan navigasi menuju halaman masing-masing fitur

Authentication Page
> Halaman yang bertujuan untuk mendaftar bagi pengguna baru dan login untuk pengguna yang sudah memiliki akun. 

Profile Page - Alvaro
> Pada halaman ini, terdapat informasi dari pengguna yang sedang login, mulai dari username, data pribadi, jumlah poin, dan histori kegiatan recycle

Shopping Page - Feru
> Pada halaman ini, pengguna dapat melihat daftar produk hasil daur ulang yang dijual dan ketika diklik, pengguna akan diarahkan menuju link e-commerce produk tersebut

News Page - Syarief
> Halaman ini berisi kumpulan artikel dengan topik yang berkaitan dengan sustainable energy transition (transisi energi berkelanjutan)

Redeem Page - Syifa
> Halaman ini dapat digunakan oleh pengguna untuk menukarkan poin yang dimilikinya dengan berbagai penawaran menarik, seperti voucher, saldo e-wallet, pulsa, paket data, donasi, dan transfer bank.

Recycle Page - Devina
> Halaman ini digunakan untuk melihat daftar lokasi yang dapat dijadikan tempat penukaran sampah plastik atau jika pengguna memilih fitur penjemputan (delivery) penukaran sampah plastik, pengguna akan diarahkan untuk mengisi form berisikan detail dari alamat penjemputannya

## Integrasi Web Service dengan Aplikasi Web
Integrasi Web Service dilakukan dengan aplikasi web Django PlasTIX. Data dalam format JSON yang digunakan pada modul-modul seperti `news`, `shopping`, dan lainnya akan dikumpulkan menggunakan dependensi `http`. Data yang dikumpulkan akan dikonversi ke dalam bentuk model dalam bahasa Dart dan ditampilkan menggunakan widget `FutureBuilder`. Selain itu, package `pbp_django_auth` akan digunakan untuk mengimplementasikan autentikasi di aplikasi mobile.

### Perubahan Versi Terakhir
* Memperbaiki autentikasi
* Mengintegrasikan modul redeem dengan modul profile
* Mengintegrasikan modul recycle dengan modul profile
* Menyamakan modul recycle dengan situs web
* Merilis aplikasi pada Github dan App Center
