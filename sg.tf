resource "aws_security_group" "allow_all" {

  name        = "${var.vpc_name}-allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id
  dynamic "ingress" {
    for_each = var.ingress_value

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
