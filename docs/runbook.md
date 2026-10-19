# Runbook

> Fill in every TODO with exact commands. / Попълнете всяко TODO с точни команди.

## Start locally / Локално стартиране

python3.12 -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
pip install -r requirements-dev.txt

## Check that it works / Проверка, че работи

 which address do you open and what should you see? / кой адрес отваряте и какво трябва да видите?
curl  http://127.0.0.1:8000/health

## Run the tests / Тестове

pytest
ruff check .

## When something breaks / Когато нещо се счупи

 the first three things you check. / първите три неща, които проверявате.
 curl  http://127.0.0.1:8000/health
 curl  http://127.0.0.1:8000/ready
 curl  http://127.0.0.1:8000/version
