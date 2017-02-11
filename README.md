Docker container with Yandex.Disk linux CLI client

Before running it is needed to prepare volume for data sync:

mkdir /path/to/volume/{conf,data}
vim /path/to/volume/conf/user
vim /path/to/volume/conf/pass

Token will be generated on the first run and both user and pass will be deleted.

Run:
sudo docker run -d -v /path/to/volume-example:/yandex-disk --name="yadisk" gorilych/yandex-disk

Now use /path/to/volume/data!
