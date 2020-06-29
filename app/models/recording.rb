class Recording < ApplicationRecord
  belongs_to :bucket
  belongs_to :parent, class_name: "Recording", optional: true
  has_many :children, class_name: 'Recording', foreign_key: :parent_id

  delegated_type :recordable, types: %w[ Message Comment ]
end
