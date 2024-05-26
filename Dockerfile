#BASE IMAGE
FROM ubuntu:22.04

#UPDATE AND INSTALL SSH
RUN apt update && \
    apt install -y ssh && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#SSH CONFIGURATION
RUN mkdir /var/run/sshd
RUN echo 'root:pass' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

#OPEN PORT 22
EXPOSE 22

#START SSH SERVICE
CMD ["/usr/sbin/sshd", "-D"]
