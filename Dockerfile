FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y sudo \
    build-essential libpq-dev vim postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt-get update -qq &&\
    apt-get install -y nodejs

ENV TZ=Asia/Tokyo

WORKDIR /profile_ver2

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install

RUN mkdir frontend

COPY frontend/package.json frontend/.

COPY frontend/package-lock.json frontend/.

RUN cd frontend && npm install
