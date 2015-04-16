class CreateAccuTimes < ActiveRecord::Migration
  def change
    create_table :accu_times do |t|
      t.datetime :time

      t.timestamps null: false
    end
  end
end
