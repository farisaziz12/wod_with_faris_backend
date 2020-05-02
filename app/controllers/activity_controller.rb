class ActivityController < ApplicationController









    private

    def activity_params
        params.require(:activity).permit( :name, :date, :type, :workout, :calories_burned)
    end
end
