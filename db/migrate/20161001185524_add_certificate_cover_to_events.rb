class AddCertificateCoverToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :certificate_cover, :string
  end
end
