FROM ruby:2.4
MAINTAINER Alexey Vildyaev <ya@hav0k.ru>

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app

#ONBUILD COPY Gemfile /usr/src/app/
#ONBUILD COPY Gemfile.lock /usr/src/app/

RUN gem install taskwarrior-web

#CMD ["/bin/bash", "task-web"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5678

#ONBUILD COPY . /usr/src/app
