ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, preference_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name

      panel "Preferences " do
        table_for resource.preferences do
          column :name
        end
      end

    end
  end

  form :multipart => true do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :preference_ids, as: :check_boxes, collection: Preference.all, minimum_input_length: 0
    end

    f.actions
  end

end
