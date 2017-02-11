FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y

RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" > /etc/apt/sources.list.d/yandex.list
RUN wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add - 
RUN apt-get update && apt-get install -y yandex-disk

COPY yandex-disk.sh /

RUN mkdir -p /yandex-disk
VOLUME /yandex-disk

CMD /yandex-disk.sh


