require 'flickraw'
require './PhotoSearch'
params = ARGV

puts "Testing params :- #{params}"

s = PhotoSearch.new(params[0])
s.search