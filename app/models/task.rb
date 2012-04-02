class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :deadline
  validates :name, :presence => true
  validates :description, :presence => true
end
