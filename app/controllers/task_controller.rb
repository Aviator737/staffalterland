class TaskController < ApplicationController
  before_action :authenticate_user!
  before_action :is_builder?
  layout 'dashboard'
  def index
    @task = Task.all
  end

  def new
  @task = Task.new
  @task_image = @task.task_images.build
  end

  def show
    @task = Task.find(params[:id])
    @task_image = @task.task_images.all
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        params[:task_images]['image'].each do |a|
          @task_image = @task.task_images.create!(:image => a)
        end
        format.html { redirect_to @task, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_index_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :coords, :workers, :time, task_images_attributes: [:id, :task_id, :image])
  end
  def is_builder?
    if (current_account.group).to_i < 2
      redirect_to edit_account_registration_path
    end
  end
end