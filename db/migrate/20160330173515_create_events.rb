class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :website
      t.boolean :published
      t.datetime :time
      t.string :location
      t.decimal :loc_lng
      t.decimal :loc_lat

      t.timestamps null: false
    end
  end
end
