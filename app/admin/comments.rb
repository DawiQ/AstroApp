ActiveAdmin.register Comment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :event_id, :date, :content, :url
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :event_id, :date, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :user
      row :event
      row :date
      row :url
      row :content
    end
  end

  form do |f|
    f.inputs do
      f.inputs :user
      f.inputs :event
      f.inputs :date, as: :date_time_picker
      f.inputs :url
      f.inputs :content
    end

    f.actions
  end
end
