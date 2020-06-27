class CreateBuckets < ActiveRecord::Migration[6.1]
  def change
    create_table :buckets do |t|
      t.references :account, null: false, foreign_key: true
      t.references :bucketable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
