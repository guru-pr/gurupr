require 'open-uri'

class CertificatePDF < Prawn::Document
  attr_accessor :path
  attr_reader :certificate

  PDF_OPTIONS = {
    page_size:   'A5',
    page_layout: :landscape,
    margin:      [30, 75]
  }.freeze

  def initialize(certificate)
    super(PDF_OPTIONS)

    @certificate = certificate

    %i(first second third fourth fifth sixty).each do |line_n|
      send "#{line_n}_line"
    end
  end

  private

  def first_line
    image open(certificate.cover_url), width: 450, align: :center
  end

  def second_line
    move_up 40
    fill_color 'ffffff'
    text I18n.t('.certificates.pdf.title'), size: 20, align: :center

    fill_color '40464e'
  end

  def third_line
    move_down 40
    text I18n.t('.certificates.pdf.description',
                participant_name: certificate.participant_name,
                event_name: certificate.event_name,
                event_occurred_at: as_long_date(certificate.event_occurred_at),
                event_local: certificate.event_local,
                event_duration: certificate.event_duration),
         inline_format: true
  end

  def fourth_line
    move_down 15
    text "Curitiba, #{as_long_date(certificate.event_occurred_at)}."
  end

  def fifth_line
    move_down 30
    text certificate.event_organizer, align: :center
    text I18n.t('.certificates.pdf.organizer'), align: :center
  end

  def sixty_line
    move_down 30
    text I18n.t('.certificates.pdf.footer',
                created_at: certificate.created_at, align: :right, size: 5,
                certificate_url: certificate_url(certificate)),
         inline_format: true
  end

  def certificate_url(certificate)
    Rails.application.routes.url_helpers.certificate_url(certificate)
  end

  def as_long_date(date)
    I18n.l date.to_date, format: :long
  end
end
