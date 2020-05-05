class ActivityController < ApplicationController

    def create
        activity = Activity.new(activity_params)
        user = User.find_by(email: params[:user_email])
        activity.user_id = user.id
        if activity.valid?
            activity.save
            render json: activity
          else
            render json: {message: activity.errors.full_messages[0]}, status: :not_acceptable
          end 
    end

    def get_user_activities
        user = User.find_by(email: params[:user_email])
        activities_this_week = user.activities.select { |activity| activity.date.between?(Date.current - 7, Date.current) }
        render json: activities_this_week
    end


    def update
        activity = Activity.find(params[:id])
        activity.update(activity_params)
          if activity.valid?
            render json: activity
          else
            render json: {message: activity.errors.full_messages[0]}, status: :not_acceptable
          end 
    end


    private

    def activity_params
        params.require(:activity).permit( :name, :date, :activity_type, :workout, :calories_burned, :duration)
    end
end
