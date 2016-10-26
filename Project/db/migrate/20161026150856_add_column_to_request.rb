class AddColumnToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :budget, :integer
    add_column :requests, :language_from, :string
    add_column :requests, :language_to, :string
  end
end
