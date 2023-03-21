```
117  cp -rf 01-First-Deployment 02-Terraform-CLI
  118  ls
  119  cd 02-Terraform-CLI/
  120  ls
  121  rm -rf README.md terraform.tfstate* 
  122  ls
  123  vim main.tf 
  124  ls
  125  terraform init 
  126  terraform plan 
  127  terraform apply 
  128  terraform plan -out build-plan 
  129  ls
  130  file build-plan 
  131  cat build-plan 
  132  terraform show build-plan 
  133  terraform apply build-plan 
  134  terraform apply
  135  terraform show
  136  terraform refresh
  137  terraform show
  138  cat main.tf 
  139  terraform apply
  140  ls
  141  terraform validate
  142  vim main.tf 
  143  terraform apply
  144  vim main.tf 
  145  terraform apply
  146  terraform plan -destroy -out destroy-plan
  147  terraform apply "destroy-plan"
  148  ls
  149  vim main.tf 
  150  terraform fmt
  151  vim main.tf 
  152  ls
  153  terraform apply --auto-approve 
  154  ls
  155  vim main.tf 
  156  terraform apply 
  157  ls
  158  vim main.tf 
  159  terraform apply 
  160  ls
  161  terraform show
  162  vim main.tf 
  163  terraform apply 
```
