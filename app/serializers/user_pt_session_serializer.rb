class UserPtSessionSerializer < ActiveModel::Serializer
  attributes :id, :pt_session, :coach

  def coach
    if object.ptsession.coach
      object.ptsession.coach
    else
      nil
    end
  end


  def pt_session
    if object.ptsession
      Ptsession.find(object.ptsession.id)
    else
      nil
    end
  end

end
