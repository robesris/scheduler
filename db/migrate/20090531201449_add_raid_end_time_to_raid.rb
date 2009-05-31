class AddRaidEndTimeToRaid < ActiveRecord::Migration
  def self.up
    add_column :raids, :raid_end_time, :datetime
  end

  def self.down
    remove_column :raids, :raid_end_time
  end
end
