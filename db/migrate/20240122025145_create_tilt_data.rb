class CreateTiltData < ActiveRecord::Migration[7.1]
  def change
    create_table :tilt_data do |t|
      t.references :beer, null: false, foreign_key: true
      t.string :color
      t.integer :temp_fahrenheit
      t.integer :temp_celsius
      t.float :gravity
      t.datetime :timestamp, index: true

      t.timestamps
    end
  end
end
