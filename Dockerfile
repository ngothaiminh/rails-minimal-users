
FROM ruby:3.2

ENV RAILS_ENV=production     BUNDLE_WITHOUT="development:test"

RUN apt-get update -qq && apt-get install -y --no-install-recommends     build-essential nodejs sqlite3 libsqlite3-dev default-mysql-client  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock* /app/
RUN bundle install

COPY . /app

# precompile assets (none in this minimal app, safe no-op)
# RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bash", "-lc", "bundle exec rails db:migrate && bundle exec puma -C config/puma.rb"]
