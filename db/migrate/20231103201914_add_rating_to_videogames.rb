class AddRatingToVideogames < ActiveRecord::Migration[7.1]
  def change
    add_column :videogames, :rating, :integer
  end
end
