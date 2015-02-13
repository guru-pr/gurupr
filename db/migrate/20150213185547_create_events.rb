class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name
      t.string   :slug
      t.datetime :occurred_at
      t.string   :local
      t.string   :address
      t.text     :description

      t.timestamps null: false
    end

    add_index :events, :slug, unique: true
  end
end
