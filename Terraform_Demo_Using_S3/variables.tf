
variable "aws_region" {
  type        = string
  description = "AWS region for resources allocation"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR block for subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for subnet instances"
  default     = true
}

variable "aws_instance" {
  type        = string
  description = "AWS Instance type"
  default     = "t2.micro"
}

variable "company" {
  type        = string
  description = "Name of the company"
  default     = "Globomantics"
}

variable "project" {
  type        = string
  description = "Project Name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}