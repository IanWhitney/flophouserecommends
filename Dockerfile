FROM ianwhitney/base_rails:latest
RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000

ENV MAKE="make --jobs 8"
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
COPY . .

RUN RAILS_ENV=development rails webpacker:compile
RUN RAILS_ENV=production rails webpacker:compile

ENV RAILS_ENV="development"

ENTRYPOINT ["./script/_docker_entrypoint"]

CMD ["rails", "server", "-b", "0.0.0.0"]
