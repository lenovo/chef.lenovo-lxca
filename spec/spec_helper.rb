#require 'chefspec'
#require 'chefspec/berkshelf'
#require 'poise_boiler/spec_helper'

require 'chefspec'

Dir['*_spec.rb'].each { |f| require File.expand_path(f) }
at_exit { ChefSpec::Coverage.report! }
