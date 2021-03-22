class UsersController < ApplicationController
  def edit
  end


  private

  def user_params
    params.require(:user).permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana])
  end
end
 
end
