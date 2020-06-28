class AddParentIdToRecordings < ActiveRecord::Migration[6.1]
  def change
    add_reference :recordings, :parent, foreign_key: { to_table: :recordings }, null: true
  end
end
