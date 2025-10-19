FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential libsqlite3-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local force_ruby_platform true && \
    bundle install --jobs 4 --retry 3

COPY . .

RUN RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
