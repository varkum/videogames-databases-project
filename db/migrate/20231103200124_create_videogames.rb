class CreateVideogames < ActiveRecord::Migration[7.1]
  def change
    create_table :videogames do |t|
      t.string :name
      t.integer :platform
      t.integer :year
      t.string :developer
      t.integer :genre
      t.integer :editorschoice

      t.timestamps
    end
  end
end
