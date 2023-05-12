FROM python:3.8-slim-buster

COPY . .

RUN pip3 install -r requirements.txt

RUN pip3 install Flash FLask-SQLAlchemy
