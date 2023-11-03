class ConvertSaleToDec < ActiveRecord::Migration[7.1]
  def change
    change_column :sales, :value, :decimal
  end
end
