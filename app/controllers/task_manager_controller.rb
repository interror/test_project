class TaskManagerController < ApplicationController
  def index
    @tasks = Task.order(:priority).all.group_by {|task| task.task_name}
  end
end
