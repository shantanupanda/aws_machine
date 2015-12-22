require 'chef/provisioning/aws_driver'

aws = JSON.parse(File.read("/home/anshulp/hosted_chef/cookbooks/aws_machine/docs/mach_stack.json"))

with_driver "aws::#{aws['region']}"


machine_batch  do
  aws['machine'].each do |machine|
    machine "#{machine['name']}" do
      machine_options bootstrap_options:
          {
            :key_name => "#{machine['key_name']}",
            :instance_type => "#{machine['instance_type']}",
            :associate_public_ip_address => "#{machine['public_ip']}",
            :image_id => "#{machine['image_id']}",
            :security_group_ids => "#{machine['security_group_ids']}",
            :subnet_id => "#{machine['subnet_id']}"
          },
          :ssh_username => "#{machine['ssh_username']}"
    end

end
end
