class MainController < ApplicationController
  before_action :authenticate_user!
  before_action :is_builder?
  layout 'dashboard'
  def index
    @post = Post.all
  end

  def show
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to main_index_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to main_index_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  def is_builder?
    if (current_account.group).to_i < 2
      redirect_to edit_account_registration_path
    end
  end
end
