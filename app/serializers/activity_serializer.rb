class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :workout, :activity_type, :date, :calories_burned
end
