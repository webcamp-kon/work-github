class Song < ApplicationRecord
    belongs_to :product
    belongs_to :disc
end
