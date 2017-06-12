@echo off

echo installing etcd operator
kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/deployment.yaml
kubectl  rollout status -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/deployment.yaml

:l1
kubectl  get thirdpartyresource cluster.etcd.coreos.com
if errorlevel 1 (
    echo waiting for operator
    sleep 2
	goto l1
)

echo pausing for 10 seconds for operator to settle
sleep 10

kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster.yaml

echo installing etcd cluster service
kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster-nodeport-service.json

echo waiting for etcd cluster to turnup
:l2
kubectl  get pod example-etcd-cluster-0002
if errorlevel 1 (
    echo waiting for operator
    sleep 2
	goto l2
)

echo Finished