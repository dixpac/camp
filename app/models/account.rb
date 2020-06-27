class Account < ApplicationRecord
  has_many :buckets
  has_many :projects
end
