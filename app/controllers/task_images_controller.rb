class TaskImagesController < ApplicationController
  before_action :set_task_image, only: [:show, :edit, :update, :destroy]

  # GET /task_images
  # GET /task_images.json
  def index
    @task_images = TaskImage.all
  end

  # GET /task_images/1
  # GET /task_images/1.json
  def show
  end

  # GET /task_images/new
  def new
    @task_image = TaskImage.new
  end

  # GET /task_images/1/edit
  def edit
  end

  # POST /task_images
  # POST /task_images.json
  def create
    @task_image = TaskImage.new(task_image_params)

    respond_to do |format|
      if @task_image.save
        format.html { redirect_to @task_image, notice: 'Task image was successfully created.' }
        format.json { render :show, status: :created, location: @task_image }
      else
        format.html { render :new }
        format.json { render json: @task_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_images/1
  # PATCH/PUT /task_images/1.json
  def update
    respond_to do |format|
      if @task_image.update(task_image_params)
        format.html { redirect_to @task_image, notice: 'Task image was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_image }
      else
        format.html { render :edit }
        format.json { render json: @task_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_images/1
  # DELETE /task_images/1.json
  def destroy
    @task_image.destroy
    respond_to do |format|
      format.html { redirect_to task_images_url, notice: 'Task image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_image
      @task_image = TaskImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_image_params
      params.require(:task_image).permit(:task_id, :image)
    end
end
