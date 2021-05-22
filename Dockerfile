FROM ianwhitney/base_rails:latest
RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000

ENV MAKE="make --jobs 8"
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
COPY . .

# CMD rails s
