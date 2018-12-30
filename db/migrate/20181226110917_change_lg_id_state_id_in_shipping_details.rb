class ChangeLgIdStateIdInShippingDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column :shipping_details, :lg_id, :lg
    rename_column :shipping_details, :state_id, :state
  end
end
