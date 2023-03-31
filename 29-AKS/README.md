```
  520  kubectl get nodes 
  521  kubectl get nodes --kubeconfig=kubeconfig 
  522  kubectl get pod  --kubeconfig=kubeconfig 
  523  kubectl run hello-k8s --image=nginx --port=80  --kubeconfig=kubeconfig 
  524  kubectl get pod  --kubeconfig=kubeconfig 
  525  mv kubeconfig ~/.kube/config
  526  kubectl get pod  
  527  kubectl get svc 
  528  kubectl expose pod hello-k8s --type=LoadBalancer
  529  kubectl get svc 
  530  watch -n .5 kubectl get svc 
  531  kubectl get svc 
  532  kubectl delete svc hello-k8s
  533  kubectl  get pods 
  534  kubectl delete pods hello-k8s
  535  ls
  536  kubectl  get pods 
```
