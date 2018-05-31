# frozen_string_literal: true

folders = 'lib,config,models,services,controllers'
require_relative 'app.rb'

Dir.glob("#{File.dirname(__FILE__)}/**/*.rb").each do |file|
  require file
end
