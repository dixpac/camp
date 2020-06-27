class CreateRecordings < ActiveRecord::Migration[6.1]
  def change
    create_table :recordings do |t|
      t.references :bucket, null: false, foreign_key: true
      t.references :recordable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
