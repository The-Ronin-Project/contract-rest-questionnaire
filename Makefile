DOCKER_IMAGE=docker-repo.devops.projectronin.io/ronin-contract-rest-tooling:v1

INCREMENT=patch
SNAPSHOT=false

test:
	docker run -it -v "$$PWD:/app" $(DOCKER_IMAGE) contract-tools test

doc:
	docker run -it -v "$$PWD:/app" $(DOCKER_IMAGE) contract-tools doc

incrementVersions:
	docker run -it -v "$$PWD:/app" --env INCREMENT=$(INCREMENT) --env SNAPSHOT=$(SNAPSHOT) $(DOCKER_IMAGE) contract-tools incrementVersions

compile:
	docker run -it -v "$$PWD:/app" $(DOCKER_IMAGE) contract-tools compile

publishToMavenLocal:
	docker run -it -v "$$PWD:/app" -v "$$HOME/.m2/repository:/home/ronin/host-repository" $(DOCKER_IMAGE) contract-tools publishToMavenLocal

clean:
	docker run -it -v "$$PWD:/app" $(DOCKER_IMAGE) contract-tools clean
