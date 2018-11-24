aws cloudformation create-stack --stack-name ec2stack-your_name --region us-east-1 --template-body file://$PWD/deployment.yml

docker-compose -H tcp://EC2_Instance_IPv4:2375 -f app.yml up -d

docker-compose -H tcp://EC2_Instance_IPv4:2375 -f app.yml down

aws cloudformation create-stack --delete-name ec2stack-EC2_Instance_IPv4 --region us-east-1 