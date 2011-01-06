class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  max_characters = 140
  
  validates :content, :presence => true, :length => { :maximum => max_characters }
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
end
