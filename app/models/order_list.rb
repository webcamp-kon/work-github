class OrderList < ApplicationRecord
    belongs_to :order_history,optional: true
end
