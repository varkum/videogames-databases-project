class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.integer :value
      t.belongs_to :videogame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
