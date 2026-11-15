#generating key-pairs
#it generates the key pairs like in aws manually we genarated pem file

resource "aws_key_pair" "ec2-key" {
  key_name   = "${var.env}-ec2-key"
  public_key = file("${path.module}/terra-ec2-key.pub")

  tags={
    Environment = var.env
  }
}

#vpc security group
resource "aws_default_vpc" "default" {
  
}

#security groups

resource "aws_security_group" "security-group" {
  name        = "${var.env}-infra-app-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id
  
  #inbound rules
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allows ssh inboud traffic"
  }

  #outbound rule
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
    Environment = var.env
  }
}

#ec2 instance

resource "aws_instance" "ec2-instance" {
    count = var.instance_count 
    key_name = aws_key_pair.ec2-key.key_name
    security_groups = [aws_security_group.security-group.name]
    instance_type = var.instance_type
    ami = var.ami_id

    root_block_device {
        volume_size = var.env == "prod" ? 15 : 10
        volume_type = "gp2"
    }

    tags = {
        name = "${var.env}-${var.instance_name}"
        Environment = var.env
    }
}