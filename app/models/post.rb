class Post < ActiveRecord::Base
validates :text, presence: true
has_many :comments
belongs_to :author

scope :published, -> {where(published: true)}
end