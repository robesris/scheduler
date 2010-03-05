class Expansion < ActiveRecord::Base
  has_one :instance
end

# == Schema Information
#
# Table name: expansions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

