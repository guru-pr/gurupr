require 'open-uri'

class CertificatePDF < Prawn::Document
  attr_accessor :path

  PDF_OPTIONS = {
    page_size:   'A5',
    page_layout: :landscape,
    margin:      [30, 75]
  }

  def initialize(certificate)
    super(PDF_OPTIONS)

    image open('2o-tech-day.jpg'), width: 450, align: :center

    move_up 40
    fill_color 'ffffff'
    text 'Certificado', size: 20, align: :center

    fill_color '40464e'

    move_down 40
    text "Certificamos que <strong><em>#{certificate.participant_name}</em></strong> participou do <em>#{certificate.event_name}</em>, realizado em #{I18n.l certificate.event_occurred_at.to_date, format: :long} no #{certificate.event_local}, com carga horária total de #{certificate.event_duration} horas, na qualidade de participante.", inline_format: true

    move_down 15
    text "Curitiba, #{I18n.l certificate.event_occurred_at.to_date, format: :long}."

    move_down 30
    text certificate.event_organizer, align: :center
    text 'Organizador', align: :center

    move_down 30
    text "O código de autenticação <strong>#{certificate.id}</strong> gerado em #{certificate.created_at} pode ser verificado em <a href='http://gurupr.org/'><u>http://gurupr.org</u></a>", align: :right, size: 5, inline_format: true
  end
end
