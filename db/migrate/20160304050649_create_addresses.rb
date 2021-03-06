class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: :false
      t.string :city, null: :false
      t.string :state, null: :false
      t.string :zip,    null: :false
      t.belongs_to :location

      t.timestamps null: false
    end
  end
end
