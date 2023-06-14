class Category < ApplicationRecord
	has_many :complaints,  dependent: :destroy
	has_many :users, through: :complaints
	validates :title, presence: true,uniqueness: true, length: {minimum: 3, maximum: 30}
	validates :description, presence: true,length: {minimum: 3, maximum: 50}
end
