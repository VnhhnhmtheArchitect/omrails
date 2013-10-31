class Mark < ActiveRecord::Base
  attr_accessible :description

  validates :user_id, presence: true
  
  belongs_to :user
  validates :user_id, presence: true
end
