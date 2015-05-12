FROM debian:jessie

MAINTAINER herloct <herloct@gmail.com>

# Install openjdk7 and ruby
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        openjdk-7-jdk ruby curl unzip && \
    apt-get clean

# Create new user
RUN groupadd -g 1000 enduser && useradd -g enduser -u 1000 enduser && \
    mkdir -p /home/enduser && chown -R enduser:enduser /home/enduser
USER enduser
WORKDIR /home/enduser

# Download and install Sencha Cmd
RUN curl -o cmd.run.zip http://cdn.sencha.com/cmd/5.1.3.61/SenchaCmd-5.1.3.61-linux-x64.run.zip && \
    unzip -p cmd.run.zip > cmd-install.run && \
    chmod +x cmd-install.run && \
    ./cmd-install.run --mode unattended && \
    rm cmd-install.run cmd.run.zip && \
    chmod +x /home/enduser/bin/Sencha/Cmd/5.1.3.61/bin/linux-x64/phantomjs/phantomjs && \
    mkdir -p /home/enduser/data

ENV PATH=/home/enduser/bin/Sencha/Cmd/5.1.3.61:$PATH

WORKDIR /home/enduser/data
VOLUME ["/home/enduser/data"]

# Container entry point is `sencha`, default command is `help`
ENTRYPOINT ["sencha"]
CMD ["help"]
