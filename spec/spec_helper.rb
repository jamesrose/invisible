$:.unshift File.dirname(__FILE__) + "/../lib"
require 'invisible'
require 'invisible/mock'
require 'rubygems'
require 'spec'

module Helpers
  # ...
end

Spec::Runner.configure do |config|
  config.include Helpers
end