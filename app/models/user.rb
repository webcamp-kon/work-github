class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :addreses
         has_many :reviews
         has_many :favorites
         has_many :order_histories
   def erase
    user = User.find(params[:id])
    user.is_deleted = true
    user.save
   end
end
