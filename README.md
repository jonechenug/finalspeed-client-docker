# finalspeed-client-docker

##介绍
[https://github.com/d1sm/finalspeed](https://github.com/zqhong/finalspeed)
##用法

修改client_config.json和port_map.json的配置为自己的服务器
运行并挂载，如下指令：
sudo docker run --name fs --restart always -v $PWD/fs/client_config.json:/fs/client_config.json -v $PWD/fs/port_map.json:/fs/port_map.json -d -p 1099:1099 -p 2200:2200 daocloud.io/chenug/finalspeed-client:latest

