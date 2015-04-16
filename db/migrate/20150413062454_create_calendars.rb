class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.datetime :accu_time_id
      t.string :tips

      t.timestamps null: false
    end
  end
end
