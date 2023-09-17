FROM ruby:3.2

# sqlite3
RUN apt-get -y update --allow-unauthenticated --allow-insecure-repositories
RUN apt-get -y upgrade
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN rm -rf -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /root/db

# nodejs
RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install nodejs -y

# yarn
RUN npm install -g yarn

## Rails
ENV MAKE="make --jobs 8"
RUN gem install rails --version '~> 6.1'

RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000

ENV MAKE="make --jobs 8"
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY package.json yarn.lock ./
RUN rails yarn install
COPY . .
RUN yarn install --check-files

RUN RAILS_ENV=development rails webpacker:compile
RUN NODE_OPTIONS=--openssl-legacy-provider RAILS_ENV=production SECRET_KEY_BASE=production rails webpacker:compile

ENV RAILS_ENV="development"

ENTRYPOINT ["./script/_docker_entrypoint"]

CMD ["rails", "server", "-b", "0.0.0.0"]
