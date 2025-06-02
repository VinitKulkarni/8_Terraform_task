//instance id
output "instance_id" {
  value = aws_instance.create_vm.id
}

//instance public ip
output "instance_publicip" {
  value = aws_instance.create_vm.public_ip
}

//security group attached
output "instance_securitygroup" {
  value = aws_security_group.FromTerraformInstance_SG.name
}

//key-pair attached
output "instance_keypair" {
  value = aws_key_pair.vinitkey.key_name
}
