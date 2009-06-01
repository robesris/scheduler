class Raid < ActiveRecord::Base
  belongs_to :instance
  belongs_to :realm
  belongs_to :creator, :class_name => "Character"
  has_and_belongs_to_many :characters
  
  validates_presence_of :instance_id
  validates_presence_of :raid_time
  validates_presence_of :code
  
  validates_each :creator_id do |record, attr, value|
    record.errors.add attr, 'Alliance players cannot create raids.' if record.creator.faction.name == "Alliance"
  end
  
  validates_each :raid_end_time do |record, attr, value|
    record.errors.add attr, 'End time must be later than start time.' if (record.raid_time != nil) && (value <= record.raid_time)
  end

  def signup(character_name)
    if signup_character = Character.find_by_name(character_name)
      # Sign them up
    else
      # Fail
    end
  end
end
