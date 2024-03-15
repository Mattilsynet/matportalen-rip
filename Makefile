VERSION = $$(git rev-parse --short=10 HEAD)
IMAGE = europe-north1-docker.pkg.dev/artifacts-352708/mat/matportalen:$(VERSION)

docker:
	docker build -t $(IMAGE) .

publish:
	docker push $(IMAGE)

.PHONY: docker publish
