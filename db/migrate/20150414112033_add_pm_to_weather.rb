class AddPmToWeather < ActiveRecord::Migration
  def up
    add_column :weathers, :pm25, :integer
  end
end
