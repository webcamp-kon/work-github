class Product < ApplicationRecord
    belongs_to :label,:artist,:genre
    has_many :review,:favorites,:cart_item,order_list,:arrivalmanagement,:disc



end
