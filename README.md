# Docker container with Yandex.Disk

[Yandex.Disk](https://disk.yandex.ru/) linux CLI client incapsulated into a docker container.

## Purpose

Continuous or one-time sync of whole Yandex.Disk to the local directory

## Usage

Before running it is needed to prepare volume for data sync:

* create directories

> mkdir /path/to/volume/{conf,data}

Disk will be synced to /path/to/volume/data, client configuration is saved to /path/to/volume/conf.

* add credentials

> vim /path/to/volume/conf/user
> vim /path/to/volume/conf/pass

Token will be generated on the first run and both user and pass will be deleted.

To start in continuous mode:

> sudo docker run -d -v /path/to/volume-example:/yandex-disk --name="yadisk" gorilych/yandex-disk

To start in one-time mode pass "sync" as argument:

> sudo docker run --rm -v /path/to/volume-example:/yandex-disk gorilych/yandex-disk sync

## Notes

Container can be discarded at any time and recreated anew, all requred information is saved to the volume.


