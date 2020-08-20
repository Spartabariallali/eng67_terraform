# infrastructure as code with terraform

### What is terraform?
- There are side to IaC - 1. Configuration management(Ansible) 2. Orchestration (Terraform)


Kubernetes - Orchestration is used in containerisation i.e. Docker, crio, Rocket

terraform creates the infrastructure, including the machine, networking, security and monitoring the machine


terrform files are created with .tf

- terraform commands:

 terraform init
 terraform plan - checks the steps inside the .tf file and lists success or errors
 terraform apply - will implement the .tf file we have created - deploy the infrastructure

### DevOps and infrastructure as code
The idea behind infrastructure as code is that you WRITE and EXECUTE code to define, deploy, update and destroy your infrastructure.
Essentially you are treating all aspects of operations as software even thoughs aspects that represent hardware(such as setting up physical servers)
When implementing DevOps it should be possible to manage almost everyhting in code including: servers, databases, networks, log files, application configuration, documentation, automated tests, deployment processes...

### Types of Iac
- Ad hoc scripts
- Configuration management tools
- Server templating tools
- Orchestration tools
- Provisioning tools

### Orchestration Management tools
- Orchestration Management tools are essential when dealing with VMs within a cloud capacity
#### 1. Easily Deploy VMs
#### 2. Roll out updates to an existing fleet of VMs... rolling deployment
#### 3. Monitoring health of your VMs and automatically replace unhealthy ones
#### 4. Scale the number of VMs and containers up or down in response to load balancing (auto scaling)
#### 5. Allow your VMs to talk to one another over the network

### Terraform
Terraform is high-level language and is an open-source tool that is leveraged by DevOps engineers to deploy infrastructure from the comfort of their laptop.

![terraform](imagesmd/terraform.jpeg)
