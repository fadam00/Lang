class AddAttachmentToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :attachment, :string
  end
end
