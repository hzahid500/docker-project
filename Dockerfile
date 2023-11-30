FROM python:3.9-slim-buster

WORKDIR /app/backend

COPY requirements.txt /app/backend/
RUN pip install -r requirements.txt

COPY . /app/backend/

EXPOSE 8000

CMD python /app/backend/manage.py runservers