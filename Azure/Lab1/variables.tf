#Input variable types
#Primitive:
#1. string: "This is a string"
#2. number(int/float): 1234 
#3. Boolean: true/false

#Collection Object:
#1. List: list["string", 1234, "string"]
#2. Map(Dictionary): map{key=value}
#3. Set(a set is an unordered and unique list) set["string", 1234]

#Primitives
variable "application_name" {
  type = string

  validation {
    condition = length(var.application_name) <= 12
    error_message = "Application name must be less than or equal to 12 characters"
  }
}

variable "environment_name" {
  type = string
}

variable "api_key" {
    type = string
    sensitive = true
}

variable "instance_count" {
  type = number

  validation {
    condition = var.instance_count >= local.min_nodes && var.instance_count <= local.max_nodes && var.instance_count % 2 !=0
    error_message = "Must be between 5 and 9 and an odd number"
  }
}

variable "enabled" {
  type = bool
}

#Collection Objects

#List: list["string", 1234, "string"]
variable "regions" {
  type = list(string)
}

#Map(Dictionary): map{key=value}
variable "region_instance_count" {
  type = map(string)
}

#Set(a set is an unordered and unique list) set["string", 1234]
variable "region_set" {
  type = set(string)
}

#Complex Object
variable "sku_settings" {
  type = object({
    kind = string
    tier = string
  })
}