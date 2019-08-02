FROM ruby:2.6.3
RUN apt-get update && apt-get install -y postgresql-client
RUN mkdir /travel-pro
WORKDIR /travel-pro
COPY Gemfile /travel-pro/Gemfile
COPY Gemfile.lock /travel-pro/Gemfile.lock
RUN bundle install
COPY . /travel-pro

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
