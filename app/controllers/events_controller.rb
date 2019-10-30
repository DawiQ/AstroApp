class EventsController < AstroController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end
end
