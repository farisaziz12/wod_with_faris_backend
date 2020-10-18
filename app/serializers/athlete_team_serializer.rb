class AthleteTeamSerializer < ActiveModel::Serializer
  attributes :id :team

  def team
    if object.team
      print object.team
    else
      nil
    end
  end

end
