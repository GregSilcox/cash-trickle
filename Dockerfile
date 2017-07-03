FROM ruby:2.4.1
MAINTAINER Greg Silcox "greg.silcox@gmail.com"

# System
RUN apt-get update -qq && apt-get install -y build-essential sqlite3

# Application
RUN mkdir /cashflow
WORKDIR /cashflow
COPY . /cashflow

# Rails
RUN gem install bundler
RUN bundle install
RUN bundle exec rails db:migrate

EXPOSE 3000

CMD bundle exec rails server -b 0.0.0.0

# docker-compose run web bundle config --delete bin    # Turn off Bundler's stub generator
# docker-compose run web rails app:update:bin         # Use the new Rails 4 executables
# docker-compose build web
# docker-compose run web bundle install --path /bundle
# docker-compose run rails db:migrate
# docker-compose up
