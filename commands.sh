#Creates an amazon cloud formation stack, replace the your_name with something unique
aws cloudformation create-stack --stack-name ec2stack-your_name --region us-east-1 --template-body file://$PWD/deployment.yml

#Uses docker compose to run the app.yml to create the necessary containers
docker-compose -H tcp://EC2_Instance_IPv4:2375 -f app.yml up -d

#Takes down the containers that were created via the app.yml
docker-compose -H tcp://EC2_Instance_IPv4:2375 -f app.yml down

#Deletes the amazon cloud formation stack
aws cloudformation create-stack --delete-name ec2stack-EC2_Instance_IPv4 --region us-east-1 
