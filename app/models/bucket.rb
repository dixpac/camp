class Bucket < ApplicationRecord
  belongs_to :account
  belongs_to :bucketable, polymorphic: true
  has_many :recordings

  def record(recordable, **options)
    recordable.save!

    options.merge!(recordable: recordable)
    recordings.create!(options)
  end
end
