class Recording < ApplicationRecord
  belongs_to :bucket
  #belongs_to :recordable, polymorphic: true
  delegated_type :recordable, types: %w[ Message Comment ]
end
