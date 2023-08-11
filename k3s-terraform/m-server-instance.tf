resource "aws_instance" "master" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.m_inst_type
  count = var.m_num_servers
  iam_instance_profile = aws_iam_instance_profile.k3s.name
  key_name = var.k3s_key_pair
  vpc_security_group_ids = concat([aws_security_group.master.id], var.m_additional_sg)

   tags = {
    Name = "master-node"
  }
  

  user_data = templatefile("${path.module}/m-userdata.tmpl", { 
    inst-id = count.index,
    kubeconfig-console = var.kubeconfig_on_console,
    kubeconfig-ssm = var.kubeconfig_ssm,
    prefix = var.prefix,
    token = random_password.k3s_cluster_secret.result
  })
}
