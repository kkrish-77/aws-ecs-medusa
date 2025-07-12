# Medusa Headless Commerce Platform - AWS ECS Deployment

This repository contains Infrastructure as Code (IaC) using Terraform to deploy the Medusa headless commerce platform on AWS ECS with Fargate, along with a CI/CD pipeline using GitHub Actions.

## 🏗️ Architecture Overview

The infrastructure includes:
- **ECS Fargate Cluster** - Container orchestration
- **Application Load Balancer** - Traffic distribution
- **RDS PostgreSQL** - Database for Medusa
- **Redis ElastiCache** - Session and cache storage
- **S3 Bucket** - File storage for media
- **CloudWatch Logs** - Application logging
- **GitHub Actions** - CI/CD pipeline

## 📁 Project Structure

```
├── terraform/                    # Terraform configuration
│   ├── main.tf                  # Main Terraform configuration
│   ├── variables.tf             # Variable definitions
│   ├── outputs.tf               # Output values
│   ├── providers.tf             # Provider configuration
│   ├── modules/                 # Terraform modules
│   │   ├── vpc/                 # VPC and networking
│   │   ├── ecs/                 # ECS cluster and services
│   │   ├── rds/                 # RDS database
│   │   ├── redis/               # Redis ElastiCache
│   │   └── alb/                 # Application Load Balancer
│   └── environments/            # Environment-specific configurations
│       └── prod/                # Production environment
├── .github/                     # GitHub Actions workflows
│   └── workflows/
│       ├── deploy.yml           # Main deployment workflow
│       └── destroy.yml          # Infrastructure cleanup workflow
├── docker/                      # Docker configuration
│   ├── Dockerfile               # Medusa application Dockerfile
│   └── docker-compose.yml       # Local development setup
├── scripts/                     # Utility scripts
│   ├── setup.sh                 # Initial setup script
│   └── deploy.sh                # Deployment helper script
└── docs/                        # Documentation
    └── architecture.md          # Detailed architecture documentation
```

## 🚀 Quick Start

### Prerequisites

1. **AWS CLI** configured with appropriate permissions
2. **Terraform** (version >= 1.0)
3. **Docker** for local development
4. **GitHub** repository with Actions enabled

### Setup Instructions

1. **Clone and Configure**
   ```bash
   git clone <your-repo-url>
   cd medusa-aws-ecs
   ```

2. **Configure AWS Credentials**
   ```bash
   aws configure
   ```

3. **Initialize Terraform**
   ```bash
   cd terraform/environments/prod
   terraform init
   ```

4. **Configure Variables**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your values
   ```

5. **Deploy Infrastructure**
   ```bash
   terraform plan
   terraform apply
   ```

## 🔧 Configuration

### Environment Variables

Create a `terraform.tfvars` file with the following variables:

```hcl
# AWS Configuration
aws_region = "us-east-1"
environment = "prod"

# Application Configuration
app_name = "medusa-commerce"
app_version = "latest"

# Database Configuration
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_name = "medusa_db"
db_username = "medusa_user"

# ECS Configuration
ecs_desired_count = 2
ecs_cpu = 256
ecs_memory = 512

# Domain Configuration
domain_name = "your-domain.com"
certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxx"
```

## 🔄 CI/CD Pipeline

The GitHub Actions workflow automatically:
1. Builds the Docker image
2. Pushes to ECR
3. Updates ECS service
4. Runs health checks

### Workflow Triggers
- **Push to main branch** - Deploy to production
- **Pull Request** - Run tests and validation
- **Manual trigger** - Deploy specific version

## 📊 Monitoring and Logging

- **CloudWatch Logs** - Application logs
- **CloudWatch Metrics** - ECS service metrics
- **ALB Access Logs** - HTTP request logs
- **RDS Performance Insights** - Database monitoring

## 🔒 Security

- **VPC with private subnets** for ECS tasks
- **Security Groups** with minimal required access
- **IAM Roles** with least privilege
- **Secrets Manager** for sensitive data
- **WAF** for web application protection

## 💰 Cost Optimization

- **Fargate Spot** for non-critical workloads
- **RDS Reserved Instances** for predictable workloads
- **S3 Lifecycle Policies** for cost-effective storage
- **Auto Scaling** based on demand

## 🛠️ Troubleshooting

### Common Issues

1. **ECS Service not starting**
   - Check CloudWatch logs
   - Verify security group rules
   - Check IAM permissions

2. **Database connection issues**
   - Verify RDS security group
   - Check database credentials
   - Ensure VPC connectivity

3. **ALB health check failures**
   - Verify target group configuration
   - Check application health endpoint
   - Review security group rules

## 📚 Additional Resources

- [Medusa Documentation](https://docs.medusajs.com/)
- [AWS ECS Documentation](https://docs.aws.amazon.com/ecs/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 