class Raid < ActiveRecord::Base
  belongs_to :instance
  belongs_to :realm
  belongs_to :creator, :class_name => "Character"
  has_many :sign_ups
  has_many :characters, :through => :sign_ups
  
  validates_presence_of :instance_id
  validates_presence_of :realm_id
  validates_presence_of :raid_time
  validates_presence_of :code
  
  validates_each :creator_id do |record, attr, value|
    record.errors.add attr, 'Alliance players cannot create raids.' if record.creator.faction.name == "Alliance"
  end
  
  validates_each :raid_end_time do |record, attr, value|
    record.errors.add attr, 'End time must be later than start time.' if !record.raid_time.nil? and !record.raid_end_time.nil? and value <= record.raid_time
  end

  def full?
    self.characters.size >= self.instance.size
  end

  def signup(character_name)
    if signup_character = Character.find_by_name(character_name)
      if !self.full?
        self.characters += [signup_character]
        :success
      else
        :full
      end
    else
      :character_not_found
    end
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

