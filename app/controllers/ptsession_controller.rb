class PtsessionController < ApplicationController

    def create
        pt_session = Ptsession.new(pt_session_params)
        coach = User.find_by(email: params[:coach_email])
        pt_session.user_id = coach.id
        if pt_session.valid?
            pt_session.save
            client = User.find_by(email: params[:client_email])
            UserPtSession.create(ptsession_id: pt_session.id, user_id: client.id)
            render json: pt_session
          else
            render json: {message: pt_session.errors.full_messages[0]}, status: :not_acceptable
          end 
    end

    # def get_user_pt_session
    #     user = User.find_by(email: params[:user_email])
    #     pt_sessions_this_week = user.ptsessions.select { |ptsession| ptsession.date.between?(Date.current - 7, Date.current) }
    #     render json: pt_sessions_this_week
    # end


    def update
        pt_session = Ptsession.find(params[:id])
        pt_session.update(pt_session_params)
          if pt_session.valid?
            render json: pt_session
          else
            render json: {message: pt_session.errors.full_messages[0]}, status: :not_acceptable
          end 
    end



    def pt_session_params
        params.require(:ptsession).permit( :name, :date, :location, :description, :time, :paid)
    end
end
