class Addresse < ApplicationRecord
    belongs_to :user
    accepts_nested_attributes_for :addresses
end
