# TemaTres : The way to manage formal representations of knowledge TemaTres

A Docker image for https://github.com/tematres/TemaTres-Vocabulary-Server

## Deployment on ACDH-CH servers

Deployment on ACDH-CH k8s cluster is performed over Github actions.

### Environment variables

| Environment Variable | Required | Default | Description                                                            |
|----------------------|----------|---------|------------------------------------------------------------------------|
| DB_HOST              |    +     |         | Database host.                                                         |
| DB_USER              |    +     |         | Database username.                                                     |
| DB_PASS              |    +     |         | Database password.                                                     |
