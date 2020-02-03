交互式

```
docker run -it --name ipv3.1.1 -p 32000:80 -p 32001:90 -v /home/web/ip3.1.1:/data openjdk:8u131-dev
```

守护态运行

```sh
$ docker run -d --name ip3.2.3 -p 32300:80 -p 32301:90 -v /home/web/ip3.2.3:/data openjdk:8u131-dev
```
