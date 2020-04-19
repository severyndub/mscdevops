# mscdevops
mscdevops ent arch ca1

# ansible manual commands



sudo ansible-playbook ansible/setupinfra.yaml --ask-vault-pass --inventory ansible/inventories/mscdevops/mscdevops_inventory.yaml --extra-vars "host_key_checking=False env=mscdevops location=westeurope ssh_port=22" --tags "createrg"

sudo ansible-playbook ansible/setupinfra.yaml --inventory ansible/inventories/mscdevops/mscdevops_inventory.yaml --extra-vars "host_key_checking=False env=mscdevops location=westeurope ssh_port=22" --vault-password-file /var/lib/jenkins/secrets/ansible_vault  --tags "createrg"

sudo ansible-playbook ansible/setupinfra.yaml --inventory ansible/inventories/mscdevops/mscdevops_inventory.yaml --extra-vars "host_key_checking=False env=mscdevops location=westeurope ssh_port=22" --vault-password-file /var/lib/jenkins/secrets/ansible_vault -e 'ansible_python_interpreter=/usr/bin/python3' --tags 'createrg'

pip3 install {module_name}

ansible-playbook ansible/nsgautomation/updateSecurityRules.yaml --extra-vars "env=mscdevops" --vault-password-file /var/lib/jenkins/secrets/ansible_vault -e 'ansible_python_interpreter=/usr/bin/python3'


ad_user,append_tags,cli_default_profile,client_id,cloud_environment,default_rules,location,name,password,profile,purge_default_rules,purge_rules,resource_group,rules,secret,state,subscription_id,tags,tenant


kubectl create secret docker-registry myseckey --docker-server mcsdevopsentarch.azurecr.io --docker-email sverynwaw@outlook.com --docker-username ce69d460-b0b6-4ec7-9f64-92ab0479d5bc --docker-password P1CW@H5pAb.PfRVkVQKqbt6-oW-Avsx0
