## DEVINFRA DEVOPS PHP-FPM and NGINX Package
[![Build and Push Docker Images](https://github.com/devinfra-br/php-devops/actions/workflows/ci.yaml/badge.svg)](https://github.com/devinfra-br/php-devops/actions/workflows/ci.yaml)

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


## Funcionalidades

- **Docker Image Build**: Este repositório inclui scripts para construir imagens Docker para várias versões do PHP, desde a 7.1 até a 8.3. Essas imagens são úteis para criar ambientes de desenvolvimento consistentes e isolados.

- **Manifestos Kubernetes Deploy**: Você encontrará manifestos para Kubernetes que facilitam o deploy de suas aplicações PHP em clusters Kubernetes. Esses manifestos garantem uma implantação confiável e escalável de suas aplicações.

- **Exemplo Docker Compose**: Também incluímos um exemplo de arquivo Docker Compose específico para aplicações Laravel. Esse exemplo permite que você configure rapidamente um ambiente de desenvolvimento local para o Laravel usando contêineres Docker.

### Uso

Este repositório é destinado a desenvolvedores familiarizados com o ambiente PHP, especialmente aqueles que trabalham com o framework Laravel. Para começar, siga as instruções fornecidas em cada seção do README correspondente.

### Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias, correções ou novos recursos.

### Licença

Este repositório é distribuído sob a [licença MIT](LICENSE). Sinta-se à vontade para usar, modificar e distribuir conforme necessário.