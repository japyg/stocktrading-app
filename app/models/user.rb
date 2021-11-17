class User < ApplicationRecord
  has_many :trade_functions
  has_many :stocks, through: :trade_functions
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :full_name, presence: true         

end
