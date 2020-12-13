class Bucket < ApplicationRecord
  belongs_to :account
  belongs_to :bucketable, polymorphic: true
  has_many :recordings


  def record(recordable, parent: nil, **options)
    recordable.save!

    options.merge!(recordable: recordable, parent: parent)
    recordings.create!(options)
  end

  def messages
    recordings.where(recordable_type: "Message")
  end
end
