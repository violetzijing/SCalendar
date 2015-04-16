class UpdateColumnInWeather < ActiveRecord::Migration
  def change
    remove_column :weathers, :wind_direction, :string
    add_column    :weathers, :wind_degree, :integer
  end
end
