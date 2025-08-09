
variable "instance_name" { type = string }
variable "instance_type" { type = string }
variable "ami" { type = string }
variable "key_name" { type = string }
variable "subnet_id" { type = string }
variable "tags" {
  type = map(string)
  default = {}
}
