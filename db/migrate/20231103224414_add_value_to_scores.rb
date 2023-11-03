class AddValueToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :value, :integer
  end
end
