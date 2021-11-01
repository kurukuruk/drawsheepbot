'youtube katy perry du cul'.match(/^youtube ((?:\w+\s?)+)/) do |m|
  p m.captures.class
  p m.captures.join.gsub(' ', '+')
end
