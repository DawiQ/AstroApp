class EventsController < AstroController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def my_events
    render json: Event.where(preference_id: @current_user.preference_ids)
  end
end
