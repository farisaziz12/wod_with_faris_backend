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


    def confrim_pt_session
        pt_session = Ptsession.find(params[:pt_session])
        pt_session.update(paid: true)
        render json: pt_session
    end


    def update
        pt_session = Ptsession.find(params[:id])
        pt_session.update(pt_session_params)
          if pt_session.valid?
            render json: pt_session
          else
            render json: {message: pt_session.errors.full_messages[0]}, status: :not_acceptable
          end 
    end

    def destroy
        pt_session = Ptsession.find(params[:id])
        render json: pt_session
        pt_session.destroy
      end



    def pt_session_params
        params.require(:ptsession).permit( :name, :date, :location, :description, :time, :paid, :price)
    end
end
