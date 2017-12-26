# School API

School é uma API para gerenciar escolas, professores, alunos e os endereços das escolas.

Tecnologias utilizadas e suas versões:

* Ruby 2.4.1
* Rails 5.1.4
* PostgreSQL 9.1
* Redis 3.0
* Sidekiq 5.0.5
* RSpec 3.6
* FactoryBot 4.8.2
* Ruby Version Manager (RVM) 1.29.3

Configurando o projeto para rodar localmente:

* Crie uma pasta para o projeto e o clone:

  git clone https://github.com/viniciuscbm/school-api.git

* Instalação e configuração do Redis:

  Se o redis não estiver instalado na máquina, siga os passos abaixo de instalação.

  1 - wget http://download.redis.io/redis-stable.tar.gz
  2 - tar xvzf redis-stable.tar.gz
  3 - cd redis-stable
  4 - make
  5 - cd /school-api
  6 - redis-cli ping (Resposta: PONG)
  7 - redis-server & (Start redis in Backgroud)

  Caso o redis já estiver instalado siga os passos abaixo.

  1 - ps aux |grep redis (Cópie o código (pid) da resposta do Redis)
  2 - sudo kill -9 (Código cópiado)
  3 - redis-server & (Start redis in Backgroud)

* Acesse a pasta do projeto pelo terminal e execute um "bundle install":

  cd school-api
  bundle install

* Acesse a pasta do projeto e configure o banco de dados:

  Acesse school-api/config e renomei "database.yml.example" para "database.yml".
  Dentro do arquivo "database.yml" coloque o login e a senha do PostgreSQL, da sua máquina local.

* Criando e populando o banco de dados:

  Dentro da pasta do projeto execute o comando: rails dev:setup
  "rails dev:setup" apaga, cria, insere tabelas e popula o banco dados com dados faker.

* Rodando o projeto localmente:

  Dentro da pasta do projeto execute o comando: foreman start
  "foreman start" ira subir o servidor local (Puma) e startar o serviço do Sidekiq

  Nota: O projeto foi desenvolvido dentro uma máquina virtual, pelo Vagrant, neste último commit foi retirado o bind (-b 0.0.0.0 -p 3000 / IP e Porta), restando apenas o "rails s" e "bundle exec sidekiq -q default -q mailers". Dependendo do ambiente que o projeto vai ser rodado é necessário adicionar IP e/ou Porta.

* Executanto a suíte de testes:

  Dentro da pasta do projeto execute o comando: bin/rspec ou rspec, sendo o primeiro mais rápido.

* Documentação do Projeto (Swagger):

  Com o projeto em execução, acesse a seguinte URL pelo navegador (Browser): localhost:3000/documentation/v1
