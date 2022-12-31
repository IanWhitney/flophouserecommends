FROM ruby:3.1

# sqlite3
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install sqlite3=3.* && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	mkdir -p /root/db

# nodejs, yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g yarn

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
RUN RAILS_ENV=production SECRET_KEY_BASE=production rails webpacker:compile

ENV RAILS_ENV="development"

ENTRYPOINT ["./script/_docker_entrypoint"]

CMD ["rails", "server", "-b", "0.0.0.0"]
