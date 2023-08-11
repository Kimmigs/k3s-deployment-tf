#
# Variables Configuration
#

variable "prefix" {
  description = "Prefix for deploy for aws resources`."
  default = "Nioyatech"
}

variable "m_inst_type" {
  description = "Master server instance type."
  default     = "t3a.medium"
}

variable "m_num_servers" {
  description = "Number of master server instances to deploy"
  default = "1"
}

variable "m_server_disk_size" {
  description = "Size of master server root device in Gb."
  default = "16"
}

variable "m_additional_sg" {
  description = "Additional sg's to attach to the master servers."
  default     = []
  type        = list(string)
}

variable "vpc_id" {
  description = "Id of vpc to deploy stack into."
  default     = "vpc-0265708c176f43adb"
}

variable "a_inst_type" {
  description = "Agent/worker server instance type."
  default     = "t3a.micro"
}

variable "a_num_servers" {
  description = "Number of agent/worker server instances to deploy."
  default = "1"
}

variable "a_server_disk_size" {
  description = "Size of agent server root device in Gb."
  default = "16"
}

variable "a_additional_sg" {
  description = "Additional sg's to attach to the agent servers."
  default     = []
  type        = list(string)
}

variable "kubeconfig_on_console" {
  description = "Whether kubeconfig should be sent to master0 console."
  default = false
  type = bool
}

variable "kubeconfig_ssm" {
  description = "Whether kubeconfig should be stored as ssm parameter."
  default = true
  type = bool
}

# Allowing access from everything is probably not secure; so please override this to your requirement.
variable "api_ingress_cidrs" {
  description = "External ips allowed access to k3s api."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "https_ingress_cidrs" {
  description = "External ips allowed access to k3s the ingress controller on http/https."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

# Allowing k3s cluster access from everything is probably not secure; so please override this to your requirement.
variable "k3s_ssh_ingress_cidrs" {
  description = "External ips allowed access to all k3s servers via ssh."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "k3s_key_pair" {
  description = "aws key pair to access all k3s servers."
  default = "key_pair"
  
}





