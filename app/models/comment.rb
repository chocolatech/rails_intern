class Comment < ActiveRecord::Base
validates :text, presence: true
belongs_to :post

scope :published_post, -> {where(published: true)}
end