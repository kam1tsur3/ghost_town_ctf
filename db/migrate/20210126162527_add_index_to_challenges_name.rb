class AddIndexToChallengesName < ActiveRecord::Migration[6.0]
  def change
    add_index :challenges, :name, unique: true
  end
end
