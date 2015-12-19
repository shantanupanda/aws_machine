require 'chef/provisioning/aws_driver'

with_driver 'aws::us-west-2'


machine 'rhel-test5' do
	recipe 'aws_machine::vim'
	machine_options :bootstrap_options => {
	:key_name => 'anshul_aws',
	:instance_type => 't2.micro',
	:associate_public_ip_address => true,
	:image_id => 'ami-775e4f16',
	:security_group_ids => 'sg-05a08f61',
	:subnet_id => 'subnet-1928cd40'
},
	:ssh_username => 'ec2-user'
end
