```
465  cd 23-WorkSpace/
  466  ls
  467  cd Local/
  468  ls
  469  cd After/
  470  ls
  471  cp -rf ../Before/* .
  472  ls
  473  rm -rf terraform.tfstate* 
  474  ls
  475  terraform init 
  476  terraform workspace list 
  477  terraform destroy --auto-approve 
  478  terraform apply --auto-approve 
  479  terraform show 
  480  ls
  481  terraform apply -var-file=uat.tfvars
  482  terraform terraform.tf
  483  terraform workspace new uat
  484  ls
  485  terraform workspace list
  486  terraform apply -var-file=uat.tfvars
  487  terraform workspace new prod
  488  terraform workspace list
  489  terraform apply -var-file=prod.tfvars
  490  ls -ltr 
  491  cd terraform.tfstate.d/
  492  ls
  493  cd uat/
  494  ls
  495  cat terraform.tfstate 
  496  cd ..
  497  ls
  498  cd prod/
  499  ls
  500  cat terraform.tfstate 
  501  ls
  502  cd terraform-wip-20-March-2023/
  503  ls
  504  cd 23-WorkSpace/
  505  ls
  506  cd Local/After/
  507  ls
  508  terraform workspace list 
  509  ls
  510  cd ..
  511  ls
  512  cd After/
  513  ls
  514  terraform workspace list 
  515  terraform destroy --auto-approve 
  516  terraform workspace select uat 
  517  terraform workspace list 
  518  ls
  519  cd ..
  520  ls
  521  cd ..
  522  ls
  523  cd Remote/
  524  ls
  525  terraform destroy --auto-approve 
  526  cp -rf ../Local/After/* . 
  527  ls
  528  rm -rf terraform.tf* 
  529  ls
  530  cp -rf ../../22-Backend-and-RemoteState/Remote/terraform.tf . 
  531  ls
  532  vim terraform.tf 
  533  ls
  534  rm 1
  535  cat terraform.tf 
  536  ls
  537  terraform init 
  538  terraform workspace 
  539  terraform workspace list 
  540  terraform apply --auto-approve 
  541  ls
  542  vim resource.tf 
  543  terraform apply --auto-approve 
  544  terraform workspace list 
  545  terraform workspace new uat
  546  ls
  547  terraform apply -var-file=uat.tfvars --auto-approve 
  548  terraform workspace new prod
  549  terraform apply -var-file=prod.tfvars --auto-approve 
  550  ls
  551  cd ..
  552  ls
  553  history 
  554  ls
  555  cd Local/
  556  ls
  557  cd After/
  558  terraform workspace 
  559  terraform workspace list 
  560  terraform workspace delete prod
  561  terraform workspace select default
  562  terraform workspace delete uat
  563  terraform workspace list 
  564  ls
  565  cd ..
  566  ls
  567  cd ..
  568  ls
  569  cd Remote/
  570  ls
  571  mkdir exp1 
  572  ls
  573  mv * exp1/
  574  ls
  575  cp -rf exp2
  576  cp -rf exp1 exp2
  577  ls
  578  cd exp2
  579  ls
  580  vim resource.tf 
  581  ls
  582  vim variable.tf 
  583  ls
  584  terraform workspace list 
  585  terraform init 
  586  ls
  587  terraform workspace list 
  588  terraform apply  --auto-approve 
  589  terraform workspace list 
  590  terraform workspace select prod 
  591  terraform apply  --var-file=prod.tfvars --auto-approve 
  592  l
  593  ls
  594  cat resource.tf 
  595  cat variable.tf 
  596  terraform workspace list 
  597  terraform workspace new amit
  598  terraform apply  --var-file=prod.tfvars --auto-approve 
```
