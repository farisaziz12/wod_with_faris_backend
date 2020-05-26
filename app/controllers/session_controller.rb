class SessionController < ApplicationController


    def index
        sessions = Session.all.select{|session| !session.date.past?}
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

    def return_tokens
        client_ids = params[:client_ids]
        client_ids.each do |id| 
            user = User.find(id) 
            user.update(tokens: user.tokens + 1)
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
        render json: session
        session.destroy
    end
    
    
    private

    def session_params
        params.require(:session).permit(:name, :description, :date, :class_capacity, :time, :user_id)
    end 
end
