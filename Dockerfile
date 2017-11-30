FROM gethue/hue:latest

COPY ./kylin-jdbc-2.2.0.jar /hue/kylin-jdbc-2.2.0.jar
COPY ./pseudo-distributed.ini /hue/desktop/conf/pseudo-distributed.ini

EXPOSE 8888
