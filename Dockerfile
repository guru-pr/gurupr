FROM ruby:2.3.5

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && apt-get install -y libc-ares2 libv8-3.14.5 postgresql-client nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --force --install /usr/bin/node node /usr/bin/nodejs 10

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
