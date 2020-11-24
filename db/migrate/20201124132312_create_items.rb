class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :comment
      t.references :box, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.datetime :packing_date

      t.timestamps
    end
  end
end
