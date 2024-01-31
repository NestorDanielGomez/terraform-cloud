resource "aws_vpc" "vpc-virginia" {
  cidr_block = var.virgina_cdir
  tags = {
    "Name" = "vpc-virginia-${local.sufix}"
  }
  # tags = {
  #   Name = "VPC_VIRGINIA"
  #   name = "prueb"
  #   env  = "dev"
  # }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc-virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "public-subnet-${local.sufix}"
  }
  #  tags = {
  #   Name = "public-subnet"
  #   name = "prueba publica"
  #   env  = "dev"
  # }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.vpc-virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private-subnet-${local.sufix}"
  }
  #  tags = {
  #   Name = "private-subnet"
  #   name = "prueba privada"
  #   env  = "dev"
  # }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-virginia.id

  tags = {
    Name = "igw (Internet Gateway) VPC Virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc-virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public crt(custom route table)-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_crt.id
}


resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound traffic and all egress traffic"
  vpc_id      = aws_vpc.vpc-virginia.id

  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}

