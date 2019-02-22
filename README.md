
# Soal Shift Modul 1 F12
#Bagas Juwono 05111740000163 dan Wisnu 05111740000170

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump

    ### Jawaban:

* Source Code: [disini](/soal1.sh)
* Langkah - langkah:
	Buat Script bash untuk mendecrypt isi file nature.zip 
	File tersebut diunzip menggungakan `unzip`
	Lalu di decrypt menggunakan `base64 -d`
	Setelah itu reverse hexdump filenya dengan `xxd -r`
	Lalu buat cron job dengan mengetikan perintah `crontab -e` dan atur waktu sesuai perintah soal

      14 14 14 2 5 bash /home/jendralhoki/sisop2019/modul1/soalnomor1/nature/soal1.sh

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:

    ### Jawaban: 
* Source code: [disini](/soal2.sh)
* (A) Tentukan negara dengan penjualan(quantity) terbanyak per tahun 2012
Data yang dibutuhkan : Nama negara, dan quantitynya per tahun 2012
Variabel yang dibutuhkan : 

    • “max=0”   	//untuk iterasi maksimum quantity
    
    • “negara=”a” 	// untuk iterasi negara

	
Kami menggunakan awk untuk mengsort data excel tersebut. Sebelumnya kami menggunakan “,” sebagai delimeter agar fungsi “$N” yang tadinya memanggil per kata (urut) menjadi memanggil semua data yang ada perkolomnya. Hal ini dilakukan karerna pada kolom pertama jumlah kata nama negara berbeda-beda. Jika tidak dilakukan akan terjadi pengambilan data yang berbeda karena urutan tak sama.
Yang dilakukan adalah menggabungkan quantity semua jenis barang per negara pada tahun 2012 dan mengeluarkan output negara dengan jumlah quantity terbanyak.



