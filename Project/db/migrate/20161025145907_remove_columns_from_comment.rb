class RemoveColumnsFromComment < ActiveRecord::Migration[5.0]
  def change

  	remove_column :comments, :user_id, :integer
  	remove_column :comments, :user_id, :index
  end
end