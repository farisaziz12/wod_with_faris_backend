class UserSessionController < ApplicationController

    def class_users
        class_id = params[:class_id]
        class_id = class_id.to_i
        usersessions = UserSession.where(session: class_id)
        render json: usersessions
    end

    def book_session
        user_id = params[:user_id]
        session_id = params[:session_id]
        booking = UserSession.create(user_id: user_id, session_id: session_id)
        usersessions = UserSession.where(session: session_id)
        render json: usersessions
    end

    def destroy
        user_id = params[:user_id]
        session_id = params[:session_id]
        booking = UserSession.find_by(user_id: user_id, session_id: session_id)
        booking.destroy
        render json: booking
    end

end
