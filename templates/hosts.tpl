[manager]
${manager_ip} ansible_user=ec2-user ansible_private_key_file=${key_path}

[workers]
%{ for ip in worker_ips ~}
${ip} ansible_user=ec2-user ansible_private_key_file=${key_path}
%{ endfor ~}