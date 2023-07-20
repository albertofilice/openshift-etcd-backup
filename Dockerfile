FROM registry.redhat.io/openshift4/ose-cli:v4.11

RUN dnf install python3-pip
RUN pip3 install awscli --upgrade

COPY entrypoint.sh .
COPY backup.sh .
COPY upload-destinations upload-destinations

RUN chmod +x entrypoint.sh
RUN chmod +x backup.sh
RUN chmod -R +x upload-destinations

RUN mkdir /backups
RUN chgrp -R 0 /backups && \
    chmod -R g=u /backups

CMD [ "./entrypoint.sh" ]
