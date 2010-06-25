class Race < ActiveRecord::Base
  belongs_to :faction
  
  validates_presence_of :faction, :name
end

# == Schema Information
#
# Table name: races
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ability    :string(255)
#  faction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

