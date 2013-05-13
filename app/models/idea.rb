class Idea < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :user_id
  acts_as_voteable
  acts_as_commentable

  validates :title, :presence => true
  validates :description, :presence => true
  validates :user, :presence => true

  def self.similar_by_title(title)
    search_by_title(title)
  end
end
