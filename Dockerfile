FROM debian:latest

ENV HUGO_VERSION 0.74.3

ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && rm /tmp/hugo.deb


EXPOSE 1313
VOLUME /app
WORKDIR /app

COPY website /app

CMD ["hugo", "server","-b https://www.example.com", "--disableFastRender", "--bind=0.0.0.0"]
