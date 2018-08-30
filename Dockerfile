FROM atlassian/default-image:2
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install awscli
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
