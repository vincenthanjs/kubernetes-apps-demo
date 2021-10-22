docker login
kubectl create secret generic regcred \
--from-file=.dockerconfigjson=/root/.docker/config.json \
--type=kubernetes.io/dockerconfigjson
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "regcred"}]}'
