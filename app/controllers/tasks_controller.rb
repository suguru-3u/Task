class TasksController < ApplicationController
before_action :set_project, only: [:edit, :update, :destroy]

  def new
    @today = Date.today
    @task = Task.new
    @tasks = current_user.tasks.last(3)
  end

  def index
    @tasks = current_user.tasks
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end
      format.csv do
          #csv用の処理を書く
          send_data render_to_string, filename: "(Tasks).csv", type: :csv
      end
    end
  end

  def import
    Tasks.import(params[:file])
    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to new_task_path
    else
      @tasks = Task.all
      render :new
    end
  end

  def edit
  end

  def update
  	if @task.update(task_params)
  		redirect_to tasks_path, notice: "successfully updated task!"
  	else
  		render :edit
  	end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "successfully delete task!"
  end

  private
  def task_params
    params.require(:task).permit(:name,:body,:end_date)
  end

  def set_project
  @task = Task.find(params[:id])
  end

end
