require 'sabayon_middleware'

Rails.application.config.middleware.insert_before 0, SabayonMiddleware