If($7 == “2012) {   		      # agar data yang disort hanya pada tahun 2012

Total [$1] = total [$1] + $10 	# array untuk mentotalkan jumlah quantity per negara

If (total[$1] > max) {		    # fungsi untuk mencari jumlah quantity paling banyak

max = total[$1]			# setelah itu max bernilai total[$1]

negara = $1			# setelah itu negara bernilai negara di kolom pertama yang memiliki quantity terbanyak.				
setelah mendapatkan isi “negara” dan “max” di outputkan dengan format :
	
	“print country, "with the sum of quantity:", maxq

Lalu di bash no2.sh

    (B) Tentukan 3 product line yang memberikan penjualan(quantity) terbanyak pada poin A


Data yang dibutuhkan : Product line, dan quantitynya per tahun 2012. 
Variabel yang ada : 

Prod1=”a”			 # Nama productline dengan quantity tertinggi

Prod2=”b”			 # Nama productline dengan quantity tertinggi ke -2

Prod3= “c”			 # Nama productline dengan quantity tertinggi ke -3

Maxprod1=0		    	 # Quantity prod1

Maxprod2=0			 # Quantity prod2

Maxprod3=0			 # Quantity prod3

Dengan asumsi Poin A telah selesai, maka Product line hanya pada negara “United States” di tahun 2012

Fungsi If sama seperti 2A ditambah asumsi “United States” sebagai negara paling banyak quantity-nya. Seperti no 2A max quantity produksi dijumlahkan. 

Untuk pencarian 3 productline tertinggi dilakukan hal dibawah ini :

    1.   for(i in maxprod)     		
If pertama ( if (maxprod[i] . maxprod1){ ) untuk mencari productline tertinggi
Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod1.
    
    2. else if (maxprod[i] > maxprod2) 
Kondisi dimana data yang baru diproses lebih kecil dari maxprod1 namun lebih besar dari maxprod2. Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod2.

    3. else if (maxprod[i] > maxprod3) 
Kondisi dimana data yang baru diproses lebih kecil dari maxprod1 namun lebih besar dari maxprod3. Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod3.

Semua data sudah dapat dengan tepat, di outputkan dengan :

print "1.", p1, "with the sum of quantity as big as: ", maxp1
print "2.", p2, "with the sum of quantity as big as: ", maxp2
print "3.", p3, "with the sum of quantity as big as: ", maxp3


    (C) Tentukan 3 product yang memberikan penjualan(quantity) terbanyak berdasarkan 3 product line yang didapatkan pada poin B
Dengan asumsi 3 Productline tertinggi sudah ditemukan dari no 2B
Variabel yang dibutuhkan = 

Proda=”a”			# Nama produk dengan quantity tertinggi ke- 1

Prodb=”a”			# Nama produk dengan quantity tertinggi ke -2

Prodc= “a”			# Nama produk dengan quantity tertinggi ke -3

Maxproda=0		# Quantity prod1

Maxprodb=0		# Quantity prod2

Maxprodc=0		# Quantity prod3

Prinsip kerjanya sama seperti 2A.Perbedaannya di 2C ini product line yang di targetnya

Dengan output

print "Personal Accesories: ", prod1, "with the sum of quantity of: ", maxprod1
print "Camping Equipment: ", prod2, "with the sum of quantity of: ", maxprod2
print "Outdoor Protection: ", prod3, "with the sum of quantity of: ", maxprod3
      
      
3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:

    a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
    
    b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

    c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

    d. Password yang dihasilkan tidak boleh sama.
    
    ### Jawaban:
* Source code: [disini](/soal3.sh)
* Hal yang dilakukan pertama kali yaitu menghitung sekaligus memasukkan isi file password.txt kedalam array (count). Hal ini berguna untuk menentukan file keberapa ketika sebuah password terbuat. Selain itu juga bisa untuk membandingkan setiap password agar tidak ada yang sama.

Untuk generate password sendiri menggunakan command ini : pass=head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12

Urandom digunakan untuk meng-generate sembarang karakter. Namun karena output yang dihasilkan berupa pseudorandom number, maka perlu diterjemahkan (translate) ke karakter. Maka diperlukan command tr. Tr akan menerjemahkannya kedalam huruf atau angka. Karena kita hanya memerlukan 12 karakter, maka ditambahkan head -c 12.

Setelah password baru terbentuk, dilakukan looping untuk melihat apakah ada password yang ada sebelumnya. Jika ada, maka dilakukan generate lagi. Jika tidak, maka password akan dimasukkan ke file password[i].txt dengan I adalah indeks yang ada.
	 
4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. 
Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

    a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.

    b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

    c. setelah huruf z akan kembali ke huruf a

    d. Backup file syslog setiap jam.

    e. dan buatkan juga bash script untuk dekripsinya.

    ### Jawaban:
* Source code: [disini](/soal4.sh) dan [disini](/soal4D.sh)
* Tahap pertama yaitu kami mengubah isi dari /var/syslog kedalam bentuk ASCII. Hal ini akan mempermudah untuk penamaan pada file backup. Awalnya, konten dari /var/log/syslog diubah ke bentuk plain hexdump. Kemudian dengan fungsi hex2dec, bilangan hexadecimal diubah ke bentuk decimal. Untuk penamaan dengan huruf uppercase (decimal antara 65 sampai 90), pertama mengurangi bilangan decimal dan 65. Kemudian penjumlahan antara bilangan decimal dengan jam dimodulus 26 ( karena alfabet terdiri dari 26 huruf ), dan dijumlahkan kembali dengan 65 untuk menentukan ASCII nya. Pada Lowercase (decimal antrara 97 dan 122) hampir sama, perbedaanya hanya bilangan decimal dikurangi dan ditambah dengan 97. Backup akan disimpan dengan nama “$date.log” dimana date adalah jam:menit tanggal-bulan-tahun.

Untuk dekripsinya sendiri, hampir sama dengan enkripsinya, hanya berbeda ketika dilakukan mod dengan 26, bilangan decimal akan dikurangi dengan jam. Terjadi kondisi tambahan juga, ketika setelah dilakukan mod hasilnya negatif,, maka bilangan decimal ditambahkan dengan 26.

Schedule baru juga ditambahkan di crontab dengan format 0 * * * * bash /home/jendralhoki/sisop2019/modul1/soalnomor4/soal4.sh. Hal ini menunjukkan bahwa soal4.sh ( bash script untuk backup dan enkripsi) akan di-bash setiap jamnya.
		
5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:

    a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.

    b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

    c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.

    d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
    
    ### Jawaban:
* Source code: [disini](/soal5.sh)
* Langkah - langkah:
	1. Buat script awk terlebih dahulu
	2. Buat script awk seperti dibawah ini
  #!/bin/bash
  cat /var/log/syslog | awk ' 
  {
        t=tolower($0)
        if(match(t,"sudo")==0 && match(t,"cron")!=0 && NF<13)
                print $0
  }
  ' > /home/jendralhoki/modul1/syslog


	
	3. Setelah itu disimpan di /home/jendralhoki/sisop2019/modul1/soalnomor5
	4. Tidak lupa juga buat cron jobnya sesuai soal seperti dibawah ini
	
	`2-30/6 * * * * /bin/bash /home/jendralhoki/sisop2019/modul1/soalnomor5/soal5.sh`
