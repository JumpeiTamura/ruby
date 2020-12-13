FROM ruby:2.7

RUN apt-get update

WORKDIR /usr/src

COPY src/Gemfile .

RUN bundle install --path=vendor/bundle

