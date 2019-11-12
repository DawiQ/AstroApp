class PreferencesController < AstroController
  def index
    render json: Preference.all
  end

  def set_my_preferences
    prefs = Preference.find(params["ids"])
    @current_user.preferences = prefs
    @current_user.save!
    render json: { added: true, errors: []}
  rescue => e
    render json: { added: false, errors: [e] }
  end

  def get_my_preferences
    render json: @current_user.preferences
  rescue => e
    render json: { errors: [e] }
  end
end
