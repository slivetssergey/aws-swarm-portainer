# Common

variable "region" {
  description = "Target region"
  type        = string
  default     = "eu-central-1"
}

variable "profile" {
  description = "Local AWS credentials profile"
  type        = string
  default     = "own"
}


# App base settings

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "key_path" {
  description = "SSH public key path"
  default     = "swarm.pem"
}

variable "key_name" {
  description = "Name of key"
  default     = "swarm"
}
