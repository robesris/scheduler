require 'test_helper'

class RaidTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: raids
#
#  id             :integer         not null, primary key
#  instance_id    :integer
#  raid_time      :datetime
#  code           :string(255)
#  password       :string(255)
#  searchable     :boolean
#  protected      :boolean
#  creator_id     :integer
#  min_gear_level :integer
#  tanks          :integer
#  heals          :integer
#  dps            :integer
#  created_at     :datetime
#  updated_at     :datetime
#  raid_end_time  :datetime
#  realm_id       :integer
#

