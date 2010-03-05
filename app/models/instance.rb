class Instance < ActiveRecord::Base
  belongs_to :instance_name
  belongs_to :expansion
  has_many :raids
  
  validates_presence_of :name
  validates_numericality_of :size
end

# == Schema Information
#
# Table name: instances
#
#  id           :integer         not null, primary key
#  size         :integer
#  expansion_id :integer
#  level        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  difficulty   :string(255)
#  name         :string(255)
#

