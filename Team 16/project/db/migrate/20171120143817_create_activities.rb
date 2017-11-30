class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.belongs_to :user, index: true
      t.belongs_to :company, index: true
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
