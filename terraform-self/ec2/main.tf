resource "aws_instance" "example" {
  ami           = "ami-02f07d901fce78cbb" # Replace with your desired AMI ID
  instance_type = "t2.micro"     # Replace with your desired instance type
  key_name      = "jenkins_key" # Replace with your key pair name

  tags = {
    Name = "terraform-instance"
  }
    security_groups = [aws_security_group.instance_sg.name]
}

resource "aws_ebs_volume" "example_volume" {
  availability_zone = aws_instance.example.availability_zone
  size              = 20 # Size of the volume in GB
}

resource "aws_volume_attachment" "example_attachment" {
  device_name = "/dev/sdh" # Change to your desired device name
  volume_id   = aws_ebs_volume.example_volume.id
  instance_id = aws_instance.example.id
}

resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Security group for the example instance"

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
}