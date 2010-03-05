require 'test_helper'

class InstanceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: instances
#
#  id           :integer         not null, primary key
#  size         :integer
#  expansion_id :integer
#  level        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  difficulty   :string(255)
#  name         :string(255)
#

