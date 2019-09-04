class Song < ApplicationRecord
    belongs_to :product,optional: true
    belongs_to :disc,optional: true
end
