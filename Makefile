all: README.md index.html

clean:
	rm README.md index.html

README.md: intro.md deploy_app/index.md deploy_k8s/index.md deploy_lb/index.md deploy_hpa/index.md
	pandoc --wrap=none \
		-i intro.md \
		deploy_app/index.md \
		deploy_k8s/index.md \
		deploy_lb/index.md \
		deploy_hpa/index.md \
		-o README.md  

index.html: README.md
	pandoc -s -t html5 --metadata title="Deploying machine learning models to Kubernetes" -o index.html README.md -c pandoc.css

