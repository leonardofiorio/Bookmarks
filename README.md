# README

Bookmarks é um projeto desenvolvido em Ruby on Rails para inserção, alteração, visualização e remoção em um cadastro de Bookmarks 


## Principais Tecnologias:

* Ruby 2.6.5

* Rails 6.0.0

* Postgres

* Docker


## Como executar:
* Alterar as linhas da declaração de variáveis globais de domain, port, username e password do servidor SMTP no Dockerfile

	EX:

		ENV MAIL_DOMAIN mail.com

		ENV MAIL_PORT 25

		ENV MAIL_USERNAME email@email.com
		
		ENV MAIL_PASSWORD passwordemail

* $ docker-compose build

* $ docker-compose up

* $ docker-compose run web rake db:create

* $ docker-compose run web rake db:migrate

* $ docker-compose up

* Acessar a aplicação em localhost:3000 em um navegador