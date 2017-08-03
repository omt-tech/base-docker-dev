include config.mk

DESTINATION=${REPO}/${IMAGE}

all: opt build push git
main: opt build-main push-main git-main
ci: opt build-ci push-ci git-ci

opt:
	@echo "build options:"
	@echo "  REPO    = ${REPO}"
	@echo "  IMAGE   = ${IMAGE}"
	@echo "  VERSION = ${VERSION}"

build: build-main build-ci

build-main:
	docker build -t ${DESTINATION}:latest main

build-ci:
	docker build -t ${DESTINATION}:ci-${VERSION} ci

push: push-main push-ci

push-main:
	docker tag ${DESTINATION}:latest ${DESTINATION}:${VERSION}
	docker push ${DESTINATION}:latest
	docker push ${DESTINATION}:${VERSION}

push-ci:
	docker push ${DESTINATION}:ci-${VERSION}

git: git-main git-ci

git-main:
	git add -A main
	git commit -m "Docker image version ${DESTINATION}:${VERSION}"
	git tag ${VERSION}
	git push
	git push origin ${VERSION}

git-ci:
	git add -A ci
	git commit -m "Docker image version ${DESTINATION}:ci-${VERSION}"
	git tag ci-${VERSION}
	git push
	git push origin ci-${VERSION}
