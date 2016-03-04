class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: :false
      t.date :start_date, null: :false
      t.date :end_date, null: :false

      t.timestamps null: false
    end
  end
end
