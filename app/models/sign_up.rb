class SignUp < ActiveRecord::Base
  belongs_to :character
  belongs_to :raid
  belongs_to :role
  
  validates_presence_of :character
  validates_associated :character
  
  validates_presence_of :raid
  validates_associated :raid
  
  def role_name
    role && role.name
  end
end
