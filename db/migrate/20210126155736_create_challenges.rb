class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.string :flag
      t.integer :point
      t.string :category
      t.string :file_path, default: nil
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
