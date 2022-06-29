# FROM python:3.7-alpine

# RUN pip install requests

# COPY hello_there.py / 

# CMD [ "python", "hello_there.py"

FROM python:3.7-alpine

WORKDIR /usr/src/app

COPY requirements.txt app.py ./

EXPOSE 5000

RUN python3 -m pip install --no-cache-dir -r ./requirements.txt
CMD python3 ./app.py