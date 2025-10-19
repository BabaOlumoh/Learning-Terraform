#Terraform input variable selection rank
#1. default values in variable block i.e variables.tf
#2. Environment variable i.e TF_VAR_name.tf
#3. values in Terraform variable files i.e *.tfvars then *.auto.tfvars
#4. files parsed via command line values i.e -var-file
#5. values parsed in the on the commmand line i.e -var 

