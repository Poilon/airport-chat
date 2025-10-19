class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :city
      t.string :country
      t.timestamps
    end
    
    add_index :airports, :code, unique: true
    add_index :airports, :name
  end
end
