class EventsController < AstroController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def current_event
    prefs = @current_user.preference_ids
    events = Event.where("date > ?", Time.zone.now).order(:date)

    if prefs.present?
      render json: events.where(preference_id: @current_user.preference_ids).limit(1)
    else
      render json: events.limit(1)
    end
  end

  def my_events
    render json: Event.where(preference_id: @current_user.preference_ids)
  end
end
