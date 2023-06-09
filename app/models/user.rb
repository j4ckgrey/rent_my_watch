class User < ApplicationRecord
  has_many :rentals
  has_many :watches, dependent: :destroy
  has_many :notifications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
