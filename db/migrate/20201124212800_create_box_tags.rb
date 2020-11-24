class CreateBoxTags < ActiveRecord::Migration[6.0]
  def change
    create_table :box_tags do |t|
      t.references :box, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
