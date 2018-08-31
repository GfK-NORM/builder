FROM atlassian/default-image:2
RUN apt-get update && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" && \
    apt-get update && apt-get install -y \
      docker-ce \
      mysql-client
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install awscli
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
COPY login-to-ecr.sh /root/login-to-ecr.sh
ENV CI=true
