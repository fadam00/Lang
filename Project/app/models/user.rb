class User < ApplicationRecord
	has_many :requests, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "watcher_id",
									dependent: 	:destroy
	  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "watched_id",
                                   dependent:   :destroy

	has_many :watching, through: :active_relationships, source: :watched 
	 has_many :watchers, through: :passive_relationships

	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save {email.downcase!}
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 255},
			 format: {with: VALID_EMAIL_REGEX},
			 uniqueness: {case_sensitive: false}
	validates :role, presence: true
		has_secure_password
		validates :password, presence: true, length: {minimum: 6}
		

		acts_as_messageable



	def mailboxer_email(object)
		self.email
	end

	def mailboxer_name
		self.name
	end

	def feed
    watching_ids = "SELECT watched_id FROM relationships
                     WHERE  watcher_id = :user_id"
    Request.where("user_id IN (#{watching_ids})
                     OR user_id = :user_id", user_id: id)
	end

	def watch(other_user)
		active_relationships.create(watched_id: other_user.id)
	end

	def unwatch(other_user)
		active_relationships.find_by(watched_id: other_user.id).destroy
	end

	def watching?(other_user)
		watching.include?(other_user)
	end
end



