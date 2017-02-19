class UsersController < ApplicationController
  def show
    @user = Account.find(params[:id])
  end
end
