PROJECT_NAME = $(notdir ${PWD})
# Convert to lowercase
PROJECT_NAME := $(shell echo ${PROJECT_NAME} | tr A-Z a-z)

ENV ?= dev
export ENV

# Load environment variable for functional test
NAMESPACE ?= local
export NAMESPACE

TARGET_TEST=$(if ${TEST},${TEST},tests/)
COV=$(if ${TEST},,--cov=app --cov-report=term --cov-report=xml:coverage.xml --junitxml=report.xml)


help:
	@echo
	@echo "help"
	@echo "       Print this help"
	@echo

	@echo
	@echo "activate"
	@echo "       Activate virtual environment"
	@echo

	@echo "init"
	@echo "       Initialise dependencies to test and run the application."
	@echo

	@echo "check"
	@echo "       Run static analysis"
	@echo

	@echo "test"
	@echo "       Run unit tests with coverage. \
	Use TEST=/path/to/test to run a specific test."
	@echo

	@echo "run"
	@echo "       Run the application."
	@echo

	@echo "build"
	@echo "       Build docker image." 
	@echo


activate:
	@. .venv/bin/activate 

init:
	@python3 -m venv .venv && . .venv/bin/activate && python3 -m pip install -r requirements.txt && deactivate

check:
	@. .venv/bin/activate && python3 -m flake8 users/ ${TARGET_TEST} && deactivate

build:
	@docker build . -t ${PROJECT_NAME}-${ENV} 

test:
	@. .venv/bin/activate && pytest ${COV} && deactivate

run:
	@. .venv/bin/activate && python3 manage.py makemigrations 
	@ python3 manage.py migrate && python3 manage.py runserver && deactivate

db-image:
	@docker build ./postgres -t mi-postgres-image:1.0

run-db:
	@docker run mi-postgres-image:1.0 
