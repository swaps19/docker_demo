FROM ruby:2.6

# system update
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN gem install bundler

# postgres
RUN apt-get install -y libpq-dev postgresql-client

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

RUN mkdir /docker_demo
WORKDIR /docker_demo

COPY Gemfile* /docker_demo/
COPY . /docker_demo/
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
