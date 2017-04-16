FROM ruby:2.2

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client-9.4

ENV APP_PATH /opt/sql-skeleton
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH
ADD Gemfile* $APP_PATH/
RUN bundle install

EXPOSE 9393

ENTRYPOINT ["shotgun", "simple_sql.rb"]
CMD ["--host", "0.0.0.0"]
