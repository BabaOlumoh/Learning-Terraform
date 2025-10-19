
#Declaring a resource has three types

#1. Resource Block: 
#2. Resource Type: terraform actually creates
#3. Object Reference: name of the resource inside the config




resource "random_string" "suffix"{
    length = 6 
    upper = false
    special = false
}

#Locals
locals {
  environment_prefix = "${var.application_name}-${var.environment_name}-${random_string.suffix.result}"
}

/*
Workspace
Terraform workspace list
Terraform workspace select deafult
Terraform workspace new dev

*/

#Iteration

/*
resource "random_string" "list"{

    count = length((var.regions))

    length = 6 
    upper = false
    special = false
}
*/

/*
resource "random_string" "map"{

    for_each = var.region_instance_count

    length = 6 
    upper = false
    special = false
}


resource "random_string" "if"{

    count = var.enabled ? 1 : 0 #if enabled is true, provision 2 resources, if otherwise, provision 0 resources


    length = 6 
    upper = false
    special = false
}
*/
#Modules
#public/registry modules
/*
module "alpha" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}

module "bravo" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}


#child module
module "charlie" {
  source = "./modules/rando"
  length = 8
}

*/

module "regionA" {
  source = "./modules/regional-stamp"

  region = "westus"
  name = "foo"
  min_node_count = 4
  max_node_count = 8
}

module "regionB" {
  source = "./modules/regional-stamp"

  region = "eastus"
  name = "bar"
  min_node_count = 4
  max_node_count = 8
}