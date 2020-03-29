class UserSessionSerializer < ActiveModel::Serializer
  attributes :id, :user, :session

  def user
    if object.user
      User.find(object.user.id)
    else
      nil
    end
  end

  def session
    if object.session
      Session.find(object.session.id)
    else
      nil
    end
  end

end
