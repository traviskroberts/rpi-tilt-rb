ActiveAdmin.register TiltData do
  permit_params :beer_id, :gravity, :temp_fahrenheit

  index do
    selectable_column
    id_column
    column :beer
    column :gravity
    column "Temperature (F)", :temp_fahrenheit
    column :timestamp
    actions
  end

  filter :beer_id, as: :select, collection: proc { Beer.all }

  show do
    attributes_table do
      row :id
      row :beer
      row :gravity
      row :temp_fahrenheit
      row :timestamp
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    inputs 'Details' do
      input :beer
      input :gravity
      input :temp_fahrenheit
    end

    actions
  end
end
