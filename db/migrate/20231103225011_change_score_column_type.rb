class ChangeScoreColumnType < ActiveRecord::Migration[7.1]
  def change
    rename_column :scores, :type, :rater
  end
end
