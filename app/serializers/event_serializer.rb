class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :type

  def type
    Preference.find(object.preference_id).name
  end

  has_many :comments
end
