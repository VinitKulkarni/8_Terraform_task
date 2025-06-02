#### NOTE: Once the terraform script is executed & resources are created, then wait for 3-4 mins to complete the userdata execution.

#### To run the terraform script:
```sh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

#### Make backend run:
- Login to backend ec2 machine <br>
- goto backend where app.py file is present <br>
- create a .env file and paste the mongodb_uri: sudo vi .env <br>
- activate the venv: source venv/bin/activate <br>
- python app.py <br>
- Backend is ready to store data in mongodb <br>


#### Make frontend run:
- Login to frontend ec2 machine <br>
- Then goto frontend where app.js file is present <br>
- create sudo vi.env file and add the backend url <br>
- BACKEND_URL=http://<PUBLIC_IP_OF_BACKEND_EC2>:5000 <br>
- node app.js <br>
- Frontend is ready and you can access it on internet <br>
