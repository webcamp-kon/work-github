class Product < ApplicationRecord
    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :reviewes
    has_many :favorites
    has_many :cart_item
    has_many :order_lists
    has_many :arrivalmanagements
    has_many :discs
    has_many :songs,through: :discs
    attachment :jacket_image
    accepts_nested_attributes_for :discs,allow_destroy: true
    accepts_nested_attributes_for :songs,allow_destroy: true
    def self.search(search)
      if search
        Product.where(['name LIKE ?', "#{search}"])
      else
        Product.all
      end
    end
    def self.ranking
        Product.select('products.*', 'count(favorites.id) AS favs')
    .left_joins(:favorites)
    .group('products.id')
    .order('favs desc').first(5)
    end
end
