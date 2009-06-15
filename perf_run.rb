#!/usr/bin/env ruby
require 'chopper'
COUNT = 10000
TIMES = 10000

puts "Generating Values"
values = []
1.upto(COUNT) {|i| values << i}
needle = COUNT - 1 

Chopper.implementations.each do |klass|
  chopper = klass.new

  puts "Starting test with #{klass} class"
  start = Time.now
  1.upto(10000) do |i|
    chopper.chop(needle, values)
  end
  finish = Time.now

  puts "Searched a #{COUNT} element array #{TIMES} times in #{finish - start} seconds"
  puts
end
