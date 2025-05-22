# Project Overview

This project sets up a Virtual Private Cloud (VPC) in AWS with a public subnet and two EC2 instances. Each EC2 instance runs a simple web server. The infrastructure is managed using Terraform.

# Project Structure

The project is organized into the following files and directories:

*   `main.tf`: The main Terraform configuration file that defines the resources to be created.
*   `variables.tf`: Contains the definitions of input variables used to customize the infrastructure.
*   `outputs.tf`: Defines the outputs that are displayed after the infrastructure is successfully created.
*   `modules/subnet`: A Terraform module responsible for creating the public subnet.
*   `modules/webserver`: A Terraform module responsible for creating the EC2 instances and configuring the web servers.

# Resources Created

The Terraform code will create the following AWS resources:

*   **VPC:** A virtual private cloud to isolate your AWS resources.
*   **Subnet:** A public subnet within the VPC to host the EC2 instances.
*   **Internet Gateway:** Allows communication between instances in the VPC and the internet.
*   **Route Table:** Defines rules to direct network traffic from the subnet to the internet gateway.
*   **Security Group:** Acts as a virtual firewall to control inbound and outbound traffic to the EC2 instances. It allows HTTP traffic (port 80) and SSH traffic (port 22).
*   **EC2 Instances:** Two virtual servers running a simple web server.

# Prerequisites

Before you can use this Terraform code, you need the following:

*   **Terraform installed:** Download and install Terraform from the official website.
*   **AWS account configured:** Ensure you have an AWS account and your AWS credentials are configured for Terraform to use. This typically involves setting up the AWS CLI and configuring your access key ID, secret access key, and default region.

# Configuration

The project can be configured by modifying the values in the `variables.tf` file. Here's a description of the available variables:

*   `aws_region`: The AWS region where the infrastructure will be created. (e.g., "us-east-1")
*   `vpc_cidr`: The CIDR block for the VPC. (e.g., "10.0.0.0/16")
*   `subnet_cidr`: The CIDR block for the public subnet. (e.g., "10.0.1.0/24")
*   `instance_type`: The type of EC2 instances to launch. (e.g., "t2.micro")
*   `ami_id`: The ID of the Amazon Machine Image (AMI) to use for the EC2 instances. It's recommended to use an AMI specific to your chosen region.
*   `key_name`: The name of an existing EC2 Key Pair to enable SSH access to the instances. You'll need to create this key pair in the AWS console beforehand.

# Usage

Follow these steps to deploy and manage the infrastructure:

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
    This command initializes the Terraform working directory, downloading necessary provider plugins.

2.  **Plan the infrastructure:**
    ```bash
    terraform plan
    ```
    This command creates an execution plan, showing you what resources Terraform will create, modify, or destroy. Review the plan carefully.

3.  **Apply the changes:**
    ```bash
    terraform apply
    ```
    This command applies the changes defined in the Terraform configuration, creating the AWS resources. You will be prompted to confirm the action.

4.  **Destroy the infrastructure:**
    ```bash
    terraform destroy
    ```
    This command will remove all the resources created by Terraform. Be cautious with this command, as it will terminate your EC2 instances and delete other resources.

# Inputs

The following input variables are defined in `variables.tf`:

*   `aws_region`: (String) The AWS region to deploy the resources in.
*   `vpc_cidr`: (String) The CIDR block for the VPC.
*   `subnet_cidr`: (String) The CIDR block for the public subnet.
*   `instance_type`: (String) The EC2 instance type.
*   `ami_id`: (String) The AMI ID for the EC2 instances.
*   `key_name`: (String) The name of the EC2 key pair for SSH access.

# Outputs

The following outputs are defined in `outputs.tf`:

*   `instance_ips`: (List of strings) This output, if uncommented in `outputs.tf`, would provide a list of the public IP addresses of the created EC2 instances.
*   `vpc_id`: (String) This output, if uncommented in `outputs.tf`, would provide the ID of the created VPC.

Currently, these outputs are commented out in the `outputs.tf` file. To use them, you would need to uncomment the relevant lines in that file.
