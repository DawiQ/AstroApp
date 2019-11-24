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

  def create # 02-12-2019
    return render json: { errors: "No date given" } if params["date"].blank?
    @latitude = 51.759
    @longitude = 19.457
    sun_times = SunTimes.new
    date = params["date"]
    # date_time = DateTime.strptime(params["date"], '%d-%m-%Y')
    event_start_time = sun_times.set(Time.zone.parse(date), @latitude, @longitude) + 3.hours

    event = Event.create(
      name: params["name"],
      user_id: @current_user.id,
      date: event_start_time,
      preference_id: params["preference_id"].present? ? params["preference_id"] : Preference.find_by(name: "User Event").id
    )
    render json: event
  rescue => e
    render json: { errors: [e] }
  end
end
