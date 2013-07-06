class Task < ActiveRecord::Base
  attr_accessible :dead_line, :priority, :status, :task, :task_name
end
