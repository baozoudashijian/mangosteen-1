class CreateValidatiions < ActiveRecord::Migration[7.0]
  def change
    create_table :validatiions do |t|
      t.string :email
      t.integer :kind, default: 1, null: false
      t.datetime :used_at

      t.timestamps
    end
  end
end
