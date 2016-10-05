class AddOptionsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :organizer, :string
    add_column :events, :duration,  :integer
  end
end
