#!/usr/bin/env ruby

require 'rubygems'
require 'whois'

words = File.open('words.txt').to_a.map{|w| w.chomp}
words << ''
availables = []

words.each do |w1|
  words.each do |w2|
    domain = "#{w1}#{w2}.com"
    begin 
      puts domain if Whois.whois(domain).available?
    rescue Timeout::Error, Errno::ECONNREFUSED
      puts "ERROR: #{domain}"
    end
  end
end
