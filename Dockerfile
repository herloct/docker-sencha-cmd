FROM debian:jessie

MAINTAINER herloct <herloct@gmail.com>

# Install openjdk7 and ruby
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        openjdk-7-jdk ruby curl unzip && \
    apt-get clean && \
    curl -o /tmp/cmd.run.zip http://cdn.sencha.com/cmd/5.1.3.61/SenchaCmd-5.1.3.61-linux-x64.run.zip && \
    unzip -p /tmp/cmd.run.zip > /tmp/cmd-install.run && \
    chmod +x /tmp/cmd-install.run && \
    /tmp/cmd-install.run --mode unattended --prefix /opt && \
    rm /tmp/cmd-install.run /tmp/cmd.run.zip && \
    chmod -R 0777 /opt/Sencha/Cmd

ENV PATH=/opt/Sencha/Cmd/5.1.3.61:$PATH

# Container entry point is `sencha`, default command is `help`
ENTRYPOINT ["sencha"]
CMD ["help"]

