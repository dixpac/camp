class Project < ApplicationRecord
  belongs_to :account
  has_one :bucket, as: :bucketable, touch: true
end
