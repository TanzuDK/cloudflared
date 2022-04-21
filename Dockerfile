FROM ubuntu:latest AS stage
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/cloudflare/cloudflared/releases/download/2022.4.1/cloudflared-linux-$(dpkg --print-architecture).deb
RUN dpkg -i cloudflared-linux-$(dpkg --print-architecture).deb
RUN echo $(dpkg --print-architecture)
FROM stage
CMD ["cloudflared","tunnel","run"]
