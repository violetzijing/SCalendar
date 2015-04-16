class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :accu_time_id
      t.string :main
      t.string :temp
      t.string :temp_max
      t.string :temp_min
      t.string :pressure
      t.integer :wind_speed
      t.string :wind_direction

      t.timestamps null: false
    end
  end
end
