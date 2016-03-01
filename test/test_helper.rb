ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require "minitest/pride"

require_relative '../app.rb'



