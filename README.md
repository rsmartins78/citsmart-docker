# Citsmart ITSM Community em Container Docker

Este projeto é um baseado no projeto original disponível em: <https://hub.docker.com/r/citsmart/itsm_community/>

![Login_Citsmart](https://uploaddeimagens.com.br/imagens/selection_097-png)

### Como usar

Ao realizar o deploy do banco de dados e em seguida da aplicação, pode demorar um tempo até que a interface esteja disponível em http://<seu_endereco>:8080/citsmart

Após a interface aparecer, finalize a configuração conforme a documentação oficial da aplicação, com informações do banco, do LDAP, SMTP, diretórios temporários e etc.

Após tudo pronto, o usuário para login é admin, senha citsmart.

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
    ports:
    - "8080:8080"
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
