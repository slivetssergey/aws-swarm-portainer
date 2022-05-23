output "manager_public_ip" {
  value = ["${aws_instance.manager.public_ip}"]
}

output "workers_public_ip" {
  value = ["${aws_instance.worker.*.public_ip}"]
}

# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      manager_ip = aws_instance.manager.public_ip
      worker_ips = aws_instance.worker.*.public_ip
      key_path   = var.key_path
    }
  )
  filename = "./inventory/hosts.cfg"
}