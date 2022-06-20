# Consul Configuration

ui = true #true will enable UI to interact with consul
server = true
bootstrap_expect = 1 #To declare nodes in consul cluster
datacenter = "MyData_IN" #Name of your data center
data_dir = "./data" #Path to store data

acl = {
    enabled = true
    default_policy = "deny"
    enable_token_persistence = true
}
