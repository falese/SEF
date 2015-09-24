class UsersController < ApplicationController

def index
  @users = User.all
end

def show
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
end

def update

end

def destroy
end

end

private


def get_user
end

def user_params
  params.require(:user).permit(:user_name, :bank, :bank_user_name, :email, :bank_password)
end
