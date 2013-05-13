class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  default_scope :order => 'created_at ASC'

  belongs_to :user

  validates :comment, :presence => true

  attr_accessible :commentable_type, :commentable_id, :comment
end
