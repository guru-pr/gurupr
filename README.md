# GURU-PR [![Build Status](https://travis-ci.org/guru-pr/gurupr.svg?branch=master)](https://travis-ci.org/guru-pr/gurupr) [![Code Climate](https://codeclimate.com/github/guru-pr/gurupr/badges/gpa.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Test Coverage](https://codeclimate.com/github/guru-pr/gurupr/badges/coverage.svg)](https://codeclimate.com/github/guru-pr/gurupr) [![Dependency Status](https://img.shields.io/gemnasium/guru-pr/gurupr.svg)](https://gemnasium.com/guru-pr/gurupr)

Site do Grupo de Usuários Ruby do Paraná!

Utilizamos:
- Github para autenticação
- Heroku
- PostgreSQL

De resto, vamos desenvolvendo aos poucos!

## Instalação

```bash
cp .env.example .env # copie e configure as chaves
bundle install
rake db:create db:migrate
rails server
```

## TODO

- ~~Melhorar~~ Fazer o layout
- Adicionar [ribbon](https://github.com/blog/273-github-ribbons)

## Feito

- ~~Configurar timezone para `Brasilia`~~
- ~~Melhorar specs~~
- ~~Mini administração para eventos~~
- ~~Adicionar eventos~~
- ~~Travis!~~
- ~~Codeclimate!~~
