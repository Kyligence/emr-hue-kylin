#!/bin/bash
set -e
sudo mkdir -p /opt/kylin_jdbc
sudo wget -S -T 10 -t 5 https://raw.githubusercontent.com/Kyligence/emr-hue-kylin/master/kylin-jdbc-2.2.0.jar -O /opt/kylin_jdbc/kylin-jdbc-2.2.0.jar

sudo sed -i "s/'/\"/g" /etc/hue/conf/hue.ini
sudo sed -i "s/\"{/'{/g" /etc/hue/conf/hue.ini
sudo sed -i "s/}\"/}'/g" /etc/hue/conf/hue.ini
