class Task < ActiveRecord::Base
  after_initialize :default_values
  
  attr_accessible :dead_line, :priority, :status, :task, :task_name
  validates :priority, numericality: {greater_than_or_equal_to: 0}
  validates :task, :task_name, presence: true
  
  
  private
    def default_values
      self.status ||= "in action"
      self.priority ||= 0
    end
  
end
