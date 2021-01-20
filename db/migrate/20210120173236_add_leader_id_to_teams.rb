class AddLeaderIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :leader_id, :integer
  end
end
