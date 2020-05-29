class UserSessionController < ApplicationController

    def upcoming_classes
        email = params[:email]
        user = User.find_by(email: email)
        if user.coach == false
            allclasses = UserSession.where(user_id: user.id)
            upcoming_class_matches = allclasses.select { |session| session.session.date.between?(Date.current, Date.current + 7.days) }
            upcoming_classes = upcoming_class_matches.map{ |session| session.session }
            upcoming_classes_with_coach = upcoming_classes.map{|session| { 'class' => session, 'coach' => User.find(session.user_id)}}
            allptsessions = UserPtSession.where(user_id: user.id)
            pt_sessions_this_week = allptsessions.select { |ptsession| ptsession.ptsession.date.between?(Date.current, Date.current + 7) }
            upcoming_classes_and_pt_sessions = {'classes' => upcoming_classes_with_coach, 'ptsessions' => pt_sessions_this_week.map{|pt| pt.ptsession}}
            render json: upcoming_classes_and_pt_sessions 
        end
        if user.coach == true
            allclasses = Session.where(user_id: user.id)
            upcoming_classes = allclasses.select { |session| session.date.between?(Date.current, Date.current + 7.days) }
            upcoming_classes_with_coach = upcoming_classes.map{|session| { 'class' => session, 'coach' => User.find(session.user_id)}}
            allptsessions = Ptsession.where(user_id: user.id)
            pt_sessions_this_week = allptsessions.select { |ptsession| ptsession.date.between?(Date.current, Date.current + 7) }
            pt_sessions_with_user = pt_sessions_this_week.map{|pt| { 'ptsession' => pt, 'user' => UserPtSession.find(pt.id).user}}
            upcoming_classes_and_pt_sessions = {'classes' => upcoming_classes_with_coach, 'ptsessions' => pt_sessions_with_user}
            render json: upcoming_classes_and_pt_sessions 
        end
    end

    def user_prev_sessions_current_tokens
        user = User.find(params[:id])
        sessions_prev_week = user.sessions.select { |session| session.date.between?(Date.current - 7, Date.current) }
        render json: { sessions_prev_week: sessions_prev_week.length, tokens: user.tokens }
    end


    def class_users
        class_id = params[:class_id]
        class_id = class_id.to_i
        usersessions = UserSession.where(session: class_id)
        render json: usersessions
    end

    def book_session
        user_id = params[:user_id]
        session_id = params[:session_id]
        session_exists = UserSession.find_by(user_id: user_id,  session_id: session_id)
        if session_exists == nil 
            user = User.find(user_id)
            user.update(tokens: user.tokens - 1)
            booking = UserSession.create(user_id: user_id, session_id: session_id)
            usersessions = UserSession.where(session: session_id)
            render json: usersessions
        elsif session_exists != nil
            render json: session_exists
        end
    end

    def destroy
        user_id = params[:user_id]
        session_id = params[:session_id]
        user = User.find(user_id)
        user.update(tokens: user.tokens + 1)
        booking = UserSession.find_by(user_id: user_id, session_id: session_id)
        booking.destroy
        render json: booking
    end

end
