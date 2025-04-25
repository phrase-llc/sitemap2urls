FROM ruby:3.4
WORKDIR /app
COPY . /app
RUN bundle install
ENTRYPOINT ["bundle", "exec", "ruby", "sitemap2urls.rb"]