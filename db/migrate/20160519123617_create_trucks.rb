class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
        t.string :from_loc
        t.string :from_country
        t.string :to_loc
        t.string :to_country
        t.int :distance
        t.int :duration
        t.references :user
        t.timestamps null: false
    end
  end
end
