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
         validates :last_name, {presence: true}
         validates :first_name, {presence: true}
         validates :last_name_kana, {presence: true}
         validates :first_name_kana, {presence: true}
         validates :address, {presence: true}
         validates :post_number, {presence: true}
         validates :telephone_number, {presence: true}
         validates :email, {presence: true}
         include Discard::Model
         default_scope -> { kept }
         accepts_nested_attributes_for :deliveries, allow_destroy: true
         def view_first_and_last
    self.last_name + ' ' + self.first_name
  end
end
