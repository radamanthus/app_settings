require 'rubygems'
require 'active_support'
require 'active_support/test_case'

ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
require 'test_help'
require 'action_view/test_case'
