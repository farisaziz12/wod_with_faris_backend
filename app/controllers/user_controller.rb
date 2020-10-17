class UserController < ApplicationController

  def purchase_passes
    Stripe.api_key = ENV['STRIPE_API_KEY']
    amount = params[:quantity] * 1500
    intent = Stripe::PaymentIntent.create({
      amount: amount,
      currency: 'chf',
      description: params[:description]
    })
    if intent
      render json: {client_secret: intent.client_secret}.to_json
    end
  end

  def pay_for_pt_session
    Stripe.api_key = ENV['STRIPE_API_KEY']
    amount = params[:price] * 100
    intent = Stripe::PaymentIntent.create({
      amount: amount,
      currency: 'chf',
      description: params[:description]
    })
    if intent
      render json: {client_secret: intent.client_secret}.to_json
    end
  end


  def get_user
    email = params[:email]
    user = User.find_by(email: email)
    render json: user
  end

  def store_profile_img
    img = params[:img]
    id = params[:user_id]
    user = User.find(id)
    user.update(image: img)
    render json: user
  end

  def add_class_passes
    quantity = params[:quantity]
    user = User.find_by(email: params[:user_email])
    current_tokens = user.tokens
    final_tokens = current_tokens + quantity
    user.update(tokens: final_tokens)
    render json: user
  end

  def get_all_attendances
    require 'date'
    users = User.all
    attendances_and_activites = users.map{|user| { "user" => user.first_name + " " + user.last_name, "attendances_and_activities" => user.sessions.select{|session| session.date.past?}.length + user.activities.length, "calories_burned" => user.sessions.select{|session| session.date.past?}.length * 500 + user.activities.reduce(0){|result, activity| result += activity.calories_burned} }}
    filtered_attendances_and_activites = attendances_and_activites.select{|user| user["attendances_and_activities"] > 0}
    render json: filtered_attendances_and_activites
  end


  def user_exists
    email = params[:email]
    user = User.find_by(email: email)
    if user
      render json: true
    else
      render json: false
    end
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
    params.require(:user).permit( :coach, :email, :first_name, :last_name, :tokens)
  end

end
