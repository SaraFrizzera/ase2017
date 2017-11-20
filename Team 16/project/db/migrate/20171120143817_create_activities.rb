class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
