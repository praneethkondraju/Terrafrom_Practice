# INSTANCES #

resource "aws_instance" "nginx" {
  count         = var.instance_count
  ami           = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type = var.aws_instance
  key_name      = "OnlineEyeClinic"

  # '%' is used here because, it helps to assign the instances to subnets evenly
  subnet_id              = aws_subnet.subnets[(count.index % var.vpc_subnet_count)].id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id, aws_security_group.ssh_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on = [
    aws_iam_role_policy.allow_s3_all
  ]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("OnlineEyeClinic")
    timeout     = "4m"
  }

  #templatefile is function of terraform, it takes path to a file and map of variables and values
  # to use in the template, as arguments
  #'${path.module}' is a special variable used to start off path to startup scripts
  user_data = templatefile("${path.module}/startup.tpl", {
    s3_bucket_name = aws_s3_bucket.web_bucket.id
  })
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-nginx-${count.index}"
  })

}
