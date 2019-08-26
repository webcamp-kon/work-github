class Product < ApplicationRecord
    belongs_to :label,:artist,:genre
    has_many :reviewes,:favorites,:cart_item,:order_lists,:arrivalmanagements,:discs



end
