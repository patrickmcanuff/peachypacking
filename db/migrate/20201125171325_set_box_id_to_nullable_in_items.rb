class SetBoxIdToNullableInItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :box_id, :bigint, null:true
  end
end
