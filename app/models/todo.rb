class Todo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :schedule
  belongs_to :task
  #  acts_as_list  :scope => :schedule
  validates_uniqueness_of :task_id , :on => :create,
                       :message => "Cannot add the same task twice", :scope => "schedule_id"
end
