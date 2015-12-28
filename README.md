# aws_machine

This recipe is used to setup cluster and stack machines.

There are two main recipes

1. machine_cluster : Apply the same set of configuration on bunch of machines.
2. machine_stack   : Apply different set of configuration on different machines.

The configuration is given in the json file.

Following is the sample configuration for stack.
```
{
  "region": "us-west-2",
  "machine" : [
    {
      "name" : "machinestack1",
      "recipe" : "aws_machine::vim",
      "ssh_username" : "ec2-user",
      "key_name" : "anshul_aws",
      "instance_type" : "t2.micro",
      "public_ip" : "true",
      "image_id" : "ami-775e4f16",
      "security_group_ids" : "sg-1c650079",
      "subnet_id" :"subnet-1928cd40",
      "recipe" : "lamp_chef::apache2"
    },

    {
      "name" : "machinestack2",
      "recipe" : "aws_machine::vim",
      "ssh_username" : "ec2-user",
      "key_name" : "anshul_aws",
      "instance_type" : "t2.micro",
      "public_ip" : "true",
      "image_id" : "ami-775e4f16",
      "security_group_ids" : "sg-1c650079",
      "subnet_id" :"subnet-1928cd40",
      "recipe" : "lamp_chef::apache2"
    }
    ]
 }
```


## Usage

####  Chef Zero

```
chef-client -z -o aws_machine
```

#### Chef Server

```
CHEF_DRIVER=aws chef-client -r "recipe["aws_machine"]"
```


## Pre-requisite

* chef-provisioning-aws should be installed on the provisioning machine.

```
gem install chef-provisioning-aws
```

* Following parameters should be present in the client.rb / knife.rb

```
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "<node_name>"
client_key               "#{current_dir}/<username>.pem"
validation_client_name   "<orgname>-validator"
validation_key           "#{current_dir}/<orgname>-validator.pem"
chef_server_url          "https://api.chef.io/organizations/deathstartatooine"
cookbook_path            ["#{current_dir}/../cookbooks"]
private_keys  '<key>' => '<key_location>'
```
3. Export the AWS credentials in the environment.

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```
