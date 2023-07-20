FROM ubuntu:22.04
LABEL mantainer="Carrizo, Casado, Rizzotto"

RUN apt-get update && apt-get install --no-install-recommends -y 
RUN apt upgrade -y
RUN apt install zip -y
RUN apt install imagemagick -y
RUN apt-get install wget -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /TrabajoFinalEdP
COPY . .
RUN chmod +x ./scripts/menu.sh
ENTRYPOINT ["bash", "/TrabajoFinalEdP/scripts/menu.sh"]
