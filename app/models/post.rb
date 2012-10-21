class Post < ActiveRecord::Base
  attr_accessible :title, :body, :published

  validates :title, :body, presence: true

  def self.publish_posts(posts)
    Post.transaction do
      posts.each do |post|
        post.update_attributes published: true
      end
    end
  end
end
