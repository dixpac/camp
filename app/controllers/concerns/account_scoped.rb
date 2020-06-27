module AccountScoped
  extend ActiveSupport::Concern

  included do
    before_action do
      Current.account = Account.first
    end
  end
end
