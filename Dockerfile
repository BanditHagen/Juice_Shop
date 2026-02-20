FROM kalilinux/kali-rolling
# Defines base image to build from(official Kali Linux rolling release)
# Rolling release = latest version available

#update + installing tools: RUN = execute commands when image builds, && update = latest package list, -y = auto confirm.						Clarification:
RUN apt-get update && apt-get install -y \
	sqlmap \	
	# SQL injection tool 
	feroxbuster \	
	# Content discovery 
	nuclei \	
	# DAST scanner for known CVEs
	hashcat \	
	# Password cracker
	nmap \		
	# network/portscanner
	nikto \
	# Web server vulnerability scanner
	python3 \
	# Python for scripting and http servers if needed.
	curl \
	# HTTP request tool.
	wget \
	# file downloader.
	&& apt-get clean
	# Remove cached package files once installation is completed & reduce final image size.

# Working directory inside container, created automatically if not existent.
WORKDIR /pentest 

# Default command that runs when container starts --> launch interactive bash shell

CMD ["/bin/bash"]
