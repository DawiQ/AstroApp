ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :date, :preference_id, :type, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:date, :preferences_id, :type, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.inputs :name
      f.inputs :type
      f.inputs :date, as: :date_time_picker
      f.inputs :preference
    end

    f.actions
  end
end
