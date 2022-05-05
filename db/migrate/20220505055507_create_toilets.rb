class CreateToilets < ActiveRecord::Migration[7.0]
  def change
    create_table :toilets do |t|
      t.string :name, null: false
      t.string :uuid
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
