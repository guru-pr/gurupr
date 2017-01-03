class CertificatesController < ApplicationController
  def show
    @certificate = Certificate.find(params[:id])

    send_data CertificatePDF.new(@certificate).render,
              filename: "#{@certificate.id}.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  end
end
