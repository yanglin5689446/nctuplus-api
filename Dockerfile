FROM ruby:2.5.1
ENV LANG C.UTF-8

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY Gemfile $APP_ROOT/

RUN bundle install --jobs=4
