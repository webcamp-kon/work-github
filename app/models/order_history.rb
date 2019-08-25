class OrderHistory < ApplicationRecord
	belongs_to :user
	belongs_to :address_id
end
