#Executar a stack Casepro+Redis+Celery+PostgreSQL - k8 na AWS através do terraform
#O ambiente irá configurar o AWS EKS usando EC2 free-tier na região US-EAST-1 utilizando todas as AZs disponíveis desta.
#Irá criar uma rede privada e uma pública para cada AZ.

#Autenticar na AWS
$ aws configure

#Com o terraform instalado, configurar o ambiente:
$ terraform init
$ terraform apply 

#Configurar o ambiente local para o cluster criado:
aws eks --region us-east-1 update-kubeconfig --name devops-test-eks-RN46c9wj
terraform output

#Após configurado o cluster k8, implantar a stack:

$ kubectl apply -f ../k8/postgres-deployment.yaml
$ kubectl apply -f ../k8/postgres-service.yaml
$ kubectl apply -f ../k8/redis-deployment.yaml
$ kubectl apply -f ../k8/redis-service.yaml
$ kubectl apply -f ../k8/casepro-deployment.yaml
$ kubectl apply -f ../k8/casepro-service.yaml
$ kubectl apply -f ../k8/celery1-deployment.yaml
$ kubectl apply -f ../k8/celery2-deployment.yaml

#Para acessar a interface web do casepro:
$ http://IP_Publico_AWS

#Para destruir a stack na AWS:
$ terraform destroy
