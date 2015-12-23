current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "anshulpatel25"
client_key               "#{current_dir}/<client>.pem"
validation_client_name   "akhada-validator"
validation_key           "#{current_dir}/<validator>.pem"
chef_server_url          "https://api.chef.io/organizations/<org_name>"
cookbook_path            ["#{current_dir}/../cookbooks"]
private_keys  'anshul_aws' => '/home/anshulp/akhada/amazon_keys/<p_key_amazon>.pem'


