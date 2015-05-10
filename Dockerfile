FROM debian:jessie

MAINTAINER herloct <herloct@gmail.com>

WORKDIR /tmp

# Install openjdk7 and ruby
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        openjdk-7-jre ruby curl unzip && \
    apt-get clean

# Download and install Sencha Cmd
RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/5.1.3.61/SenchaCmd-5.1.3.61-linux-x64.run.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run --mode unattended --prefix /opt && \
    rm /cmd-install.run /cmd.run.zip

# Create data volume
RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

# Container entry point is `sencha`, default command is `help`
ENTRYPOINT ["/opt/Sencha/Cmd/5.1.3.61/sencha"]
CMD ["help"]
