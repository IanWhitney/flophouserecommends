# flophouserecommends.com

Display and searching of movies recommended by hosts of [The Flop House Podcast](https://www.flophousepodcast.com/).

Rails, using Sqlite as the database, running in Docker.

## Setup

- Clone repo
- Add a `.env` file 
  - `OMDBAPI=key`
  - `AWS_ACCESS_KEY_ID=key`
  - `AWS_SECRET_ACCESS_KEY=key`
- `script/setup`

## Running Locally

After running setup

`docker run --env-file .env --rm -it -v "$PWD":/app -p 127.0.0.1:3000:3000 fhr:latest`

## Deployment

- Have my Heroku credentials (if you are not me, this is a problem)
- `heroku container:push web && heroku container:release web`
