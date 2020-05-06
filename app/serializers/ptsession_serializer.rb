class PtsessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :location, :description, :time, :paid, :price, :pt_session

end
