
## DEVINFRA PHP-FPM and NGINX Package
[![Build and Push Docker Images](https://github.com/devinfra-br/php-devops/actions/workflows/ci.yaml/badge.svg)](https://github.com/devinfra-br/php-devops/actions/workflows/ci.yaml) [![Pipeline-Laravel](https://github.com/devinfra-br/php-devops/actions/workflows/ci-example.yaml/badge.svg)](https://github.com/devinfra-br/php-devops/actions/workflows/ci-example.yaml)


### Descrição
Essas imagens Docker fornecem uma solução completa para executar aplicativos PHP com PHP-FPM e Nginx. PHP-FPM (FastCGI Process Manager) oferece recursos aprimorados para gerenciar processos PHP, enquanto o Nginx serve como um servidor web de alto desempenho, ideal para lidar com conexões simultâneas de forma eficiente.

#### Key Features
- PHP-FPM: Gerenciamento eficiente de processos PHP, adequado para sites de qualquer tamanho, principalmente aqueles com alto tráfego.
- Nginx: Um poderoso servidor web conhecido por seu desempenho e escalabilidade, capaz de lidar com um grande número de conexões simultâneas.

####  Usando as imagens
As imagens vêm pré-configuradas para fácil integração e implantação. Eles são adequados para ambientes de desenvolvimento e produção. Compilações automatizadas estão disponíveis no Docker Hub, tornando a instalação descomplicada.

### Versões disponíveis

|PHP Version|lib redis|lib mongodb|lib memcache|lib rdkafka|lib amqp|xdebug|                      
|-----------|---------|-----------|------------|-----------|--------|------|
|7.1.33 |  4.1.1 | 1.2.9  | 3.1.1  | 3.0.5  | 1.8.0 | 2.5.0  | 
|7.2.34 |  5.1.1 | 1.6.0  | 3.1.5  | 4.1.2  | 1.9.4 | 2.9.0  | 
|7.3.33 |  5.3.7 | 1.14.1  |3.2.0  | 6.0.3  | 1.11.0 | 3.1.6 | 
|7.4.33 |  4.1.1 | 1.2.9  | 3.1.1  | 3.0.5  | 1.8.0 | ---   | 
|8.0.30 |  6.0.2 | 1.2.9  | 3.2.0  | 6.0.3  | 2.1.2 | ---   | 
|8.1.28 |  6.0.2| 1.18.1 | 3.2.0  | 6.0.3  | 2.1.2 | ---  | 
|8.2.18 |  6.0.2 | 1.18.1  |3.2.0  | 6.0.3  | 2.1.2 | ---   | 
|8.3.6 |  6.0.2 | 1.18.1  |3.2.0  | 6.0.3  | 2.1.2 | ---  | 

### Container imagens registry(dockerhub)
|    PHP Version  | Registry URL |                  
|-----------------|-----------|
|7.1 | devinfrabr/php-7.1:latest
|7.2 | devinfrabr/php-7.2:latest
|7.3 | devinfrabr/php-7.3:latest
|7.4 | devinfrabr/php-7.4:latest
|8.0 | devinfrabr/php-8.0:latest
|8.1 | devinfrabr/php-8.1:latest
|8.2 | devinfrabr/php-8.2:latest
|8.3 | devinfrabr/php-8.3:latest


## Estrutura do repositório

```py
# PHP DevOps
├── developer/
│   ├── docker-compose.yaml
│   └── Dockerfile
│
├── gitops/
│   ├── build
│   │   ├── config
│   │   └── Dockerfile
│   │
│   ├── docker
|   |   |
│   │   ├── php
│   |   |   ├── 7.1 
│   |   |   ├── 7.2 
│   |   |   ├── 7.3 
│   |   |   ├── 7.4 
│   |   |   ├── 8.0 
│   |   |   ├── 8.1 
│   |   |   ├── 8.2
│   |   |   └── 8.3 
│   │   └── README.md
|	|
│   ├── kubernetes
│   │   ├── helm
|   |   |     └── ?????
│   │   ├── kind
|   |   |    └── cluster.yaml
│   │   └── manifests
│   │	      ├── app
│   │		  ├── database
|	|         └── redis
|   |   
│   └── pipelines
│       ├── bitbucket.yml
│       ├── githubactions.yaml
│       └── gitlab.yaml
│
├── CODE_OF_CONDUCT.md
├── LICENSE
└── README.md
```
### Descrição das pastas

**Desenvolvimento local com docker** 
Acesse a pasta `\developer` e execute o arquivo `docker-compose.yaml`
Nesta pasta contem um arquivo chamado `Dockerfile`, onde será possivel realizar toda a customização da imagem PHP-FPM.

- **developer**: Nesta pasta você ira encontrar os arquivos para adicionar ao seu projeto para desenvolvimento local, usando docker compose e mapeando os volumes do docker até a pasta da sua aplicação que esta localmente na sua maquina.
Exemplo:  
```yaml
name: php-stack
  services:
    app:
      #image: devinfrabr/php-7.1:latest
      build:
	    context: .
        dockerfile: Dockerfile
     container_name: app
     ports:
       - "8080:80"
     # Nesta seção você ira adicionar o caminho do código fonte do seu projeto
     volumes:
       - ./app:/var/www/app
```
- **gitops**: Nesta pasta você ira encontrar diversos arquivos relacionados a automação e configuração do projeto para que você consiga executar seu container em PHP em diversos serviços de container (aws ecs, kubernetes, docker swarm) alem de exemplos de pipelines dos serviços de git mais populares do mercado (github, gitlab, bitbucket).

	> - **helm**: Em breve iremos atualizar o pacote helm para PHP.
	
	- **kind**: Nesta pasta você ira encontrar o arquivo **`cluster.yaml`** com ele você poderá criar um cluster kubernetes localmente para simular sua aplicação em PHP sendo executada 100% via kubernetes.
	- **kubernetes**: Nesta pasta você ira encontrar os manifestos para executar sua aplicação em qualquer cluster kuberntes usando ingress para configurar as conexões de entrada e banco de dados mysql e Redis.
	- **pipelines**: Nesta pasta você ira encontrar modelos de pipelines para você criar sua própria versão com as etapas que você precisar para testes, e build e até deploy da sua aplicação.

**Aplicando manifestos kubernetes**
Acesse a pasta `\gitops\kubernetes\manifests` nestes manifestos você ira encontrar a estrutura de pastas.
Você pode criar um namespace reservado apenas para sua aplicação ou versão executando o comando:
```ssh
# kubectl apply -f \gitops\kubernetes\manifests\app\* 
```
**kubernetes local**
Caso você não use o minikube você pode instalar o software chamado **kind** usando o link oficial https://kind.sigs.k8s.io/ 


### Avisos
Este repositório é destinado a desenvolvedores familiarizados com o ambiente PHP, especialmente aqueles que trabalham com o framework Laravel. Para começar, siga as instruções fornecidas em cada seção do README correspondente.

### Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias, correções ou novos recursos.

### Licença

Este repositório é distribuído sob a [licença MIT](LICENSE). Sinta-se à vontade para usar, modificar e distribuir conforme necessário.