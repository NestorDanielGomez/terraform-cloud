variable "virgina_cdir" {
  description = "CIDR VIRGINIA"
  type        = string
}
# variable "public-subnet" {
#   description = "CDIR Public Subnet"
#   type        = string
# }

# variable "private-subnet" {
#   description = "CDIR Private Subnet"
#   type        = string
# }

variable "subnets" {
  description = "Lista de Subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "Cidr for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = bool
}
variable "ingress_ports_list" {
  description = "Lista de puertos de ingreso"
  type        = list(number)

}

variable "access_key" {
  
}

variable "secret_key" {
  
}