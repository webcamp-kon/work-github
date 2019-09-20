class Addresse < ApplicationRecord
    belongs_to :user,optional: true
    validates :address, presence: true
    validates :post_number, presence: true
end
