class User < ApplicationRecord
	has_one_attached :image
	has_secure_password
	has_many :complaints, dependent: :destroy
	has_many :categories, through: :complaints
	enum role: [:admin, :user]
    validates :name, presence: true,length: {minimum: 3, maximum: 30}
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
	validates :password_digest, presence: true ,length: {minimum: 6}, uniqueness: true
	validates :mobile, presence: true ,length: {minimum: 10, maximum: 15}, uniqueness: true,numericality: { only_integer: true }
	# validates :image, presence: true
	validates :address, presence: true,length: {minimum: 3, maximum: 50}
end
