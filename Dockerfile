FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node.js

RUN mkdir /myapp
WORKDIR /myapp

RUN gem install bundler --pre

ADD . /myapp

RUN bundle install
