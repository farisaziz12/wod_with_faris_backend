class UserController < ApplicationController

  def get_user
    email = params[:email]
    user = User.find_by(email: email)
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(email: params[:email], tokens: params[:tokens])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user
    else
      render json: {message: user.errors.full_messages[0]}, status: :not_acceptable
    end 
  end

  def index
    users = User.all
    render json: users
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit( :coach, :email, :first_name, :last_name)
  end

end
