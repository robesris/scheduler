Factory.define :character do |c|
  c.name 'Rexerengeti'
  c.association :realm, :factory => :realm
end

Factory.define :alliance, :class => Faction do |f|
  f.name 'Alliance'
end

Factory.define :horde, :class => Faction do |f|
  f.name 'Horde'
end

Factory.define :instance do |i|
  i.name 'Naxxramas'
  i.size 25
end

Factory.define :realm do |r|
  r.name 'Gorefiend'
end
