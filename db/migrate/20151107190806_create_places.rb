class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :country, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.string :name
      t.date :begins_at
      t.date :ends_at

      t.timestamps null: false
    end
  end
end
