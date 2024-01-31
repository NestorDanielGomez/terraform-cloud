virgina_cdir = "10.10.0.0/16"
# public-subnet  = "10.10.0.0/24"
# private-subnet = "10.10.1.0/24"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"         = "dev"
  "owner"       = "Nestor"
  "cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_Version" = "v1.7.1"
  "project"     = "Cerberus"
  "region"      = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"
ec2_specs = {
  "ami"           = "ami-0a3c3a20c09d6f377"
  "instance_type" = "t2.micro"
}
enable_monitoring = true

ingress_ports_list = [22, 80, 443]