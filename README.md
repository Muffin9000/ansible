# ansible

## ad-hoc Ansible commands

## LINUX PING
```
ansible all -i 54.226.92.50, -m ping -e "ansible_user=ansible nsible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_password=MY_PASS"
```

## WINDOWS PING
```
ansible all -i 44.205.221.219, -m win_ping -e "ansible_user=ansible ansible_password=MY_PASS ansible_winrm_server_cert_validation=ignore ansible_connection=winrm"
```
