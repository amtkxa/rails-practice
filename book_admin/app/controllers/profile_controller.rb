class ProfileController < ApplicationController
  def show
    user = current_user
    user.update(user_params)
  end

  def edit
    if current_user.admin?
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end

  def update
  end
end
