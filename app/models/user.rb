class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :deliveries, dependent: :destroy, inverse_of: :user
         has_many :reviews
         has_many :favorites
         has_many :order_histories
         has_many :cart_items
         include Discard::Model
         default_scope -> { kept }
         accepts_nested_attributes_for :deliveries, allow_destroy: true
end
