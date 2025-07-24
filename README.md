# Zero1: Terminal for windows 
## Abstrak 
docker ini saya buat karena network kantor ditempat saya kerja tidak mengijinkan sharing hotspot. Kebijakan ini mengakibatkan WSL (Windows Subsystem for Linux) sebagai terminal utama menjadi tidak bisa terkoneksi dengan internet. Jadi saya buat sendiri terminal ubuntunya pake docker. Saya beri nama Zero1 Terminal.

## Howto
Untuk menjalankan terminal ini sangat mudah 
- ` docker compose up -d` tunggu proses build hingga selesai
- Di VS code klik `open remote window` (pojok kiri bawah)
- pada popup yang muncul pilih `Attach to Running Container...` 
- Voila! 

## Catatan
- Karena Berbasis docker JANGAN lakukan `docker compose down` karena semua applikasi yang terinstall di container akan kembali ke awal mula 
- Jika ada perubahan di `docker-compose.yaml` cukup jalankan ulang `docker compose up -d` 
- Jika ingin restart cukup `docker compose restart` atau `docker compose stop` dan `docker compose start`