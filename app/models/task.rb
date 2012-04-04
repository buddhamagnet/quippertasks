class Task < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :document
  
  attr_accessible :description, :name, :deadline, :completed, :document
  
  validates :name, :presence => true
  validates :description, :presence => true
  validates :deadline, :presence => true
  validates_attachment :document, 
    :content_type => { :content_type => "text/plain" },
    :size => { :in => 0..30.kilobytes }
  
  scope :expired, where("deadline < ?", Date.today)
end