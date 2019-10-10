class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product
	validates :title, {presence: true}
    validates :main_sentence, {presence: true}
end
