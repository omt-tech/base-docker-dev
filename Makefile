include config.mk

DESTINATION=${REPO}/${IMAGE}

all: opt build push git

opt:
	@echo "build options:"
	@echo "  REPO    = ${REPO}"
	@echo "  IMAGE   = ${IMAGE}"
	@echo "  VERSION = ${VERSION}"

build:
	docker build -t ${DESTINATION}:latest .

push:
	docker tag ${DESTINATION}:latest ${DESTINATION}:${VERSION}
	docker push ${DESTINATION}:latest
	docker push ${DESTINATION}:${VERSION}

git:
	git add -A
	git commit -m "Docker image version ${DESTINATION}:${VERSION}"
	git tag ${VERSION}
	git push
	git push origin ${VERSION}
