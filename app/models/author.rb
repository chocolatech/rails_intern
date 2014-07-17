class Author < ActiveRecord::Base
	has_many :posts
  belongs_to :user
	validates :name, :email, presence: true
end