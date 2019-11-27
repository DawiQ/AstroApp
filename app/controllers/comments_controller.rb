class CommentsController < AstroController
  def create
    return render json: { errors: "No event_id given" } if params["event_id"].blank?
    return render json: { errors: "No content given" } if params["content"].blank?

    comment = Comment.create(
      user_id: @current_user.id,
      event_id: params["event_id"],
      content: params["content"],
      url: params["url"],
      date: Time.zone.now,
    )

    render json: { success: comment, errors: [] }
  rescue => e
    render json: { success: false, errors: [e] }
  end

  def update
    return render json: { errors: "No id given" } if params["id"].blank?
    return render json: { errors: "No event_id given" } if params["content"].blank?

    if params["content"].present?
      comment = Comment.update(params["id"], {content: params["content"]})
    end
    if params["url"].present?
      comment = Comment.update(params["id"], {url: params["url"]})
    end

    render json: { success: comment, errors: [] }
  rescue => e
    render json: { success: false, errors: [e] }
  end

  def show
    render json: Comment.find(params["id"])
  rescue => e
    render json: { errors: [e] }
  end

  def delete
    Comment.find(params["id"]).delete
    render json: { success: true, errors: [] }
  rescue => e
    render json: { errors: [e] }
  end
end
