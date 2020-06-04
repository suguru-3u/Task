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
      format.html
      format.csv{ send_data @tasks.generate_csv,fiilename: "tasks-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
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

  def import
    if params[:file]
      current_user.tasks.import(params[:file])
      redirect_to tasks_path,notice:"タスクを追加しました"
    else
      redirect_to tasks_path,notice:"ファイルを選択してください"
    end
  end

  def search
   params[:name].empty? ? @tasks = current_user.tasks.none : @tasks = current_user.tasks.where('name LIKE(?)', "%#{params[:name]}%")
   respond_to do |format|
    format.html
    format.json
   end
  end

  private
  def task_params
    params.require(:task).permit(:name,:body,:end_date)
  end

  def set_project
  @task = Task.find(params[:id])
  end

end
