class Region < ActiveRecord::Base
  has_many :realms
end

# == Schema Information
#
# Table name: regions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

