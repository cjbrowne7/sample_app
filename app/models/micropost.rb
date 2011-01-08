class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  max_characters = 140
  
  validates :content, :presence => true, :length => { :maximum => max_characters }
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
  
  # Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private
  
    # Return an SQL condition for users followed by the given user.
    # We include the users's own id as well.
    
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships 
                     WHERE follower_id = :user_id)
      where("user_id IN (#{followed_ids}) OR user_id = :user_id",
             { :user_id => user})
    end  
end
