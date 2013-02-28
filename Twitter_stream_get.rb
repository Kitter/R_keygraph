#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'rubygems'
require 'tw'

client = Tw::Client::Stream.new

loop do
	begin
	client.user_stream do |m|
	day = Time.now.strftime("%Y-%m-%d %H:%M") +'.txt'
	File.open(day,'a'){|f|
		f.puts m.to_json
		}
	end
	rescue Timeout::Error => e
		puts e.message
		puts Time.now
	rescue StandardError => e
		puts e.message
		puts Time.now
		sleep(1800)
	end
end