docker pull ghcr.io/jinnrry/pmail:latest

docker run -p 25:25 -p 80:80 -p 443:443 -p 110:110 -p 465:465 -p 995:995 -v $(pwd)/config:/work/config ghcr.io/jinnrry/pmail:latest

