# Build docker image of HUE with kylin
Clone repository, Replace host/port/project/username/password in pseudo-distributed.ini with you own, then run script in terminal

```
git clone git@github.com:zhaoyongjie/emr-hue-kylin.git
cd emr-hue-kylin
docker build -t hue-demo -f Dockerfile .
docker run -itd -p 8888:8888 --name hue hue-demo
```

After open web browser at: http://localhost:8888, you will see the hue is ready.

# AWS command line
Upload the download.sh to a S3 bucket; Replace host/port/project/username/password in configurations.json with you own, Then run aws cli to create a EMR cluster.

```
aws emr create-cluster --name "HUE Cluster" --release-label emr-5.10.0 \
--ec2-attributes KeyName=<keypair_name>,InstanceProfile=EMR_EC2_DefaultRole,SubnetId=<subnet_id> \
--service-role EMR_DefaultRole \
--applications Name=Hive Name=Hue Name=Pig \
--emrfs Consistent=true,RetryCount=5,RetryPeriod=30 \
--instance-count 1 --instance-type m3.xlarge \
--configurations file://configurations.json \
--bootstrap-action Path="s3://<your_bucket>/download.sh"
```

After the cluster is in "Waiting" status, open web browser at:
http://<public_dns_of_master>:8888 , you will see the cluster with hue is ready.
