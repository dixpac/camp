class RemoveTimestampsFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :created_at, :string
    remove_column :comments, :updated_at, :string
  end
end
