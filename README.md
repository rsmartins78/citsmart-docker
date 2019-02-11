# Citsmart ITSM Community em Container Docker

Este projeto é um baseado no projeto original disponível em: https://hub.docker.com/r/citsmart/itsm_community/

### Como usar

Você pode executar o docker-compose abaixo para realizar o deploy

```
version: '2'
services:
  postgresql:
    image: postgres:9.5
    environment:
      POSTGRES_USER: citsmart
      POSTGRES_PASSWORD: citsmart
      POSTGRES_DB: citsmart
    volumes:
    - /devops/citsmart/db:/var/lib/postgresql/data
  citsmartITSM:
    image: 10.130.214.119:5000/citsmart/citsmart-itsm-community
    environment:
      DB_HOST: postgres
      DB_PORT: '5432'
      DB_NAME: citsmart
      DB_USER: citsmart
      DB_PASS: citsmart
    volumes:
    - /docker/citsmart/uploads:/opt/citsmart/uploads
    - /docker/citsmart/gemeas:/opt/citsmart/gemeas
    - /docker/citsmart/base:/opt/citsmart/base
    - /docker/citsmart/anexobase:/opt/citsmart/anexobase
    - /docker/citsmart/ged:/opt/citsmart/ged
    links:
    - postgresql:postgres
```

### Variáveis
> EXTERNAL_DB: Avisa aplicação se deve aceitar PostgreSQL Externo ou Embarcado no Container (não recomendado, default: true)  

> DB_HOST: endereço do banco  

> DB_PORT: porta do banco  

> DB_NAME: nome do database  

> DB_USER: usuário de acesso ao banco  

> DB_PASS: senha de acesso ao banco.  
