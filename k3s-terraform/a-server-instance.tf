resource "aws_instance" "agent" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.a_inst_type
  count = var.a_num_servers
  iam_instance_profile = aws_iam_instance_profile.k3s.name
  key_name = var.k3s_key_pair
  vpc_security_group_ids = concat([aws_security_group.agent.id], var.a_additional_sg)

  user_data = base64encode(templatefile("${path.module}/a-userdata.tmpl", { 
    host = aws_instance.master[0].private_ip, 
    token = random_password.k3s_cluster_secret.result
  }))

  depends_on = [ aws_instance.master ]

  tags = {
    Name = "worker-node"
  }
}

