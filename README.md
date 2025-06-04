# devopsb-giropops-senhas
Projeto base para integrar docker, aws, linux e terraform

1. Clonado o repositório https://github.com/badtuxx/giropops-senhas em app
2. Dockerizada a aplicação criando um Dockerfile multistage
3. Criado arquivo docker-compose.yml para rodar o aplicativo giropops senhas em container a partir da imagem criada e rodar em conjunto o banco de dados redis.
4. Criada configurações do terraform para criar infraestrutura na aws.
5. Feito user_data para iniciar aplicação automaticamente após o apply.
6. Criado e versionado um repositório para o terraform, a partir deste repositório ele deverá puxar as confs. 
https://github.com/jhhenriquee/devopsb-giropops-terraform
7. Criada uma release para ser baixada no server, em vez de clonar o repositório por inteiro

# TODO

## Levantar a aplicação em kubernetes
