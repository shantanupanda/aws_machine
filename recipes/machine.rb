require 'chef/provisioning/aws_driver'

aws = JSON.parse(File.read("/home/anshulp/hosted_chef/cookbooks/aws_machine/docs/mach.json"))

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

machine_batch do
  aws['machine'].each do |machine|
		machine "#{machine['name']}" do
			recipe "aws_machine::vim"
		end
end
end

end
