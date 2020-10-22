IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

deploy-mesos-git:
	bash scripts/deploy-mesos-git.sh

deploy-mesos:
	bash scripts/deploy-mesos.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-mesos-git deploy-mesos
