Factory.define :character do |c|
  c.sequence(:name) { |n| "Character#{n}"}
  c.association :realm
  c.association :faction, :factory => :horde
end

Factory.define :race do |r|
  r.sequence(:name) { |n| "Tauren#{n}"}
end

Factory.define :faction do |f|
  f.sequence(:name) { |n| "Horde#{n}" }
end

Factory.define :alliance, :class => Faction do |f|
  f.name 'Alliance'
end

Factory.define :horde, :class => Faction do |f|
  f.name 'Horde'
end

Factory.define :role do |r|
  r.name 'Tank'
end

Factory.define :instance do |i|
  i.sequence(:name) { |n| "Naxxramas#{n}" }
  i.size 25
end

Factory.define :raid do |r|
  r.raid_time   1.week.since(Time.now)
  r.sequence(:code) { |n| "raid#{n}" }
  
  r.association :instance
  r.association :realm
  r.association :creator, :factory => :character
end

Factory.define :sign_up do |s|
  s.association :character
  s.association :role
  s.association :raid
end

Factory.define :realm do |r|
  r.sequence(:name) { |n| "Gorefiend#{n}" }
end
