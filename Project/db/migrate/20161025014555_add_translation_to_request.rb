class AddTranslationToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :translation, :string
  end
end
