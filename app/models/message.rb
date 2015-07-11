class Message < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :content, :user_id,	presence: true
end
