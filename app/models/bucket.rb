class Bucket < ApplicationRecord
  belongs_to :account
  belongs_to :bucketable, polymorphic: true
  has_many :recordings
end
