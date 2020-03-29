class SessionController < ApplicationController


    def index
        date = params[:date]
        sessions = Session.where(date: date)
        render json: sessions 
    end


    def create
        session = Session.create(session_params)
          if session.valid?
            render json: session
          else
            render json: {message: session.errors.full_messages[0]}, status: :not_acceptable
          end 
      end

    def update
        session = Session.find(params[:id])
        session.update(session_params)
        if session.valid?
            render json: session
        else
            render json: {message: session.errors.full_messages[0]}, status: :not_acceptable
        end 
    end
    
    def destroy
    session = Session.find(params[:id])
    session.destroy
    end
    
    
    private

    def session_params
    params.require(:session).permit(:name, :description, :date, :time, :coach_id)
    end 
end
