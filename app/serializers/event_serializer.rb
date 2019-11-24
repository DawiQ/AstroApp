class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :type

  def type
    Preference.find(object.preference_id).name
  end

  def comments
    object.comments.order("date")
  end

  has_many :comments, serializer: PrettyCommentSerializer
end
