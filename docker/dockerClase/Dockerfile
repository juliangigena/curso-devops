FROM python:3.8-alpine

RUN apk add --update vim

WORKDIR /usr/src/myapp

COPY . . 

CMD [ "python" , "/usr/src/myapp/server.py"]
#ENTRYPOINT [ "python" ]