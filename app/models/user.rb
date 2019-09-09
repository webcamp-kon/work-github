class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :addreses
         has_many :reviews
         has_many :favorites
         has_many :order_histories
         has_many :cart_items
         include Discard::Model
         default_scope -> { kept }
end
