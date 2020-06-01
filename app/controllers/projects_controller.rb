class ProjectsController < ApplicationController
  before_action :set_project, only:[:show,:update,:destroy]
  before_action :set_group, only:[:create,:show,:update,:destroy]

  def create
    @project = Project.new(project_params)
    @project.group_id = @group.id
    @project.save
    redirect_to group_path(@group)
  end

  def show
  end

  def update
    if @project.update(project_params)
  		redirect_to group_path(@group), notice: "successfully update task!"
  	else
  		render :show
  	end
  end

  def destroy
    @project.destroy
    redirect_to group_path(@group), notice: "successfully delete task!"
  end

  private
  def project_params
    params.require(:project).permit(:name,:body,:responsible,:end_date)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end


end
