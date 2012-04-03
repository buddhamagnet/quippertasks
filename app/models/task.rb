class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :deadline, :completed
  validates :name, :presence => true
  validates :description, :presence => true
  validates :deadline, :presence => true
  
  scope :expired, where("deadline < ?", Date.today)
end