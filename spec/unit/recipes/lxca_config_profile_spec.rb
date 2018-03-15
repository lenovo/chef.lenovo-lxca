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
# Cookbook Name:: lxca
# Spec:: lxca_config_profile
#

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_config_profile' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_config_profile('list_all')
    expect(chef_run).to filter_by_id_lxca_config_profile('filter_by_profileid')
    expect(chef_run).to activate_config_profile_lxca_config_profile('activate_config_profile')
    expect(chef_run).to rename_config_profile_lxca_config_profile('rename_config_profile')
    expect(chef_run).to unassign_config_profile_lxca_config_profile('unassign_config_profile')
    expect(chef_run).to delete_config_profile_lxca_config_profile('delete_config_profile')
  end
end


