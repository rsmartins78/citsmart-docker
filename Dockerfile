FROM citsmart/itsm_community

ENV EXTERNAL_DB=true

RUN apt-get update -qqy && apt-get install -y gettext iputils-ping && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/opt/citsmart/anexobase", "/opt/citsmart/base", "/opt/citsmart/ged", "/opt/citsmart/gemeas", "/opt/citsmart/upload" ]

COPY configuration/standalone-full.xml /opt/templates/standalone-full.xml

COPY startup.sh /startup.sh

ENTRYPOINT [ "/startup.sh" ]