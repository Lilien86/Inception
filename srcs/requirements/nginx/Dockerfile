FROM debian:buster


RUN apt -y update && apt install -y nginx && apt install openssl -y


COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]