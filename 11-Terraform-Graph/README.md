# Introduction to GraphViz Utility with Ubuntu Apache2. 

## Install Apache2 & GraphViz Packages 
```
apt-get update 
apt-get install apache2 graphviz -y 
```

## Go to the Resource Dir & Generate Terraform Graph.
```
terraform graph > graph.dot
```

## Covert the DOT into SVG Formate
```
dot graph.dot -Tsvg -o graph.svg
```

## Setup the Apache2 Hostsing for GraphViz Images 
```
mkdir -p /var/www/html/Terraform-Images/
cp -rf graph.svg /var/www/html/Terraform-Images/01-Graph.svg

systemctl restart apache2.service 
```

## Now explore the images in your web browser. http://apacheInstnaceIP/Terraform-Images/01-Graph.svg


# Or 

# You can use online graphviz tool : https://dreampuf.github.io
