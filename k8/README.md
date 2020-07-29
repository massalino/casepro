#Executar a stack Casepro + Redis + Celery + PostgreSQL no k8
#Após o cluster k8 estar configurado:

$ kubectl apply -f postgres-deployment.yaml
$ kubectl apply -f postgres-service.yaml
$ kubectl apply -f redis-deployment.yaml
$ kubectl apply -f redis-service.yaml
$ kubectl apply -f casepro-deployment.yaml
$ kubectl apply -f casepro-service.yaml
$ kubectl apply -f celery1-deployment.yaml
$ kubectl apply -f celery2-deployment.yaml

#Para obter o endereço IP da interface web do casepro:
$ minikube service casepro --url.
