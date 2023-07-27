# AWS Terraform Infrastructure

This repository contains example Terraform scripts for creating an AWS infrastructure.

## Overview

The infrastructure includes 3 EC2 instances with Apache2 installed, security groups for each instance, and an Application Load Balancer (ALB) to distribute incoming traffic amongst the instances. Additionally, it also includes a PostgreSQL DB instance.

## Resources

1. **EC2 Instances:** Three EC2 instances are created with user data to install Apache2 and display a 'Hello World' message with the hostname of the instance. 

2. **Security Groups:** Each EC2 instance is associated with three security groups to allow HTTP, SSH, and all outbound traffic. There is also a security group created for the ALB.

3. **Application Load Balancer (ALB):** The ALB is set up to distribute incoming HTTP traffic to the EC2 instances.

4. **Database:** A PostgreSQL database instance is also set up with storage of 20GB.

## Usage

Before you start, you will need to install Terraform and configure your AWS credentials. After you have done that, you can initialize your Terraform workspace, which will download the provider and initialize it with the values provided in the `*.tf` files.

To initialize your Terraform workspace, run the below command:

```shell
$ terraform init
```

To check the changes that will be done by your configuration files, run the below command:

```shell
$ terraform plan
```

To apply the changes required to reach the desired state of the configuration, run the below command:

```shell
$ terraform apply
```

When you're done, you can destroy the resources you created by running the below command:

```shell
$ terraform destroy
```

Please replace the variables in the variables.tf file with your respective values.

## Note

Please note that costs may be associated with the creation of AWS resources used in these scripts. Be sure to destroy the resources when you have finished to avoid unwanted charges.