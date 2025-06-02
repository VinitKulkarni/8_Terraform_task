#### Configure AWS:
```sh
aws configure
```

#### Create frontend and backend ECR repository:
```sh
git clone https://github.com/VinitKulkarni/8_Terraform_task.git
cd part_3/step_1
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
```

#### Build the frontend and backend docker images:
```sh
git clone https://github.com/VinitKulkarni/5_docker_task.git
cd 5_docker_task/frontend
docker build -t express-frontend:9.9
cd 5_docker_task/backend
create .env file and paste the mongodb uri
docker build -t flask-backend:9.9
```

#### Push to ECR:
```sh
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 905418074680.dkr.ecr.ap-south-1.amazonaws.com
docker tag express-frontend:9.9 905418074680.dkr.ecr.ap-south-1.amazonaws.com/express-frontend:9.9
docker tag flask-backend:9.9 905418074680.dkr.ecr.ap-south-1.amazonaws.com/flask-backend:9.9
docker push 905418074680.dkr.ecr.ap-south-1.amazonaws.com/express-frontend:9.9
docker push 905418074680.dkr.ecr.ap-south-1.amazonaws.com/flask-backend:9.9
```

#### Deploy application to ECS:
```sh
cd step_2
Check s3_bucket is present or not
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
Now you will get Load Balancer DNS name to access the application on internet
http://load_balancer_dns/
```

#### To delete ECR repository:
```sh
Before this command. Need to delete the images from both frontend and backend repository.
terraform destroy --auto-approve
```

#### To delete everything:
```sh
terraform destroy --auto-approve
```
