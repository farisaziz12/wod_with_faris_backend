class TeamController < ApplicationController

    def all_teams
        teams = Team.all
        if teams[0]
          render json: teams
        else
          render json: {message: "No Teams"}, status: :bad_request
        end 
    end

    def create_team
        team = Team.create(team_params)
        if team.valid?
          render json: team
        else
          render json: {message: team.errors.full_messages[0]}, status: :not_acceptable
        end 
    end

    def join_team
        email = params[:email]
        team = params[:team_id]
        user = User.find_by(email: email)
        athlete_team =  AthleteTeam.all.filter {|athleteteam| athleteteam.id = team}

        if athlete_team.length < 4 and athlete_team.find {|team| team.user.id == user.id} == nil
            AthleteTeam.create(user_id: user.id, team_id: team)
            if athlete_team[0].valid?
                render json: athlete_team.map {|team| team.user}
              else
                render json: {message: athlete_team.errors.full_messages[0]}, status: :bad_request
            end 
        else
            render json: {message: "Team Full"}, status: :bad_request
        end
    end

    def my_team
        email = params[:email]
        user = User.find_by(email: email)
        athlete_team = AthleteTeam.find_by(user_id: user.id)
        team_athletes = AthleteTeam.all.filter {|team| team.id = athlete_team.team_id}
        team = team_athletes.map {|team| team.user}
        
        if team[0]
            render json: team
          else
            render json: {message: "No Team"}, status: :bad_request
        end 
    end
    
    private

    def team_params
        params.require(:team).permit( :name, :category)
    end

end
