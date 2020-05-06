class UserPtSessionsController < ApplicationController


    def get_user_pt_sessions
        user = User.find_by(email: params[:email])
        allptsessions = UserPtSession.where(user_id: user.id)
        pt_sessions_this_week = allptsessions.select { |ptsession| ptsession.ptsession.date.between?(Date.current, Date.current + 7) }
        render json: pt_sessions_this_week
    end

end
