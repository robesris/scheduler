class AddTitleToRaids < ActiveRecord::Migration
  def self.up
    add_column :raids, :title, :string
  end

  def self.down
    remove_column :raids, :title
  end
end
