# GURU-PR [![Build Status](https://travis-ci.org/guru-pr/gurupr.svg?branch=master)](https://travis-ci.org/guru-pr/gurupr) [![Code Climate](https://codeclimate.com/github/guru-pr/gurupr/badges/gpa.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Test Coverage](https://codeclimate.com/github/guru-pr/gurupr/badges/coverage.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Dependency Status](https://img.shields.io/gemnasium/guru-pr/gurupr.svg)](https://gemnasium.com/guru-pr/gurupr)

Site of the Ruby users group from Paraná - Brazil!

We use:
- Github for authentication
- Heroku
- PostgreSQL

Otherwise, let's develop in baby steps!

## Common install

```bash
cp .env.example .env # edit the keys in case you want to change the application
cp config/database.yml.example config/database.yml # config your database access data
bundle install
rake db:setup
rails server
```

## Docker install

```bash
cp .env.example .env # edit the keys in case you want to change the application
docker-compose build
docker-compose run --rm web rails db:setup db:migrate db:seed
docker-compose up
```

## Contributing

Take a look at the opened [issues](https://github.com/guru-pr/gurupr/issues), comment sugestions or new ideas... and enjoy! 😄
