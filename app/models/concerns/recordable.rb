module Recordable
  extend ActiveSupport::Concern

  included do
    has_one :recording, as: :recordable, touch: true
  end
end
