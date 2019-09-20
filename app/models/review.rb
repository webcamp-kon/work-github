class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product

	 include Discard::Model
  default_scope -> { joins(:user).merge(User.kept) }
end
