FROM debian:oldstable

#update repositories, install redis server and utilities
RUN apt-get update -y

RUN apt-get install redis-server -y

#set maximum cache memory and maximum memory eviction policy
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

#unbind ports, to allow redis to be connected to by other containers
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

#start redis
CMD ["redis-server", "--protected-mode", "no"]