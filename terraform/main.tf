data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "Ubuntu"
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = ["acesso_geral"]
  user_data       = file("terraformando.sh")  
  tags = {
    Name          = "${var.environment}: App"
    Env           = var.environment
    Type          = var.instance_type
  }
}