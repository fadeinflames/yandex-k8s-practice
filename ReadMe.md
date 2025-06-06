helm dependency build          
helm install my-ghost .  

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
kubectl apply -f issuer.yaml
