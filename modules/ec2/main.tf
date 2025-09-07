resource "aws_instance" "my-ec2"{
ami="ami-00ca32bbc84273381"
instance_type="t3.micro"
tags={
Name="my-ec2"}


  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
}



