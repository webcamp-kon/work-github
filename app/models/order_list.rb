class OrderList < ApplicationRecord
    belongs_to :order_history
    belongs_to :product
    include Discard::Model
end
