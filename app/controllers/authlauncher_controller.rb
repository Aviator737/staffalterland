class AuthlauncherController < ApplicationController
  before_action :auth


  def auth
    if Account.find_by_login(params[:login])
      @user = Account.find_by_login(params[:login])
      @user.valid_password?(params[:password])
    else
      "nope"
    end
  end
end
