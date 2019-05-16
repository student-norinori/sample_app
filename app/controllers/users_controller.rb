class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # => app/views/users/show.html.erb
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to @user
    else
      flash[:success] = "Welcome to the Sample App!"
      render 'new'
    end
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

end

