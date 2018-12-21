Following https://docs.cloud.oracle.com/iaas/Content/API/SDKDocs/ansiblegetstarted.htm and https://oracle-cloud-infrastructure-ansible-modules.readthedocs.io/en/latest/index.html

Added oci-ansible-modules as GIT submodule per https://git-scm.com/book/en/v2/Git-Tools-Submodules
```
git submodule add https://github.com/oracle/oci-ansible-modules
```

Create custom image to use:

```
cd packer && packer build ubuntu.json
```

Need to specifyt `ailability_domain`, `compartment_ocid` and `subnet_ocid` environment variables.  Once image is created put the ID in `vars.tf` under `image_source_id`.  

Launch infrastructure:

```
cd terraform && terraform apply
```

Rebuild infrastructure

```
terraform destroy -auto-approve && terraform apply -auto-approve
```

Provision infrastructure from local machine by running specific playbook

```
cd ansible
ansible-playbook -i oci_inventory.py -e 'ansible_python_interpreter=/usr/bin/python3' playbooks/dynamic/tasks/env_prod.yml
```

Provision Ansible control server that will manage infrastructure:

```
cd ansible
ansible-playbook -i oci_inventory.py playbooks/dynamic/tasks/ansible_control.yml
```