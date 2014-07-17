class Post < ActiveRecord::Base
validates :text, presence: true
has_many :comments
belongs_to :author

scope :published, -> {where(published: true)}
scope :published_and_commented, -> {published.where("comments_count > 0")}
end