FROM phusion/baseimage

MAINTAINER herloct <herloct@gmail.com>

# Install openjdk7 and ruby
RUN apt-get update && \
    apt-get install -y openjdk-7-jre ruby2.0 unzip

RUN curl -o /cmd.sh.zip http://cdn.sencha.com/cmd/6.0.0.202/no-jre/SenchaCmd-6.0.0.202-linux-amd64.sh.zip && \
    unzip -p /cmd.sh.zip > /cmd-install.sh && \
    chmod +x /cmd-install.sh && \
    /cmd-install.sh -q -dir "/opt/sencha-cmd" && \
    rm /cmd-install.sh /cmd.sh.zip

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/sbin/my_init", "--", "/opt/sencha-cmd/sencha"]
CMD ["help"]
