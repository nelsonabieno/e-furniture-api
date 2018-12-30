class ChangeLgAndStateToString < ActiveRecord::Migration[5.1]
  def change
    change_column :shipping_details, :lg, :string
    change_column :shipping_details, :state, :string
  end
end
