#------------------------------------------------------------
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#-------------------------------------------------------------

#require 'chefspec'
#require 'chefspec/berkshelf'
#require 'poise_boiler/spec_helper'

require 'chefspec'

Dir['*_spec.rb'].each { |f| require File.expand_path(f) }
at_exit { ChefSpec::Coverage.report! }
