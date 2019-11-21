class OrderList < ApplicationRecord
    belongs_to :order_history
    belongs_to :product, -> {with_discarded}
    include Discard::Model
end
