module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access = true

  # Disable KMS creation
  create_kms_key = false

  # Disable encryption config
  cluster_encryption_config = []

  # Skip log group creation
  create_cloudwatch_log_group = false

  eks_managed_node_groups = {

    devops_nodes = {

      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"

      subnet_ids = module.vpc.private_subnets

    }

  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

}
