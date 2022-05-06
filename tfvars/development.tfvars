####################################################################
# Common central variable
####################################################################

aws_region = "eu-central-1"

environment = "dev"

domain = "smallcase"

#####################################################################
# b2b api variables
#####################################################################

api_gateway_stage_configuration = {
  "cache_enabled" : false,
  "cache_cluster_size" : 0.5,
  "cache_encrypted" : false,
  "cache_ttl_in_seconds" : 120,
  "xray_tracing_enabled" : true,
  "metrics_enabled" : true,
  "logging_level" : "INFO",
  "data_trace_enabled" : true
}

#####################################################################
# b2b ecs variables
#####################################################################

container_cpu = 256

container_memory = 512

#####################################################################
# vpc variables
#####################################################################

cidr = "172.22.0.0/16"

public_subnet_cidr = ["172.22.1.0/24", "172.22.2.0/24"]

private_subnet_cidr = ["172.22.11.0/24", "172.22.12.0/24"]

database_subnet_cidr = ["172.22.21.0/24", "172.22.22.0/24"]