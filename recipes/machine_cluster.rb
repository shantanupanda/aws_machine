require 'chef/provisioning/aws_driver'

aws = JSON.parse(File.read("/home/anshulp/hosted_chef/cookbooks/aws_machine/docs/mach_cluster.json"))

with_driver "aws::#{aws['region']}"do


with_machine_options :ssh_username => "#{aws['ssh_username']}",
	:bootstrap_options => {
		:key_name => "#{aws['key_name']}",
		:instance_type => "#{aws['instance_type']}",
		:associate_public_ip_address => "#{aws['public_ip']}",
		:image_id => "#{aws['image_id']}",
		:security_group_ids => "#{aws['security_group_ids']}",
		:subnet_id => "#{aws['subnet_id']}"
	}


#Cluster Creation
machine_batch  do
	1.upto(aws['count']) do |count|
		machine "#{aws['machine']['name']}_#{count}"do
			recipe "#{aws['machine']['recipe']}"
		end
	end
end
end
