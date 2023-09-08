#!/bin/bash

PYTHON_EXEC=python3

which python3 >/dev/null
if [[ $? -eq 0 ]]; then
    PYTHON_EXEC=python3
else
    which python >/dev/null
    if [[ $? -eq 0 ]]; then
        PYTHON_EXEC=python
    else
        echo "No python or python3 found. Exiting... sorry!"
        exit 1
    fi
fi

mkdir src
mkdir tests
$PYTHON_EXEC -m venv env

# Is this Mac/Linux or Windows?
BIN_DIR=env/bin
if [[ -d env/Scripts ]]; then
    BIN_DIR=env/Scripts
fi

source $BIN_DIR/activate && pip install black mypy pytest pylint && pip freeze >requirements.txt

cat >.pylintrc <<EOPL
[DESIGN]
disable=missing-function-docstring,missing-module-docstring
argument-rgx=[a-z\_][a-z0-9_]{0,39}$
EOPL

cat >Makefile <<EOM
.PHONY: all
all: codestyle typecheck lint test

.PHONY: codestyle
codestyle:
	black -l 79 src/ tests/

.PHONY: typecheck
typecheck:
	mypy --ignore-missing-imports src/

.PHONY: lint
lint:
	pylint src/

.PHONY: test
test:
	pytest tests/

.PHONY: clean
clean:
	find . -type f -name "*.pyc" | xargs rm -fr
	find . -type d -name __pycache__ | xargs rm -fr
EOM

echo ""
echo ""
echo "*****************************************************************"
echo "********************* Environment created! **********************"
echo "**** Use 'source $BIN_DIR/activate to enter new environment. ****"
echo "*****************************************************************"
