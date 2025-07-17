module "ec2" {
  source = "./modules/ec2"
 subnet_id         = module.vpc.public_subnet_id
  security_group_id = aws_security_group.allow_ssh.id
  key_name          = aws_key_pair.mykeypair.key_name 

}

module "s3" {
  source = "./modules/s3"
}

module "vpc" {
source ="./modules/vpc"
  
}

resource "aws_key_pair" "mykeypair"{
key_name="mykeypair"
public_key=file("keys/mykeypair.pub")
}
resource "aws_security_group" "allow_ssh" {
  vpc_id = module.vpc.vpc_id
  name   = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

module "iam_user" {
  source    = "./modules/IAM"
  
}
module "custom_policy" {
  source      = "./modules/policy"
 
}

