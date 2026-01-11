FROM ubuntu:22.04

WORKDIR /app

COPY app.sh /app/app.sh
RUN chmod +x /app/app.sh

CMD ["/app/app.sh"]
