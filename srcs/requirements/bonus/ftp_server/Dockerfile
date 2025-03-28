FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/setup_ftp.sh /tmp/setup_ftp.sh
ENTRYPOINT ["sh", "/tmp/setup_ftp.sh"]
