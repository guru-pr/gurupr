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

    image open(certificate.cover_url), width: 450, align: :center

    move_up 40
    fill_color 'ffffff'
    text I18n.t('.certificates.pdf.title'), size: 20, align: :center

    fill_color '40464e'

    move_down 40
    text I18n.t('.certificates.pdf.description',
                participant_name: certificate.participant_name,
                event_name: certificate.event_name,
                event_occurred_at: I18n.l(certificate.event_occurred_at.to_date, format: :long),
                event_local: certificate.event_local,
                event_duration: certificate.event_duration),
         inline_format: true

    move_down 15
    text "Curitiba, #{I18n.l certificate.event_occurred_at.to_date, format: :long}."

    move_down 30
    text certificate.event_organizer, align: :center
    text I18n.t('.certificates.pdf.organizer'), align: :center

    move_down 30
    text I18n.t('.certificates.pdf.footer', created_at: certificate.created_at, certificate_url: certificate_url(certificate)), align: :right, size: 5, inline_format: true
  end

  private

  def certificate_url(certificate)
    Rails.application.routes.url_helpers.certificate_url(certificate)
  end
end
