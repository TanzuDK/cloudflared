FROM ubuntu:latest AS stage
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/cloudflare/cloudflared/releases/download/2022.8.2/cloudflared-linux-$(dpkg --print-architecture).deb
RUN dpkg -i cloudflared-linux-$(dpkg --print-architecture).deb
RUN echo $(dpkg --print-architecture)
FROM stage
ENTRYPOINT ["cloudflared", "--no-autoupdate"]
CMD ["version"]
