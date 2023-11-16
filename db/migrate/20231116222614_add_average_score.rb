class AddAverageScore < ActiveRecord::Migration[7.1]
  def change
    add_column :videogames, :average_score, :integer
  end
end
