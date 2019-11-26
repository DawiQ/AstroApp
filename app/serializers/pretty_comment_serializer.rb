class PrettyCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :user_id, :user_email, :url, :user_first_name, :user_last_name

  def user_email
    User.find(object.user_id).email
  end
  def user_first_name
    User.find(object.user_id).first_name
  end
  def user_last_name
    User.find(object.user_id).last_name
  end

end
