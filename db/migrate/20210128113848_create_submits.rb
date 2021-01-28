class CreateSubmits < ActiveRecord::Migration[6.0]
  def change
    create_table :submits do |t|
      t.integer :chal_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
