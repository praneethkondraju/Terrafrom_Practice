# Configuring Consul
- Make a sub directory `data` in current directory.
- Lauch Consul local instance using command `consul agent -bootstrap -config-file="config/consul/consul-config.hcl" -bind="127.0.0.1"`.
- Generate HTTP Bootstrap token using command `consul acl bootstrap`.
- Set your CONSUL_HTTP_TOKEN as environment variable.
  - For Linux/Mac, `export CONSUL_HTTP_TOKEN=SECRETID_VALUE`.
  - For Windows, `$env:CONSUL_HTTP_TOKEN="SECRETID_VALUE"`.

## Configure Consul using Terraform
- `terraform init`
- `terraform plan`
- `terraform apply`

## SettingUp Backend
- Create a file as `backend.tf` for letting **Terraform** know to use the specified backend and paste the code.

## Transferring StateData
- Now we will transfer our Infrastructure StateData from local to Remote(Consul).
- Type, `terraform init -backend-config="path=path/to/StateData/InRemote/Key"`(As configured in main.tf in **consul keys**)
  - Example: `terraform init -backend-config="path=DevOps/state/TestData"` 
