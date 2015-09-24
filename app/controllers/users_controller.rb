class UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @user = User.find(get_user)
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to users_path
  else
    render 'new'
  end
end

def edit
  @user= get_user
end

def update
@user= get_user
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
end

def destroy
end

end

private


def get_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:user_name, :bank, :bank_user_name, :email, :bank_password)
end
