class Product < ApplicationRecord
    belongs_to :lebel,:artist,:genre
    has_many :review


end
