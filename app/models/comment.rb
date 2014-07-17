class Comment < ActiveRecord::Base
validates :text, presence: true

scope :published_post, -> {where(published: true)}
end