# with Terraform


## Terraform Flow

## Config tools

### 1.1 Config aws-cli & aws-profile

- Create AWS profile

```bash
  aws configure --profile Demo-project-stg
      AWS Access Key ID:
      AWS Secret Access Key:
      Default region name: None
      Default output format: None
```

- Check ~/.aws/credentials

```bash
[Demo-project-stg]
aws_access_key_id =
aws_secret_access_key =
```

- Set ~/.aws/config

```bash
[profile Demo-project-stg]
region = ap-southeast-1
```



## 4. Configuration Environment

- Load modules through enviroment: **configuration_env ➜ environment ➜ modules**
  - [x] test
  

## 5. Flow Modules

- **network**
  - [ ] vpc, private & public subnet, gateway, acl
- **Load Balancers**
  - [ ] NLB, target group, listern
- **Security Groups**
  - [ ] SG-ECS, SG sg-ingress-rule-magento, sg-nlb
- **IAM**
  - [ ] ECS task definition
- **ECSService**
  - [ ] Traefik, Mageto
- **ECSTaskDefinition**
  - [ ] Traefik, Mageto
- **ruote53**
  - [ ] domain



## How to Run


```bash
cd terraform/configuration_env/test
terraform init
terraform plan
terraform apply
## Release

- **Date**: 12/10/2022
- **SupportTeam**: [DevOps]
