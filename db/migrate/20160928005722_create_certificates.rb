class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates, id: :uuid do |t|
      t.references :event, null: false
      t.references :user,  null: false, index: true

      t.timestamps null: false
    end
  end
end
