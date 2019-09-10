class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :product
     include Discard::Model
  default_scope -> { joins(:user).merge(User.kept) }
end
