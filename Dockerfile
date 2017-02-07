FROM ruby:2.4.0-alpine

RUN apk --update --no-cache add build-base git openssh-client && \
    mkdir /sinatra-sane-logging && \
    gem install bundler -v 1.13.7

WORKDIR /sinatra-sane-logging

COPY sinatra-sane-logging.gemspec Gemfile Gemfile.lock ./

RUN bundle

COPY . ./
