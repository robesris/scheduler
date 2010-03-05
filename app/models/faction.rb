class Faction < ActiveRecord::Base
  has_many :races
  has_many :characters
end

# == Schema Information
#
# Table name: factions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

