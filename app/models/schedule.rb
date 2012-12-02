class Schedule < ActiveRecord::Base
  attr_accessible :today 
  belongs_to :user
  has_many  :todos, :order => :position
  has_many  :tasks, :through => :todos
end
