class AuthlauncherController < ApplicationController
  before_action :auth


def auth
  if params[:login] and params[:password]
    @user = Account.find_by_login(params[:login])
    if @user
      if @user.valid_password?(params[:password])
        render plain: "OK:#{params[:login]}"
      else
        render plain: "Неверный логин или пароль!"
      end
    else
      render plain: "Такого пользователя не существует!"
    end
  else
    render plain: "Не передан 1 из параметров!"
  end
end
end
