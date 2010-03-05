require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: characters
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  faction_id :integer
#  race_id    :integer
#  class_id   :integer
#  level      :integer
#  gear_score :integer
#  created_at :datetime
#  updated_at :datetime
#  realm_id   :integer
#

