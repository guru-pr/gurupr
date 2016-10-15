# GURU-PR [![Build Status](https://travis-ci.org/guru-pr/gurupr.svg?branch=master)](https://travis-ci.org/guru-pr/gurupr) [![Code Climate](https://codeclimate.com/github/guru-pr/gurupr/badges/gpa.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Test Coverage](https://codeclimate.com/github/guru-pr/gurupr/badges/coverage.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Dependency Status](https://img.shields.io/gemnasium/guru-pr/gurupr.svg)](https://gemnasium.com/guru-pr/gurupr)

Site do Grupo de Usuários Ruby do Paraná!

Utilizamos:
- Github para autenticação
- Heroku
- PostgreSQL

De resto, vamos desenvolvendo aos poucos!

## Instalação normal

```bash
cp .env.example .env # altere as chaves caso queira trocar a aplicação
cp config/database.yml.example config/database.yml # configure seus dados de acesso ao DB
bundle install
rake db:setup
rails server
```

## Instalação via docker

```bash
cp .env.example .env # altere as chaves caso queira trocar a aplicação
docker-compose build
docker-compose run --rm web rake db:setup
docker-compose up
```

## Contribuindo

Dê uma olhada nas [issues](https://github.com/guru-pr/gurupr/issues) abertas ou comente lá se tiver alguma outra idéia... e manda vê! 😄
