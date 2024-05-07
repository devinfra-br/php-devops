# PHP DevOps Environment

Este repositório fornece um ambiente DevOps para desenvolvedores que trabalham com PHP, especialmente aqueles que utilizam o framework Laravel.

## Versões disponíveis

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

## Imagens Docker disponíveis
|    PHP Version  | Registry  |                  
|-----------------|-----------|
|7.1 |  2.0.0 


## Funcionalidades

- **Docker Image Build**: Este repositório inclui scripts para construir imagens Docker para várias versões do PHP, desde a 7.1 até a 8.3. Essas imagens são úteis para criar ambientes de desenvolvimento consistentes e isolados.

- **Manifestos Kubernetes Deploy**: Você encontrará manifestos para Kubernetes que facilitam o deploy de suas aplicações PHP em clusters Kubernetes. Esses manifestos garantem uma implantação confiável e escalável de suas aplicações.

- **Exemplo Docker Compose para Laravel**: Também incluímos um exemplo de arquivo Docker Compose específico para aplicações Laravel. Esse exemplo permite que você configure rapidamente um ambiente de desenvolvimento local para o Laravel usando contêineres Docker.

## Uso

Este repositório é destinado a desenvolvedores familiarizados com o ambiente PHP, especialmente aqueles que trabalham com o framework Laravel. Para começar, siga as instruções fornecidas em cada seção do README correspondente.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias, correções ou novos recursos.

## Licença

Este repositório é distribuído sob a [licença MIT](LICENSE). Sinta-se à vontade para usar, modificar e distribuir conforme necessário.
