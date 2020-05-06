class UserPtSessionsController < ApplicationController


    def get_user_pt_sessions
        user = User.find(params[:id])
        if user.coach == true
            allptsessions = Ptsession.where(user_id: user.id)
            pt_sessions_this_week = allptsessions.select { |ptsession| ptsession.date.between?(Date.current, Date.current + 7) }
            pt_sessions_with_user = pt_sessions_this_week.map{|pt| { 'ptsession' => pt, 'user' => UserPtSession.find(pt.id).user}}
            render json: pt_sessions_with_user
        elsif user.coach == false
            allptsessions = UserPtSession.where(user_id: user.id)
            pt_sessions_this_week = allptsessions.select { |ptsession| ptsession.ptsession.date.between?(Date.current, Date.current + 7) }
            render json: pt_sessions_this_week
        end
    end

end
