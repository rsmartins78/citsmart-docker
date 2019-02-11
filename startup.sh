#!/bin/bash

function validate_params(){
    if [ -z "$DB_HOST" ];then
        echo "DB_HOST não foi definido, favor informar"
        exit 2
    fi
    if [ -z "$DB_PORT" ];then
        echo "DB_PORT não foi definido, favor informar"
        exit 2
    fi
    if [ -z "$DB_NAME" ];then
        echo "DB_NAME não foi definido, favor informar"
        exit 2
    fi
    if [ -z "$DB_USER" ];then
        echo "DB_USER não foi definido, favor informar"
        exit 2
    fi
    if [ -z "$DB_PASS" ];then
        echo "DB_PASS não foi definido, favor informar"
        exit 2
    fi

    count=0
    while ! ping -c1 $DB_HOST &>/dev/null
        do echo "Waiting DB - `date`"
        let "count++"
        sleep 1
        if [ "$count" -eq 10 ]; then
            echo "Timeout connection for DB Host $DB_HOST"
            exit 2
        fi
    done
    echo "DB Host Found - `date`"

}

validate_params
echo "Preenchendo arquivo standalone-full.xml com as conexões do banco"
envsubst < /opt/templates/standalone-full.xml > \
    /opt/citsmart_itsm/standalone/configuration/standalone-full.xml

echo "Iniciando citsmartITSM"

rm -rf /opt/citsmart_itsm/standalone/tmp/*
rm -rf /opt/citsmart_itsm/standalone/data/*
rm -rf /opt/citsmart_itsm/standalone/log/*

/opt/citsmart_itsm/bin/standalone.sh

