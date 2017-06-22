class AddSummaryToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :summary, :text
  end
end
