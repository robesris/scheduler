class Realm < ActiveRecord::Base
  belongs_to :region
  has_many :characters
  
  validates_uniqueness_of :name
end

# == Schema Information
#
# Table name: realms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  region_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

