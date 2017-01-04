# Set Time.zone default to the specified zone and make
# Active Record auto-convert to this zone.
# Run "rake -D time" for a list of tasks for finding time zone names.
Rails.application.config.time_zone = 'America/Sao_Paulo'

Rails.application.config.i18n.available_locales = %i(pt-BR)
Rails.application.config.i18n.default_locale = 'pt-BR'
Rails.application.config.i18n.load_path +=
  Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
