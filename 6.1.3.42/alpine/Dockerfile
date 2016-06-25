FROM alpine:3.4

MAINTAINER herloct <herloct@gmail.com>

ENV FC_LANG en-US

RUN apk update && \
    apk upgrade && \
    apk add \
        curl \
        openjdk7-jre-base \
        ruby \
        ttf-dejavu \
        unzip && \
    rm -rf /var/cache/apk/* /tmp/*

RUN addgroup sencha && \
    adduser -s /bin/bash -D -G sencha sencha && \
    mkdir -p /home/sencha/app
ADD . /home/sencha/app

RUN chown -R sencha:sencha /home/sencha

USER sencha
ENV HOME /home/sencha

RUN curl -o /home/sencha/cmd.sh.zip http://cdn.sencha.com/cmd/6.1.3/no-jre/SenchaCmd-6.1.3-linux-amd64.sh.zip && \
    unzip -p /home/sencha/cmd.sh.zip > /home/sencha/cmd-install.sh && \
    chmod +x /home/sencha/cmd-install.sh && \
    /home/sencha/cmd-install.sh -q && \
    rm /home/sencha/cmd*

WORKDIR /home/sencha/app

EXPOSE 1841

ENTRYPOINT ["/home/sencha/bin/Sencha/Cmd/6.1.3.42/sencha"]
CMD ["help"]

