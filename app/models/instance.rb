class Instance < ActiveRecord::Base
  belongs_to :instance_name
  belongs_to :expansion
  has_many :raids
end
