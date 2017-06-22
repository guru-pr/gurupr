class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :image
      t.string :nickname

      t.timestamps null: false
    end

    add_index :users, [:provider, :uid]
  end
end
