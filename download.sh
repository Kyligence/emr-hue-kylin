#!/bin/bash
set -e
mkdir -p /opt/kylin_jdbc
wget -S -T 10 -t 5 https://raw.githubusercontent.com/zhaoyongjie/emr-hue-kylin/master/kylin-jdbc-2.2.0.jar -O /opt/kylin_jdbc
