require 'chef/provisioning/aws_driver'

with_driver node[:aws_machine][:region]


machine node[:aws_machine][:machine_name] do
	recipe 'aws_machine::vim'
	machine_options :bootstrap_options => {
	:key_name => node[:aws_machine][:key_name],
	:instance_type => node[:aws_machine][:instance_type],
	:associate_public_ip_address => node[:aws_machine][:public_ip],
	:image_id => node[:aws_machine][:image_id],
	:security_group_ids => node[:aws_machine][:security_group_ids],
	:subnet_id => node[:aws_machine][:subnet_id]
},
	:ssh_username => node[:aws_machine][:ssh_username]
end
