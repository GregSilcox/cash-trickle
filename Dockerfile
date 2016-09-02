FROM ruby:2.3.1
MAINTAINER Greg Silcox "greg.silcox@gmail.com"

# System
RUN apt-get update -qq && apt-get install -y build-essential sqlite3

# Application
RUN mkdir /cashflow
WORKDIR /cashflow
COPY . /cashflow

# Rails
RUN mkdir /bundle
RUN bundle install --path /bundle

# docker-compose run web bundle config --delete bin    # Turn off Bundler's stub generator
# docker-compose run web rails app:update:bin         # Use the new Rails 4 executables
# docker-compose build web
# docker-compose run web bundle install --path /bundle
# docker-compose run rails db:migrate
# docker-compose up
