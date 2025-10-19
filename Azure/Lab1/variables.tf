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
}

variable "enabled" {
  type = bool
}

#Collection Objects

variable "regions" {
  type = list(string)
}

variable "region_instance_count" {
  type = map(string)
}

variable "region_set" {
  type = set(string)
}

variable "sku_settings" {
  type = object({
    kind = string
    tier = string
  })
}