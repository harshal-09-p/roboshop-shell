# roboshop-shell

# Public IP Address creaion Dynamic usign Azure CLI
az network public-ip create -g devops_project_ecom -n DynamicPublicIP --version IPv4 --sku Basic --allocation-method Dynamic