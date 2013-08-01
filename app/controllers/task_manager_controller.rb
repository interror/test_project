class TaskManagerController < ApplicationController
  def index
    @task_new = Task.new
    @tasks = Task.all.each do |obj|
    if obj.dead_line.acts_like?(:time)
      if obj.dead_line < (Time.now + (3*60*60))
          obj.status = "fail"
          obj.save
      end
    end  
    end
    @tasks = Task.order(:priority).all.group_by {|task| task.task_name}
  end
  
  def delete_by_name
  @task = Task.where task_name: (params[:task_name])
  @task.destroy_all

    respond_to do |format|
      format.html { redirect_to task_manager_url }
      format.json { head :no_content }
    end
  end

  def priority_add
    @task = Task.find(params[:id])
    @task.priority += 1
    @task.save
    
    respond_to do |format|
      format.html { redirect_to task_manager_url }
      format.json { head :no_content }
    end
  end

  def priority_sub
    @task = Task.find(params[:id])
    @task.priority -= 1
    @task.save
    
    respond_to do |format|
      format.html { redirect_to task_manager_url }
      format.json { head :no_content }
    end
  end

  def status
    @task = Task.find(params[:id])
    if @task.status == ("in action" or "fail")
      @task.status = "done"
    elsif @task.status
      @task.status = "in action"
    end
    @task.save
    
    respond_to do |format|
      format.html { redirect_to task_manager_url }
      format.json { head :no_content }
    end
  end
  

end
