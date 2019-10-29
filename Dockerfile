FROM ruby:2.6.5

MAINTAINER Leonardo Fiório 

# Atualização do sistema
RUN apt-get update 
#RUN apt-get upgrade
#RUN apt-get dist-upgrade


# Instalação do Ruby
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update 
RUN apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

#########################################################################################

# Comandos necessários em caso de instalação direta ao Ubuntu

#RUN cd 
#RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
#RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
#RUN exec $SHELL

#RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
#RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#RUN exec $SHELL

#RUN /bin/bash source ~/.bashrc
#RUN rbenv install 2.6.5
#RUN rbenv global 2.6.5

##########################################################################################

RUN gem install bundler


# Instalação do Rails 
RUN gem install rails -v 6.0.0
#RUN rbenv rehash

# Copiando projeto para raiz da imagem
COPY . /Bookmarks

WORKDIR /Bookmarks
RUN bundle install

# Configuração de porta do docker
EXPOSE 3000


##########################################################################################
# Entrada dos dados de autenticação de um servidor smtp para email de recuperação de
# senha do usuário

# Antes do build, o conteudo de domain, port, username e password deve ser trocado pelas
# informações de autenticação do servidor SMTP

ENV MAIL_ADRESS conteudo
ENV MAIL_DOMAIN conteudo
ENV MAIL_PORT conteudo
ENV MAIL_USERNAME conteudo
ENV MAIL_PASSWORD conteudo


##########################################################################################
 

# Executar testes
# CMD rails test


# Executando server 
CMD rails s -b 0.0.0.0 -p 3000

