class User < ApplicationRecord

  has_many :deposits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
