install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
lint:
	pylint --disable=R,C *.py devopslib

test:
	python -m pytest -vvv --cov=devopslib test_*.py

format:
	black *.py devopslib/*.py


post-install:
	python -m textblob.download_corpora

deploy:
	echo "deploy goes here"
deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 255244494775.dkr.ecr.us-east-1.amazonaws.com
	docker build -t devops-2023 .
	docker tag devops-2023:latest 255244494775.dkr.ecr.us-east-1.amazonaws.com/devops-2023:latest
	docker push 255244494775.dkr.ecr.us-east-1.amazonaws.com/devops-2023:latest

all: install post-install lint test format deploy