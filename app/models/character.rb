class Character < ActiveRecord::Base
  has_and_belongs_to_many :raids
  has_and_belongs_to_many :roles
  belongs_to :faction
end
