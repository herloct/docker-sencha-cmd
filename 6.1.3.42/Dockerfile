FROM debian:jessie

MAINTAINER herloct <herloct@gmail.com>

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless ruby unzip curl

RUN useradd -ms /bin/bash sencha
RUN cd && cp -R .bashrc .profile /home/sencha

RUN mkdir -p /home/sencha/app
ADD . /home/sencha/app

RUN chown -R sencha:sencha /home/sencha

USER sencha
ENV HOME /home/sencha

RUN curl -o /home/sencha/cmd.sh.zip http://cdn.sencha.com/cmd/6.1.3/no-jre/SenchaCmd-6.1.3-linux-amd64.sh.zip
RUN unzip -p /home/sencha/cmd.sh.zip > /home/sencha/cmd-install.sh && \
    chmod +x /home/sencha/cmd-install.sh && \
    /home/sencha/cmd-install.sh -q && \
    rm /home/sencha/cmd*

WORKDIR /home/sencha/app

EXPOSE 1841

ENTRYPOINT ["/home/sencha/bin/Sencha/Cmd/6.1.3.42/sencha"]
CMD ["help"]
