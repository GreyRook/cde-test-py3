pipenv run pycodestyle ${PYTHON_MODULE} tests/
RES_CODESTYLE=$?
pipenv run pylint ${PYTHON_MODULE}
RES_PYLINT=$?
pipenv run mypy --no-incremental --ignore-missing-imports ${PYTHON_MODULE}
RES_MYPY=$?

echo "== Summary =="


if [ "$RES_CODESTYLE" == "0" ]; then
    echo -n "✔"
else
    echo -n "✖"
fi
echo " pycodestyle"


if [ "$RES_PYLINT" == "0" ]; then
    echo -n "✔"
else
    echo -n "✖"
fi
echo " pylint"



if [ "$RES_MYPY" == "0" ]; then
    echo -n "✔"
else
    echo -n "✖"
fi
echo " mypy"


if [ "$RES_CODESTYLE" != "0" ] | [ "$RES_PYLINT" != "0" ] | [ "$RES_MYPY" != "0" ]; then
    echo "Not all checks passed"
    exit 1
fi