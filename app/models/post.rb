class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy, :inverse_of => :parent_post
  has_many :post_authorings, :class_name => "UserPost", :dependent => :destroy
  has_many :authors, :through => :post_authorings, :class_name => "User"
  has_many :post_taggings, :class_name => "PostTag", :dependent => :destroy
  has_many :tags, :through => :post_taggings

  belongs_to :category

  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
end
