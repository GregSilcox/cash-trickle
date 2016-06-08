FROM ruby:2.3.1
MAINTAINER Greg Silcox "greg.silcox@gmail.com"

# System
RUN apt-get update -qq && apt-get install -y build-essential sqlite3

# Application
RUN mkdir /cashflow
WORKDIR /cashflow
COPY . /cashflow

# Rails
# This installs everything everytime. It's the best we can do
# on Windows until they allow interactive mode.
RUN bundle install
RUN bundle install --binstubs
CMD rails s -b 0.0.0.0
