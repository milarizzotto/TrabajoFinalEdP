FROM ubuntu:22.04
LABEL mantainer="Carrizo, Casado, Rizzotto"

RUN apt-get update && apt-get install --no-install-recommends -y 
RUN sudo apt install imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /tp
COPY . .
RUN chmod +x /menu.sh
ENTRYPOINT ["bash", "/tp/scripts/menu.sh"]
