class UserSessionSerializer < ActiveModel::Serializer
  attributes :id, :user

  def user
    if object.user
      User.find(object.user.id)
    else
      nil
    end
  end

end
