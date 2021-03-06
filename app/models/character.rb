class Character < ActiveRecord::Base
  has_and_belongs_to_many :raids
  has_many :roles
  has_many :sign_ups
  belongs_to :race
  belongs_to :realm
  belongs_to :faction
  
  validates_uniqueness_of :name, :scope => [:realm_id]
  
  attr_reader :doc
  
  def get_remote_xml
    if name && realm.name
      @doc = Hpricot.XML(
        open("http://www.wowarmory.com/character-sheet.xml?r=#{realm.name}&cn=#{name}",
             "User-Agent" => "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10"))
      race_name = @doc.at("character")['race']
      faction_name = @doc.at("character")['faction']
      realm_name = @doc.at("character")['realm']
      self.update_attribute(:race, Race.find_by_name(race_name))
      self.update_attribute(:faction, Faction.find_by_name(faction_name))
      self.update_attribute(:realm, Realm.find_by_name(realm_name))
    end
  end
  
  def self.fetch(conditions)
    first(:conditions => conditions)
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

