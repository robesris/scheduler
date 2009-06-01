class Raid < ActiveRecord::Base
  belongs_to :instance
  belongs_to :realm
  
  validates_presence_of :instance_id
  validates_presence_of :raid_time
  validates_presence_of :code
end
