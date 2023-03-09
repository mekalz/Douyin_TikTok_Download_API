# Credits
# https://github.com/jw-star
FROM python:3.10.10-slim-buster
MAINTAINER mekalz

RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list
RUN  apt-get clean

RUN apt-get update \
    && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt install nodejs

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN npm install -y md5

RUN pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple
RUN pip3 --no-cache-dir install --user -r /app/requirements.txt

RUN chmod +x start.sh

CMD ["./start.sh"]
