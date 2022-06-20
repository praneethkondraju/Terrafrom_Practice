## CONFIGURATION
terraform {
  required_providers {
    consul = {
      source  = "hashicorp/consul"
      version = "~>2.0"
    }
  }
}

## PROVIDERS
provider "consul" {
  address    = "127.0.0.1:8500" # IP Address for Consul
  datacenter = "dc1" # Data Center name
}

## RESOURCES
resource "consul_keys" "DevOps" {

  key {
    path  = "DevOps/configuration/" # Path for storing configuration data from DevOps team
    value = ""
  }

  key {
    path  = "DevOps/state/" # Path for storing State data from DevOps team
    value = ""
  }
}

resource "consul_keys" "Development" {

  key {
    path  = "Development/configuration/" # Path for storing configuration data from Development team
    value = ""
  }

  key {
    path  = "Development/state/" # Path for storing State data from Development team
    value = ""
  }
}

resource "consul_acl_policy" "DevOps" {
  name  = "DevOps"
  rules = <<-RULE
    key_prefix "DevOps" {
      policy = "write"
    }

    session_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_policy" "Development" {
  name  = "Development"
  rules = <<-RULE
    key_prefix "Development" {
      policy = "write"
    }

    key_prefix "DevOps/state" {
      policy = "read"
    }

    session_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_token" "sai_devops" {
  description = "token for Sai from Devops team"
  policies    = [consul_acl_policy.DevOps.name]
}

resource "consul_acl_token" "ram_development" {
  description = "token for Ram from Development team"
  policies    = [consul_acl_policy.Development.name]
}

# Outputs

output "sai_devops_token_accessor_id" {
  value = consul_acl_token.sai_devops.id
}

output "ram_development_token_accessor_id" {
  value = consul_acl_token.ram_development.id
}
