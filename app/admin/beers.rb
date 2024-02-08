ActiveAdmin.register Beer do
  config.filters = false

  permit_params :name, :alcohol_by_volume, :apparent_attenuation

  index do
    selectable_column
    id_column
    column :name
    column '# Tilt Entries' do |beer|
      link_to beer.tilt_data.count, admin_tilt_data_index_path(q: { beer_id_eq: beer.id })
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :alcohol_by_volume
      row :apparent_attenuation
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :alcohol_by_volume
      input :apparent_attenuation
    end

    actions
  end
end
