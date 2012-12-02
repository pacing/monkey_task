class Task < ActiveRecord::Base
  belongs_to :user 
  has_one :todo
  attr_accessible :name,:due,:user_id
end
