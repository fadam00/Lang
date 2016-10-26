class Request < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :attachment, AttachmentUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :language_from, presence: true
  validates :laguage_to, presence: true
end
