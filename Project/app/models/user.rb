class User < ApplicationRecord
	has_many :requests, dependent: :destroy
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save {email.downcase!}
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 255},
			 format: {with: VALID_EMAIL_REGEX},
			 uniqueness: {case_sensitive: false}
		has_secure_password
		validates :password, presence: true, length: {minimum: 6}
		acts_as_messageable


def feed
	Request.where("user_id = ?", id)
end

end



