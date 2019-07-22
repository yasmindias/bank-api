FROM ruby:2.6.3

RUN mkdir /bank-api
WORKDIR /bank-api

COPY Gemfile /bank-api/Gemfile
RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000
