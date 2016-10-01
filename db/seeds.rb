# normal user
User.create do |u|
  u.provider = 'github'
  u.uid = '987654321'
  u.name = 'Jane Doe'
  u.email = 'jane@doe.com'
  u.nickname = 'jane'
  u.image = 'http://robohash.org/6R7.png'
end

# normal user
User.create do |u|
  u.provider = 'github'
  u.uid = '1234567890'
  u.name = 'John Doe'
  u.email = 'john@doe.com'
  u.nickname = 'jdoe'
  u.image = 'http://robohash.org/R91.png'
end

# A event in the future (1 month from now)
Event.create do |e|
  e.name = 'Primeiro Tech Day do GURU-PR'
  e.slug = 'primeiro-tech-day-do-guru-pr'
  e.occurred_at = Date.today.next_month
  e.address = 'Shopping Itália, Curitiba, Paraná'
  e.local = 'Shopping Itália'

  e.summary = <<-END.strip_heredoc
    Agenda fechada!

    **As inscrições continuam abertas**,
    mas temos poucas vagas restantes!
    Só dar um chego em maiores informações clicando aqui embaixo!
  END

  e.description = <<-END.strip_heredoc
    # Agenda
    - **09:00 - 09:20** - Credenciamento
    - **09:20 - 09:30** - Abertura
  END

  e.options = { certificate: { organizer_name: 'Roger Waters', duration: 7 } }
end
