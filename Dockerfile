FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN mkdir /ansible; \
    cp /etc/skel/. /ansible; \
    groupadd ansible; \
    useradd -g ansible -G wheel,users -s /bin/bash -m -d /ansible -k /etc/skel ansible; \
    chown -R ansible:ansible /ansible/ 

RUN  yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y openssh-clients; \
    yum install -y sshpass; \
    yum install git; \
    yum clean all; \
    pip3 install --upgrade pip;


RUN pip3 install "ansible==2.9.12"; \
    pip3 install boto; \
    pip3 install boto3; \
    pip3 install "pywinrm>=0.3.0";

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh"]

