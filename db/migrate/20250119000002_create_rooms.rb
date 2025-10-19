class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :airport, null: false, foreign_key: true, index: { unique: true }
      t.timestamps
    end
  end
end
