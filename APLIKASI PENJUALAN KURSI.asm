.model small
.code
org 100h
start:
	jmp mulai
nama	db 13,10,'Nama Pembeli	: $'
nomor	db 13,10,'Nomor	       : $'  
alamat	db 13,10,'Alamat	      : $'
lanjut	db 13,10,'LANJUT Tekan Y untuk lanjut >>>>>>>>>>>>>>> $'
tampung_nama	db 30,?,30 dub(?)
tampung_nomor	db 13,?,13 dub(?) 
tampung_alamat	db 13,?,13 dub(?)

a db 01
b db 01
c db 03
d db 04
e db 05
f db 06
g db 07
j dw 15

daftar  db 13,10,'+----------------------------------------------------------------------+'
	    db 13,10,'|			            DAFTAR HARGA KURSI & MEREK		    	    |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|			                 KURSI				     	           |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|No |		JENIS	          |	MEREK	      |  HARGA           |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|01 |	KURSI PLASTIK          | NAPOLLY	       |  Rp. 59.000 	 |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|02 |	KURSI KANTOR ERGONOMIS | PAXIO	         |  Rp. 2.100.000   |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|03 |	KURSI SERAT ROTAN      | OTTOMAN	       |  Rp. 250.000     |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|04 |	KURSI PLASTIK PENDEK   | NICE	          |  Rp. 11.990      |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|05 |	KURSI GAMING RGC-211   | REXUS	         |  Rp. 2.799.000   |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|06 |	KURSI GAMING GC-191    | FANTECH	       |  Rp. 2.199.000   |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+'
	    db 13,10,'|07 |	KURSI GAMING GX-3 	 | ONEX	          |  Rp. 2.700.000   |'
	    db 13,10,'+---+---------------------------+-------------------+------------------+','$'



error		db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_krs	db 13,10,'Silahkan Masukkan No Kursi Yang Anda Pilih: $'
success		db 13,10,'Selamat Anda Berhasil $'

	mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nomor
	int 21h
	mov ah,0ah
	lea dx,tampung_nomor
	int 21h
	push dx   
	
	mov ah,09h
	lea dx,alamat
	int 21h
	mov ah,0ah
	lea dx,tampung_alamat
	int 21h
	push dx
	
	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	jmp proses
	jne error_msg

error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

proses:
	mov ah,09h
	mov dx,offset pilih_krs
	int 21h

	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bh,'2'
	je hasil2

	cmp bh,'0'
	cmp bh,'3'
	je hasil3

	cmp bh,'0'
	cmp bh,'4'
	je hasil4

	cmp bh,'0'
	cmp bh,'5'
	je hasil5

	cmp bh,'0'
	cmp bh,'6'
	je hasil6 
	
	cmp bh,'0'
	cmp bh,'7'
	je hasil7

	jne error_msg

;-------------------------------------------------------------------

hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h

hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h

hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h

hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h

hasil6:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h     
	
hasil7:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h
;-------------------------------------------------------------------

teks1	db 13,10,'Anda memilih KURSI PLASTIK'
	db 13,10,'Merek NAPOLLY'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 59.000 '
	db 13,10,'Terima Kasih $'

teks2	db 13,10,'Anda memilih KURSI KANTOR ERGONOMIS'
	db 13,10,'Merek PAXIO'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 2.100.000 '
	db 13,10,'Terima Kasih $'

teks3	db 13,10,'Anda memilih KURSI SERAT ROTAN'
	db 13,10,'Merek OTTOMAN'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 250.000 '
	db 13,10,'Terima Kasih $'

teks4	db 13,10,'Anda memilih KURSI PLASTIK PENDEK'
	db 13,10,'Merek NICE'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 11.990 '
	db 13,10,'Terima Kasih $'

teks5	db 13,10,'Anda memilih KURSI GAMING'
	db 13,10,'Merek REXUS'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 2.799.000 '
	db 13,10,'Terima Kasih $'

teks6	db 13,10,'Anda memilih KURSI GAMING'
	db 13,10,'Merek FANTECH'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 2.199.000 '
	db 13,10,'Terima Kasih $'
	
teks7	db 13,10,'Anda memilih KURSI GAMING'
	db 13,10,'Merek FANTECH'
	db 13,10,'Total Harga Yang Harus Anda Bayar: Rp. 2.199.000 '
	db 13,10,'Terima Kasih $'
end start