class AddFieldsToBeers < ActiveRecord::Migration[7.1]
  def change
    add_column :beers, :alcohol_by_volume, :float
    add_column :beers, :apparent_attenuation, :float
  end
end
