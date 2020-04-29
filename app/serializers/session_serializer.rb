class SessionSerializer < ActiveModel::Serializer
  attributes :name, :description, :class_capacity, :date, :time, :coach, :id

  def coach
    if object.user_id
      User.find(object.user_id)
    else
      nil
    end
  end
end
