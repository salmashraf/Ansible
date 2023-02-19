resource "aws_instance" "jump-host" {
 ami           = "ami-0557a15b87f6559cf"
 instance_type = "t2.micro"
 associate_public_ip_address = true
 subnet_id = aws_subnet.pub-subnet-1.id
 vpc_security_group_ids = [aws_security_group.pub-secgroup.id]
 key_name = "ansible-key"

 tags = {
    Name = "Jump-Host"
  }

}

resource "aws_instance" "private-ec2-1" {
 ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.medium"
  associate_public_ip_address = false
  subnet_id = aws_subnet.private-sub-1.id
  vpc_security_group_ids = [aws_security_group.pub-secgroup.id]
  key_name = "ansible-key"
  tags = {
    Name = "Nexus-server"
  }
  

}

resource "aws_instance" "private-ec2-2" {
 ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.medium"
  associate_public_ip_address = false
  subnet_id = aws_subnet.private-sub-2.id
  vpc_security_group_ids = [aws_security_group.pub-secgroup.id]
  key_name = "ansible-key"
  tags = {
    Name = "Sonarcube-server"
  }
  
}