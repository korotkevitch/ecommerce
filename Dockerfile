FROM python:3.9-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /ecommerce2

RUN apk --update add
RUN apk add gcc libc-dev libffi-dev jpeg-dev zlib-dev libjpeg
RUN apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev

RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT ["/ecommerce2/entrypoint.sh"]
