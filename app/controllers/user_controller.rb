class UserController < ApplicationController


  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user

      { token: issue_token({ id: user.id }), user: user }
    else
      render json: { error: "Email/password combination is invalid." }, status: 401
    end
  end

  def validate
        if logged_in?
            render json: @current_user
        else
            render json: { errors: ["Not Logged in"] }, status: :not_acceptable
        end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user
    else
      render json: {message: user.errors.full_messages[0]}, status: :not_acceptable
    end 
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit( :coach, :email, :password, :first_name, :last_name)
  end

end
