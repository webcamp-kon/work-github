class Product < ApplicationRecord
    belongs_to :label
    belongs_to :artist,optional: true
    belongs_to :genre
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :order_lists
    has_many :arrivalmanagements
    has_many :discs,inverse_of: :product,dependent: :destroy
    accepts_nested_attributes_for :discs,allow_destroy: true
    attachment :jacket_image
    validates :name, {presence: true}
    validates :price, {presence: true}
    validates :stock_quantity, {presence: true}
    include Discard::Model
    default_scope -> { kept }
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
    def favorited_by?(user)
          return favorites.where(user_id: user.id).exists?
    end
end
