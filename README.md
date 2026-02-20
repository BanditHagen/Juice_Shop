# Environment for pentesting in an isolated Docker container.
# Application: OWASP Juice Shop, Vulnerabilities: fully activated.

## Overview
This repository contains a Docker environment built for learning and vulnerability testing in an isolated setting.
Two container builds are included and placed inside an internal Docker network without outbound internet access to
create a safe environment.

## Containers
- **juice-shop** : Target application running mode: NODE_ENV=unsafe.
- **pentest-tools** : Kali Linux environment with a base tooling setup.

## Tools Included
sqlmap | SQL Injection for automated exploits.
feroxbuster | Content discovery for finding hidden directories from "common" wordlists.
nuclei | DAST scanner for mapping known CVEs in target application.
hashcat | Password/hash cracking.
nmap | Network/Port scanner for finding open ports and services running on target.
nikto | Web scanner for finding misconfigurations and various interesting things.
python3 | Scripting and other usage.
curl | Command line tool for HTTP requests.
wget | Downloading files and resources.

# Tools can be added by modifying above list or downloaded inside container setting.
# If downloaded inside container, added tools will be temporary and wiped once container is closed.
# Native tools can reach target on "localhost:3000" / "127.0.0.1:3000" aswell as accessed by browser.

## Build tools container 
# Reads Dockerfile and builds image. (initial only, once built it can be reused). If changes are made to Docker file rebuild is needed.  
```bash
sudo docker build -t pentest-tools .
```

## Launch Environment
# Starts both containers, juice-shop + pentest-tools in -d (detached mode) --> Keeps terminal free by running in background.
```bash
sudo docker-compose up -d
```

## Access pentest Container
# Opens -it(interactive terminal) inside pentest container --> Where tools can be accessed and used.
```bash
sudo docker exec -it pentest-tools /bin/bash
``` 
- http://localhost:3000 --> for browser access

## Close Environment
# Stops both containers, to relaunch follow above steps.
```bash
sudo docker compose down
```
## Useful Commands
```bash

#Display currently operating containers with info (good for controlling environment is up and running, port value should be localhost:3000).
sudo docker ps

#Show all containers, stopped ones included.
sudo docker ps -a

#Show output/logs from a running container (useful for trouble shooting).
sudo docker logs juice-shop

#Restart named(only) container.
sudo docker-compose restart juice-shop

#Stops containers + deletes image if clean start is needed.
sudo docker-compose down --rmi all

#List all build images + filesize
sudo docker images

#Stop named(only) container.
sudo docker stop juice-shop

```
## Security
- Container is restricted to 127.0.0.1 only and not accessible from other machines (Try accessing from other device is good practice).
- Docker network isolated from internet: internal: true.
- Containers communicate through internal network.
- Isolation is necessary because Juice Shop is set to unsafe mode.

# Contributions or suggestions are welcome!

Enjoy!
//
BanditHagen

