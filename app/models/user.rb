class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :tasks do
            def overdue
                find(:all,:conditions => ["due < ? and complete is null",Date.today.to_s])
            end
            def today
                find(:all,:conditions => ["due = ? and complete is null", Date.today.to_s])
            end
            def upcoming
                find(:all,:conditions => ["due > ? and complete is null",Date.today.to_s] )
            end
  end
  has_one  :schedule, :conditions => ["today = ?",Date.today.to_s]
end
