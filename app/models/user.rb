class User < ApplicationRecord
  has_many :authored_comments, :class_name => :Comment, :dependent => :destroy
  has_many :post_authorings, :class_name => :PostUser, :dependent => :destroy
  has_many :authored_posts, :through => :post_authorings, :source => :post
  has_many :post_tags, :through => :authored_posts, :source => :post_taggings
  has_many :tags_on_authored_posts, :through => :post_tags, :source => :tag
end
