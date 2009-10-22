class Character < ActiveRecord::Base
  has_and_belongs_to_many :raids
  has_and_belongs_to_many :roles
  belongs_to :race
  belongs_to :realm
  belongs_to :faction
  
  def get_remote_xml
    if name && realm.name
      doc = Hpricot.XML(
        open("http://www.wowarmory.com/character-sheet.xml?r=#{realm.name}&n=#{name}",
             "User-Agent" => "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10"))
      race_name = doc.at("character")['race']
      self.update_attribute(:race, Race.find_by_name(race_name))
    end
  end

end
