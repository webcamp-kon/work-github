class OrderHistory < ApplicationRecord
	belongs_to :user
	belongs_to :address,optional: true
	has_many :order_lists, dependent: :destroy
	validates :step, presence: true
	validates :method_of_pay, presence: true
	validates :buy_date, presence: true
	validates :step, presence: true
	validates :order_status, presence: true
	validates :delivery_fee, presence: true
	validates :send_to_first_name, presence: true
	validates :send_to_last_name, presence: true
	validates :send_to_address, presence: true
	validates :send_to_post_number, presence: true
end
