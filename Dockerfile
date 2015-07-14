FROM debian:jessie

MAINTAINER herloct <herloct@gmail.com>

# Install openjdk7 and ruby
RUN apt-get update && \
    apt-get install -y openjdk-7-jdk ruby curl unzip

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/5.1.3.61/SenchaCmd-5.1.3.61-linux-x64.run.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run --mode unattended --prefix /opt && \
    rm /cmd-install.run /cmd.run.zip

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/opt/Sencha/Cmd/5.1.3.61/sencha"]
CMD ["help"]
